<?php

if(!function_exists('theme_init')){
	function theme_init(){
		add_theme_support( 'post-thumbnails' );
		add_theme_support( 'title-tag' );
		register_nav_menus(
			array(
		
					'top-menu' => __('Top menu', 'theme')
			)
		);
		add_theme_support('menus');
		
	}
}
add_action('after_setup_theme', 'theme_init');

function stvori_tablicu_korisnika(){
	global $wpdb;
	$table_name = $wpdb->prefix . 'customer';
	$charset_collate = $wpdb->get_charset_collate();
	$sql = "CREATE TABLE IF NOT EXISTS $table_name (
		user_id mediumint(9) NOT NULL, 
		registered_date datetime NOT NULL, 
		user_name_surname text NOT NULL,
		email text NOT NULL, 
		smjer text NOT NULl,
		user_pass text NOT NULL, 
		PRIMARY KEY (user_id)
	)$charset_collate;";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta( $sql );
}
add_action('after_setup_theme', 'stvori_tablicu_korisnika');

function stvori_tablicu_posudene_knjige(){
	global $wpdb;
	$table_name = $wpdb->prefix . 'customer_book';
	$charset_collate = $wpdb->get_charset_collate();
	$sql = "CREATE TABLE IF NOT EXISTS $table_name(
		order_id MEDIUMINT NOT NULL AUTO_INCREMENT,  
		user_id MEDIUMINT(9) NOT NULL, 
		book_id MEDIUMINT(9) NOT NULL, 
		date_rented DATE,
		active BOOLEAN NOT NULL,
		PRIMARY KEY (order_id)
	)$charset_collate;";
	require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
	dbDelta($sql);
}

function posudi_knjige_iz_kosarice($kosarica){
	global $wpdb;
	$wpdb->show_errors();
	foreach($kosarica as $a){
		if($wpdb->INSERT('wp_customer_book', array(
			'active' => true,
			'book_id' => $a->knjiga_id, 
			'date_rented'=> current_time('mysql', 1),
			'user_id' => $a->korisnik_id
		))===false){
			echo $wpdb->print_error();
		}else{
			echo 1;
		}
	}
	die();

}
function vrati_kosaricu(){
	if(isset($_SESSION['kosarica'])){
		return $_SESSION['kosarica'];
	}
	else return null;
}
add_action('after_setup_theme', 'stvori_tablicu_posudene_knjige');
//session ne radi bez ovog?
function register_session(){
    if( !session_id() )
        session_start();
}
add_action('init','register_session');

function registriraj_korisnika(){
	global $wpdb;
	$wpdb->show_errors();
	$email = $_POST['email'];
	$password = $_POST['password'];
	$user_id = mt_rand(0, 8388607);
	$user_name_surname = $_POST['name_surname'];
	$smjer = $_POST['smjer'];
	if($wpdb->INSERT('wp_customer', array(
		'email' => $email,
		'user_name_surname' => $user_name_surname,
		'registered_date' => current_time('mysql', 1), 
		'user_id' => $user_id,
		'smjer' => $smjer,
		'user_pass' => $password
	)) === false){
		$wpdb->print_error();
		echo 'Error';
	}else{
		echo "Korisnik '".$email."'uspješno dodan, ID retka je ".$wpdb->insert_id."";
	}
	die();
}
add_action('wp_ajax_registriraj_korisnika', 'registriraj_korisnika');
add_action('wp_ajax_nopriv_registriraj_korisnika', 'registriraj_korisnika');

function dodaj_u_kosaricu(){
	$knjiga_id = $_POST['knjiga_id'];
	if(isset($_SESSION['kosarica'])){
		if(!in_array($knjiga_id, $_SESSION['kosarica'])){
			array_push($_SESSION['kosarica'], $knjiga_id);
			echo json_encode($_SESSION['kosarica']);
		}else{
			echo 0;
		}
	}
}
add_action('wp_ajax_dodaj_u_kosaricu', 'dodaj_u_kosaricu');
add_action('wp_ajax_nopriv_dodaj_u_kosaricu', 'dodaj_u_kosaricu');

function makni_iz_kosarice(){
	$knjiga_id = $_POST['knjiga_id'];
	$key = array_search($knjiga_id, $_SESSION['kosarica']);
	if($key !== false){
		unset($_SESSION['kosarica'][$key]);
		echo 1;
	}
	echo 0;
	
}
add_action('wp_ajax_makni_iz_kosarice', 'makni_iz_kosarice');
add_action('wp_ajax_nopriv_makni_iz_kosarice', 'makni_iz_kosarice');

function dovrsi_narudzbu(){
	//echo json_encode($_POST['ids']);
	global $wpdb;
	$wpdb->show_errors();
	$ids = $_POST['ids'];
	//insert values to table
	for($i = 0; $i < sizeof($ids); $i++){
		if($wpdb->INSERT('wp_customer_book', array(
			'active' => 1,
			'book_id' => $ids[$i],
			'date_rented' => current_time('mysql', 1),
			'user_id' => $_SESSION['user_id']
		)) === false){
			echo $wpdb->print_error();
		}else{
			//update 'dostupno' taksonomiju na novi broj dostupnih knjiga
			update_dostupnost($ids[$i]);
			continue;
		}
	}
	//resetiraj košaricu 
	$_SESSION['kosarica'] = array();

	echo 1;
	die();
}
add_action('wp_ajax_dovrsi_narudzbu', 'dovrsi_narudzbu');
add_action('wp_ajax_nopriv_dovrsi_narudzbu', 'dovrsi_narudzbu');

function update_dostupnost($book_id){
	$knjiga = vrati_knjigu_poId($book_id);
	$dostupnost = $knjiga->dostupnost - 1;
	wp_set_post_terms($book_id, strval($dostupnost), 'dostupno');
}

function update_dostupnost_dodaj($book_id){
	$knjiga = vrati_knjigu_poId($book_id);
	$dostupnost = $knjiga->dostupnost + 1;
	wp_set_post_terms($book_id, strval($dostupnost), 'dostupno');
}
add_action( 'init', 'update_dostupnost', 20 );
add_action( 'init', 'update_dostupnost_dodaj', 20 );

function prijavi_korisnika(){
	global $wpdb;
	$wpdb->show_errors();
	$email = $_POST['email'];
	$password = $_POST['password'];
	$table_name = 'wp_customer';
	$results = $wpdb->get_row(
		$wpdb->prepare("SELECT * FROM $table_name WHERE email = %s AND user_pass = %s", $email, $password)
	);
	echo json_encode($results);
	if($results){
		session_start();
		$_SESSION['kosarica'] = array();
		$_SESSION['user_id'] = $results->user_id;
		$_SESSION['user_name'] = $results->user_name_surname;
		
	}die();
}
add_action('wp_ajax_prijavi_korisnika', 'prijavi_korisnika');
add_action('wp_ajax_nopriv_prijavi_korisnika', 'prijavi_korisnika');

function vrati_sessionId(){
	if(isset($_SESSION['user_id'])){
		$user = array(
			"user_id" => (string)$_SESSION['user_id'], 
			"user_name" => (string)$_SESSION['user_name']
		);
		echo json_encode($user);
	}else{
		return;
	}
}

add_action('wp_ajax_vrati_sessionId', 'vrati_sessionId');
add_action('wp_ajax_nopriv_vrati_sessionId', 'vrati_sessionId');


function odjavi_korisnika(){
	if(isset($_SESSION['user_id'])){
		session_destroy();
		return;	
	}
	else return;
}
add_action('wp_ajax_odjavi_korisnika', 'odjavi_korisnika');
add_action('wp_ajax_nopriv_odjavi_korisnika', 'odjavi_korisnika');

function vrati_user_info(){
	global $wpdb;
	$table_name = 'wp_customer';
	$userId = $_SESSION['user_id'];
	$results = $wpdb->get_row(
		$wpdb->prepare("SELECT * FROM $table_name WHERE user_id = %d", $userId)
	); 
	return $results;
}
function vrati_knjige_korisnika(){
	global $wpdb; 
	$table_name = 'wp_customer_book';
	$userId = $_SESSION['user_id'];
	$results = $wpdb->get_results(
		$wpdb->prepare("SELECT * FROM $table_name WHERE user_id = %d AND active = 1", $userId)
	);
	return $results;
}
function promijeni_status_knjige(){
	global $wpdb;
	$table_name = 'wp_customer_book';
	$userId = $_SESSION['user_id'];
	$knjigaId = $_POST['knjiga_id'];
	$wpdb->update( $table_name, array( 'active' => 0), array('user_id'=>$userId, 'book_id'=>$knjigaId));
	update_dostupnost_dodaj($knjigaId);
	return 0;

}
add_action('wp_ajax_promijeni_status_knjige', 'promijeni_status_knjige');
add_action('wp_ajax_nopriv_promijeni_status_knjige', 'promijeni_status_knjige');
function vrati_smjer_poId($id){
	$smjerovi = daj_smjerove();
	foreach($smjerovi as $a){
		if($a->ID == $id) return $a->post_title;
	}
	return null;
}
add_action('wp_ajax_vrati_user_info', 'vrati_user_info');
add_action('wp_ajax_nopriv_vrati_user_info', 'vrati_user_info');

function arhiva_search(){
	global $wpdb;
	$query = $_POST['query'];
	$table_name = 'wp_posts';
	$results = $wpdb->get_results(
		$wpdb->prepare("SELECT P.ID FROM $table_name AS P WHERE P.post_type = 'knjiga' and P.post_status = 'publish' and P.post_title LIKE '%".$query."%' ORDER BY post_title")
	);
	echo stvori_search_html($results);

}
add_action('wp_ajax_arhiva_search', 'arhiva_search');
add_action('wp_ajax_nopriv_arhiva_search', 'arhiva_search');

//moguće jako kriminalno 
//funkciji se kao parametar predaju rezultati query-a
//funkcija potom stvara html sadržaj, koji se preko ajax success callback funkcije appenda na archive-knjiga.php
function stvori_search_html($results){
	$sva_djela = array();
	foreach($results as $a){
		array_push($sva_djela, vrati_knjigu_poId($a->ID));
	}
	$sHtml = "";
	if(sizeof($sva_djela)!= 0){
		$sHtml .= '<p class="h6">Pronađeno: '.sizeof($sva_djela).' rezultata.</p><hr>';
		$sHtml .= '<div class=row>';
		foreach ($sva_djela as $a) {
			$sHtml .= "<div class='col-lg-3 col-sm-12'>";
			$ime_autora = get_post_meta($a->id_knjige, 'autori_knjige', true);
			$autor_obj = vrati_autora($ime_autora);
			$sHtmlKategorije = "";
			foreach ($a->kategorije as $kates) {
				foreach ($kates as $b) {
					$sHtmlKategorije .= $b->kategorija_ime . ", ";
				}
			}
			$sHtmlKategorije = substr($sHtmlKategorije, 0, -2);
			//set link
			$sHtml .= '
				<div class="hover_class">
					<h5>' . $a->ime_knjige . '</h5>
					<a href=' . $a->guid . '><i class="fas fa-link"></i></a>
				</div>
			';
			if ($a->istaknuta_slika) {
				$sHtml .= "<img class='archive-knjige' src='" . $a->istaknuta_slika . "'>";
			} else {
				$sHtml .= "<img class='archive-knjige' src='" . get_template_directory_uri() . '/images/no_image.png' . "'>";
			}
			$sHtml .= "<p style='margin-bottom: -3px;'>Autor: <a style='styled_links' href='" . $autor_obj->guid . "'>" . $autor_obj->post_title . '</a></p>';
			$sHtml .= "<p style='margin-bottom: 25px;'>Kategorije: " . $sHtmlKategorije . "</p>";
			$sHtml .= '</div>';
		}
		$sHtml .= '</div></div>';
	}else{
		$sHtml .= "<h4>Nema rezultata pretrage.</h4>";
	}

	return $sHtml;
}
function formatiraj_datum($datum){
	$format = 'Y-m-d H:i:s';
	$date = DateTime::createFromFormat($format, $datum);
	return $date->format('d-m-Y');
}

function repo_search(){
	global $wpdb;
	$query = $_POST['query'];
	$table_name = 'wp_posts';
	$results = $wpdb->get_results(
		$wpdb->prepare("SELECT P.ID FROM $table_name AS P WHERE P.post_type = 'rad' and P.post_status = 'publish' and P.post_title LIKE '%".$query."%' ORDER BY post_title")
	);
	echo stvori_repo_html($results);
}
add_action('wp_ajax_repo_search', 'repo_search');
add_action('wp_ajax_nopriv_repo_search', 'repo_search');
function stvori_repo_html($results){
	$radovi = array();
	foreach($results as $a){
		array_push($radovi, daj_rad_poId($a->ID));
	}
	$html = "";
	if(sizeof($radovi)!=0){
		foreach($radovi as $a){
			$html .= '
			<div style="margin-top:25px;"class="list-group-item flex-column align-items-start">
				<div class="d-flex w-100 justify-content-between">
					<h5 class="mb-1" style="color:#0174b2;">'.$a->ime_rada.'</h5>
					<small><strong>Datum dodavanja:</strong>'.$a->datum_objave.'</small>
				</div>
				<p class="mb-1">'.skrati_tekst_tekst($a->sadrzaj, 260).'</p>
				<small><strong>Smjer:</strong>'.$a->smjer.'</small><br>
				<small><a href="'.$a->guid.'"><i class="far fa-eye" style="padding-right:5px;"></i>Pogledaj</a></small>
			</div>
			';
		}
	}else{
		$html .= "<h4>Nema rezultata pretrage.</h4>";
	}


	return $html;


}

function vrati_smjer($ime){
	$args = array(
		'posts_per_page' => -1,
		'post_type' => 'smjer',
		'post_status' => 'publish'
		);
	$popisSmjerova = get_posts($args);
	foreach ($popisSmjerova as $a){
		if($a->post_title == $ime){
			$autor = $a;
			break;
		}
	}
	return $autor;
}
function vrati_mentora($ime){
	$args = array(
		'posts_per_page' => -1,
		'post_type' => 'mentor',
		'post_status' => 'publish'
		);
	$popisAutora = get_posts($args);
	foreach ($popisAutora as $a){
		if($a->post_title == $ime){
			$autor = $a;
			break;
		}
	}
	return $autor;
}
function vrati_autora($ime){
	$args = array(
		'posts_per_page' => -1,
		'post_type' => 'autor',
		'post_status' => 'publish'
		);
	$popisAutora = get_posts($args);
	foreach ($popisAutora as $a){
		if($a->post_title == $ime){
			$autor = $a;
			break;
		}
	}
	return $autor;
	//console_log($autor);
}
function skratiTekst($knjiga){
	if(strlen($knjiga->post_content) > 120){
		return substr($knjiga->post_content, 0, 80)."...";
	}
	return $knjiga->post_content;
}

function skrati_tekst_tekst($tekst, $duljina){
	if(strlen($tekst) > $duljina){
		return substr($tekst,0,$duljina)."...";
	}else{
		return $tekst;
	}
}
function daj_smjerove(){
	$args = array(
		'posts_per_page' => -1,
		'post_type' => 'smjer',
		'post_status' => 'publish'
	);
	return get_posts($args);
}

function daj_radove(){
	$returnList = array();
	$args = array(
		'posts_per_page' => -1,
		'post_type' => 'rad',
		'post_status' => 'publish'
	);
	$radovi = get_posts ($args);
	foreach($radovi as $a){
		$smjer = get_post_meta($a->ID, 'smjer_rada',true);
		$obj = (object)[
			'id_rada' => $a->ID, 
			'ime_rada' => $a->post_title, 
			'guid' => $a->guid,
			'datum_objave' => $a->post_date,
			'sadrzaj' => $a->post_content,
			'smjer' => $smjer,
			'vrsta' => '',
			'ustanova' => '',
			'autor_rada' => ''
		];
		$taxs = get_the_terms($a->ID, 'vrsta_rada');
		if(!empty($taxs) && !is_wp_error($taxs)){
			foreach($taxs as $b){
				$obj->vrsta = $b->name;
			}
		}
		$taxs = get_the_terms($a->ID, 'ustanova');
		if(!empty($taxs) && !is_wp_error($taxs)){
			foreach($taxs as $b){
				$obj->ustanova = $b->name;
			}
		}
		$taxs = get_the_terms($a->ID, 'autor_rada');
		if(!empty($taxs) && !is_wp_error($taxs)){
			foreach($taxs as $b){
				$obj->autor_rada = $b->name;
			}
		}
		array_push($returnList, $obj);
	}
	return $returnList;
}

function daj_knjige(){
	$returnList = array();
	$args = array(
		'posts_per_page' => -1,
		'post_type' => 'knjiga',
		'post_status' => 'publish'
		);
	$popisKnjiga = get_posts($args);
	foreach($popisKnjiga as $a){
		$taxs = get_the_terms($a->ID, 'kategorija');
		$obj = (object)[
			'id_knjige' => $a->ID,
			'ime_knjige' => $a->post_title,
			'istaknuta_slika' => get_the_post_thumbnail_url($a->ID),
			'guid' => $a->guid,
			'post_content' => $a->post_content,
			'broj_stranica' => 0,
			'kata_broj' => 0,
			'izdavac' => '',
			'dostupnost' => 0, 
			'kategorije' => array()
		];
		if(!empty($taxs) && !is_wp_error($taxs)){
			$kategorije = array();
			foreach($taxs as $term){
				$kates = (object)[
					'kategorija_ime' => $term->name,
					'kategorija_slug' => $term->slug
				];
				array_push($kategorije, $kates);
			}
			array_push($obj->kategorije, $kategorije);
		}
		$taxs = get_the_terms($a->ID, 'broj_stranica');
		if(!empty($taxs) && !is_wp_error($taxs)){
			foreach($taxs as $b){
				$obj->broj_stranica = $b->name;
			}
		}
		$taxs = get_the_terms($a->ID, 'kata_broj');
		if(!empty($taxs) && !is_wp_error($taxs)){
			foreach($taxs as $b){
				$obj->kata_broj = $b->name;
			}
		}
		$taxs = get_the_terms($a->ID, 'izdavac');
		if(!empty($taxs) && !is_wp_error($taxs)){
			foreach($taxs as $b){
				$obj->izdavac .= $b->name;
			}
		}
		$taxs = get_the_terms($a->ID, 'dostupno');
		if(!empty($taxs) && !is_wp_error($taxs)){
			foreach($taxs as $b){
				$obj->dostupnost = $b->name;
			}
		}
		array_push($returnList, $obj);
	}
	return $returnList;
	
}

//posalji polja kao parametar da ih ne moramo ucitavati dvaput
function preporuci_knjige($knjige_korisnika, $sve_knjige){
	if(!sizeof($knjige_korisnika) == 0){
		$kategorije = array();
		$preporucena_djela = array();
		$ids = array();
		foreach($knjige_korisnika as $a){
			array_push($ids, $a->book_id);
			$knjiga = vrati_knjigu_poId($a->book_id);
			foreach ($knjiga->kategorije as $b) {
				foreach ($b as $c) {
					array_push($kategorije, $c->kategorija_ime);
				}
			}
		}
		foreach($sve_knjige as $a){
			foreach($a->kategorije as $b){
				foreach($b as $c){ //ista kategorija                 //nije duplikat                     //nije već posuđena knjiga
					if(in_array($c->kategorija_ime, $kategorije) && !in_array($a, $preporucena_djela) && !in_array($a->id_knjige, $ids)){
						array_push($preporucena_djela, $a);
					}
				}
			}
		}
		return $preporucena_djela;
	}
	else{
		echo 0;
	}

}

function daj_knjige_autora($autor){
	$returnList = array();
	$sva_djela = daj_knjige();
	foreach($sva_djela as $a){
		$ime_autora = get_post_meta($a->id_knjige, 'autori_knjige', true);            
		if($ime_autora == $autor){
			array_push($returnList, $a);
		}
	}
	return $returnList;
}

function daj_radove_mentora($mentor){
	$returnList = array();
	$svi_radovi = daj_radove();
	foreach($svi_radovi as $a){
		$ime_mentora = get_post_meta($a->id_rada, 'mentor_rada', true);
		if($ime_mentora == $mentor){
			array_push($returnList, $a);
		}
	}
	return $returnList;
}

function vrati_knjigu_poId($id){
	$popisKnjiga = daj_knjige();
	foreach($popisKnjiga as $a){
		if($id == $a->id_knjige){
			return $a;
		}
	}
	return null;

}


function daj_rad_poId($id){
	$popisRadova = daj_radove();
	foreach($popisRadova as $a){
		if($id == $a->id_rada){
			return $a;
		}
	}
	return null;
}

function add_meta_box_knjige(){
	add_meta_box('vsmti_knjige_autori', 'Autori', 'html_meta_box_knjige', 'knjiga');
}
function add_meta_box_smjer(){
	add_meta_box('vsmti_smjer_rada', 'Smjer', 'html_meta_box_smjer', 'rad');
}
function add_meta_box_mentor(){
	add_meta_box('vsmti_mentor_rada', 'Mentor', 'html_meta_box_mentor', 'rad');
}
function metabox_callback($post, $metabox){
	echo get_post_meta($post->ID, 'knjiga', true);
}
function metabox_callbackSm($post, $metabox){
	echo get_post_meta($post->ID, 'rad', true);
}

add_action ('add_meta_boxes', 'add_meta_box_knjige');
add_action('add_meta_boxes', 'add_meta_box_smjer');
add_action('add_meta_boxes', 'add_meta_box_mentor');
add_action('save_post', 'spremi_smjer_rada');
add_action ('save_post', 'spremi_autora_knjige');
add_action('save_post', 'spremi_mentora_rada');

//SMJER - TAKSONOMIJE I META BOXOVI

function registriraj_smjer_cpt() {

	$labels = array(
		'name'                  => 'Smjerovi',
		'singular_name'         => 'Smjer',
		'menu_name'             => 'Smjer',
		'name_admin_bar'        => 'Smjer',
		'archives'              => 'Smjer Arhiva',
		'attributes'            => 'Atributi',
		'parent_item_colon'     => 'Roditeljski elementi',
		'all_items'             => 'Svi smjerovi',
		'add_new_item'          => 'Dodaj smjer',
		'add_new'               => 'Dodaj novi',
		'new_item'              => 'Novi Smjer',
		'edit_item'             => 'Uredi Smjer',
		'update_item'           => 'Ažuriraj Smjer',
		'view_item'             => 'Pogledaj Smjer',
		'view_items'            => 'Pogledaj Smjerove',
		'search_items'          => 'Pretraži Smjerove',
		'not_found'             => 'Nije pronađeno',
		'not_found_in_trash'    => 'Nije pronađeno u smeću',
		'featured_image'        => 'Istaknutu slika',
		'set_featured_image'    => 'Postavi istaknutu sliku',
		'remove_featured_image' => 'Ukloni istaknutu sliku',
		'use_featured_image'    => 'Postavi za istaknutu sliku',
		'insert_into_item'      => 'Umetni',
		'uploaded_to_this_item' => 'Preneseno',
		'items_list'            => 'Lista smjerova',
		'items_list_navigation' => 'Navigacija među smjerovima',
		'filter_items_list'     => 'Filtriranje Smjerova',
	);
	$args = array(
		'label'                 => 'Smjer',
		'description'           => 'Smjer',
		'labels'                => $labels,
		'supports'              => array( 'title', 'editor' ),
        'menu_icon' => 'dashicons-bank',
		'hierarchical'          => false,
		'public'                => true,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_position'         => 5,
		'show_in_admin_bar'     => true,
		'show_in_nav_menus'     => true,
		'can_export'            => true,
		'has_archive'           => true,
		'exclude_from_search'   => false,
		'publicly_queryable'    => true,
		'capability_type'       => 'page',
	);
	register_post_type( 'smjer', $args );
}
add_action( 'init', 'registriraj_smjer_cpt', 0 );

/*						CPT - TAX - METABOX  
--------------------------------------------------------------------------------------------------------------------
*/

function registraj_footere(){
	register_sidebar(
		array (
			'name' => "Footer sidebar 1",
			'id' => 'footer-sidebar1',
			'description' => "Footer sidebar 1",
			'before_widget' => '<div class="footer-sidebar">',
			'after_widget' => "</div>",
			'before_title' => '<h4 class="footer-sidebar-title">',
			'after_title' => '</h4>',
		)
	);
	register_sidebar(
		array (
			'name' => "Footer sidebar 2",
			'id' => 'footer-sidebar2',
			'description' => "Footer sidebar 2",
			'before_widget' => '<div class="footer-sidebar">',
			'after_widget' => "</div>",
			'before_title' => '<h4 class="footer-sidebar-title">',
			'after_title' => '</h4>',
		)
	);
	
	register_sidebar(
		array (
			'name' => "Footer sidebar 3",
			'id' => 'footer-sidebar3',
			'description' => "Footer sidebar 3",
			'before_widget' => '<div class="footer-sidebar">',
			'after_widget' => "</div>",
			'before_title' => '<h4 class="footer-sidebar-title">',
			'after_title' => '</h4>',
		)
	);
}

add_action( 'widgets_init', 'registraj_footere' );



//KNJIGE CPT - TAKSONOMIJE I METABOXOVI
function registriraj_knjige_cpt() {

	$labels = array(
		'name'                  => 'Knjige',
		'singular_name'         => 'Knjiga',
		'menu_name'             => 'Knjiga',
		'name_admin_bar'        => 'Knjige',
		'archives'              => 'Knjige Arhiva',
		'attributes'            => 'Atributi',
		'parent_item_colon'     => 'Roditeljski elementi',
		'all_items'             => 'Sve Knjige',
		'add_new_item'          => 'Dodaj Knjigu',
		'add_new'               => 'Dodaj novu',
		'new_item'              => 'Nova Knjiga',
		'edit_item'             => 'Uredi Knjigu',
		'update_item'           => 'Ažuriraj Knjigu',
		'view_item'             => 'Pogledaj Knjigu',
		'view_items'            => 'Pogledaj Knjige',
		'search_items'          => 'Pretraži Knjige',
		'not_found'             => 'Nije pronađeno',
		'not_found_in_trash'    => 'Nije pronađeno u smeću',
		'featured_image'        => 'Istaknutu slika',
		'set_featured_image'    => 'Postavi istaknutu sliku',
		'remove_featured_image' => 'Ukloni istaknutu sliku',
		'use_featured_image'    => 'Postavi za istaknutu sliku',
		'insert_into_item'      => 'Umetni',
		'uploaded_to_this_item' => 'Preneseno',
		'items_list'            => 'Lista',
		'items_list_navigation' => 'Navigacija među knjigama',
		'filter_items_list'     => 'Filtriranje Knjiga',
	);
	$args = array(
		'label'                 => 'Knjiga',
		'description'           => 'Knjiga',
		'labels'                => $labels,
		'supports'              => array( 'title', 'editor', 'thumbnail', 'revisions' ),
        'menu_icon'             => 'dashicons-book-alt',
		'hierarchical'          => false,
		'public'                => true,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_position'         => 5,
		'show_in_admin_bar'     => true,
		'show_in_nav_menus'     => true,
		'can_export'            => true,
		'has_archive'           => true,
		'exclude_from_search'   => false,
		'publicly_queryable'    => true,
		'capability_type'       => 'page',
	);
	register_post_type( 'knjiga', $args );
}
// Register Custom Taxonomy
function registriraj_dostupno_taksonomiju() {

	$labels = array(
		'name'                       => 'Dostupnost',
		'singular_name'              => 'Dostupno',
		'menu_name'                  => 'Dostupnost',
		'all_items'                  => '',
		'parent_item'                => 'Roditeljski elementi',
		'parent_item_colon'          => 'Roditeljski elementi:',
		'new_item_name'              => 'Novi broj dostupnih',
		'add_new_item'               => 'Dodaj novi broj dostupnih',
		'edit_item'                  => 'Uredi dostupnost',
		'update_item'                => 'Ažuriraj dostupnost',
		'view_item'                  => 'Pogledaj dostupnost',
		'separate_items_with_commas' => 'Odvoji zarezom',
		'add_or_remove_items'        => 'Dodaj ili ukloni dostupnost',
		'choose_from_most_used'      => 'Odaberi među najčešće korištenim',
		'popular_items'              => 'Popularno',
		'search_items'               => 'Pretraži',
		'not_found'                  => 'Nije pronađeno',
		'no_terms'                   => 'Nema dostupnosti',
		'items_list'                 => 'Lista',
		'items_list_navigation'      => 'Lista s navigacijom',
	);
	$args = array(
		'labels'                     => $labels,
		'hierarchical'               => false,
		'public'                     => true,
		'show_ui'                    => true,
		'show_admin_column'          => true,
		'show_in_nav_menus'          => true,
		'show_tagcloud'              => true,
	);
	register_taxonomy( 'dostupno', array( 'knjiga' ), $args );

}
function registriraj_taksonomiju_kataloski_broj() {

	$labels = array(
		'name'                       => 'Kataloški brojevi',
		'singular_name'              => 'Kataloški broj',
		'menu_name'                  => 'Kataloški broj',
		'all_items'                  => 'Svi kataloški brojevi',
		'parent_item'                => 'Roditeljski brojevi',
		'parent_item_colon'          => 'Roditeljski brojevi',
		'new_item_name'              => 'Novi kataloški broj',
		'add_new_item'               => 'Dodaj kataloški broj',
		'edit_item'                  => 'Uredi kataloški broj',
		'update_item'                => 'Ažuriraj kataloški broj',
		'view_item'                  => 'Pogledaj kataloški broj',
		'separate_items_with_commas' => 'Odvojite kataloške brojeve zarezima',
		'add_or_remove_items'        => 'Dodaj ili ukloni kataloški broj',
		'choose_from_most_used'      => 'Odaberi među najčešće korištenima',
		'popular_items'              => 'Popularni kataloški brojevi',
		'search_items'               => 'Pretraga',
		'not_found'                  => 'Nema rezultata',
		'no_terms'                   => 'Nema kataloškog broja',
		'items_list'                 => 'Lista kataloških brojeva',
		'items_list_navigation'      => 'Navigacija',
	);
	$args = array(
		'labels'                     => $labels,
		'hierarchical'               => false,
		'public'                     => true,
		'show_ui'                    => true,
		'show_admin_column'          => true,
		'show_in_nav_menus'          => true,
		'show_tagcloud'              => true,
	);
	register_taxonomy( 'kata_broj', array( 'knjiga' ), $args );

}
function registriraj_taksonomiju_kategorija() {

	$labels = array(
		'name'                       => 'Kategorije',
		'singular_name'              => 'Kategorija',
		'menu_name'                  => 'Kategorije',
		'all_items'                  => 'Sve katergorije',
		'parent_item'                => 'Roditeljske kategorije',
		'parent_item_colon'          => 'Roditeljske kategorije',
		'new_item_name'              => 'Nova kategorija',
		'add_new_item'               => 'Dodaj novu kategoriju',
		'edit_item'                  => 'Uredi kategoriju',
		'update_item'                => 'Ažuriraj kategoriju',
		'view_item'                  => 'Pogledaj kategoriju',
		'separate_items_with_commas' => 'Odvoji kategorije zarezima',
		'add_or_remove_items'        => 'Dodaj ili ukloni kategoriju',
		'choose_from_most_used'      => 'Odaberi među najčešće korištenima',
		'popular_items'              => 'Popularne kategorije',
		'search_items'               => 'Pretraži kategorije',
		'not_found'                  => 'Nije pronađeno',
		'no_terms'                   => 'Nema kategorije',
		'items_list'                 => 'Lista kategorija',
		'items_list_navigation'      => 'Navigacija',
	);
	$args = array(
		'labels'                     => $labels,
		'hierarchical'               => false,
		'public'                     => true,
		'show_ui'                    => true,
		'show_admin_column'          => true,
		'show_in_nav_menus'          => true,
		'show_tagcloud'              => true,
	);
	register_taxonomy( 'kategorija', array( 'knjiga' ), $args );

}
// Register Custom Taxonomy
function registriraj_taksonomiju_broj_stranica() {

	$labels = array(
		'name'                       => 'Brojevi stranica',
		'singular_name'              => 'Broj stranica',
		'menu_name'                  => 'Broj stranica',
		'all_items'                  => 'Svi br str',
		'parent_item'                => 'Roditeljski element',
		'parent_item_colon'          => 'Roditeljski element',
		'new_item_name'              => 'Novi broj stranica',
		'add_new_item'               => 'Dodaj broj stranica',
		'edit_item'                  => 'Uredi broj stranica',
		'update_item'                => 'Ažuriraj broj stranica',
		'view_item'                  => 'Pogledaj broj stranica',
		'separate_items_with_commas' => 'Odvoji zarezom',
		'add_or_remove_items'        => 'Dodaj ili ukloni broj stranica',
		'choose_from_most_used'      => 'Odaberi među najčešće korištenim',
		'popular_items'              => 'Popularni brojevi stranica',
		'search_items'               => 'Pretraži brojeve stranica',
		'not_found'                  => 'Nije pronađeno',
		'no_terms'                   => 'Nema broja',
		'items_list'                 => 'Lista',
		'items_list_navigation'      => 'Navigacija',
	);
	$args = array(
		'labels'                     => $labels,
		'hierarchical'               => false,
		'public'                     => true,
		'show_ui'                    => true,
		'show_admin_column'          => true,
		'show_in_nav_menus'          => true,
		'show_tagcloud'              => true,
	);
	register_taxonomy( 'broj_stranica', array( 'knjiga' ), $args );

}
// Register Custom Taxonomy
function registriraj_taksonomiju_izdavac() {

	$labels = array(
		'name'                       => 'Izdavači',
		'singular_name'              => 'Izdavač',
		'menu_name'                  => 'Izdavač',
		'all_items'                  => 'Svi izdavači',
		'parent_item'                => 'Roditeljski element',
		'parent_item_colon'          => 'Roditeljski element',
		'new_item_name'              => 'Novi izdavač',
		'add_new_item'               => 'Dodaj izdavača',
		'edit_item'                  => 'Uredi izdavača',
		'update_item'                => 'Ažuriraj izdavača',
		'view_item'                  => 'Pogledaj izdavača',
		'separate_items_with_commas' => 'Odvoji zarezom',
		'add_or_remove_items'        => 'Dodaj ili ukloni izdavača',
		'choose_from_most_used'      => 'Odaberi među najčešće korištenim',
		'popular_items'              => 'Popularni izdavači',
		'search_items'               => 'Pretraži izdavače',
		'not_found'                  => 'Nije pronađeno',
		'no_terms'                   => 'Nema izdavača',
		'items_list'                 => 'Lista',
		'items_list_navigation'      => 'Navigacija',
	);
	$args = array(
		'labels'                     => $labels,
		'hierarchical'               => false,
		'public'                     => true,
		'show_ui'                    => true,
		'show_admin_column'          => true,
		'show_in_nav_menus'          => true,
		'show_tagcloud'              => true,
	);
	register_taxonomy( 'izdavac', array( 'knjiga' ), $args );

}
add_action( 'init', 'registriraj_knjige_cpt', 0 );
add_action( 'init', 'registriraj_taksonomiju_kataloski_broj', 0 );
add_action ('init', 'registriraj_taksonomiju_kategorija', 0);
add_action('init', 'registriraj_taksonomiju_broj_stranica', 0);
add_action( 'init', 'registriraj_dostupno_taksonomiju', 0 );
add_action( 'init', 'registriraj_taksonomiju_izdavac', 0 );


// Register Custom Post Type
function registriraj_autor_cpt() {

	$labels = array(
		'name'                  => 'Autori',
		'singular_name'         => 'Autor',
		'menu_name'             => 'Autori',
		'name_admin_bar'        => 'Autor',
		'archives'              => 'Autori arhiva',
		'attributes'            => 'Atributi',
		'parent_item_colon'     => 'Roditeljski element',
		'all_items'             => 'Svi autori',
		'add_new_item'          => 'Dodaj novog autora',
		'add_new'               => 'Dodaj novi',
		'new_item'              => 'Novi autor',
		'edit_item'             => 'Uredi autora',
		'update_item'           => 'Ažuriraj autora',
		'view_item'             => 'Pogledaj autora',
		'view_items'            => 'Pogledaj autore',
		'search_items'          => 'Pretraži autore',
		'not_found'             => 'NIje pronađeno',
		'not_found_in_trash'    => 'Nije pronađeno u smeću',
		'featured_image'        => 'Istaknutu slika',
		'set_featured_image'    => 'Postavi istaknutu sliku',
		'remove_featured_image' => 'Ukloni istaknutu sliku',
		'use_featured_image'    => 'Postavi za istaknutu sliku',
		'insert_into_item'      => 'Umetni',
		'uploaded_to_this_item' => 'Preneseno',
		'items_list'            => 'Lista',
		'items_list_navigation' => 'Navigacija među autorima',
		'filter_items_list'     => 'Filtriranje',
	);
	$args = array(
		'label'                 => 'Autor',
		'description'           => 'Autor',
		'labels'                => $labels,
		'supports'              => array( 'title', 'editor', 'thumbnail' ),
		'hierarchical'          => false,
		'public'                => true,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_position'         => 5,
		'menu_icon' 			=> 'dashicons-edit',
		'show_in_admin_bar'     => true,
		'show_in_nav_menus'     => true,
		'can_export'            => true,
		'has_archive'           => true,
		'exclude_from_search'   => false,
		'publicly_queryable'    => true,
		'capability_type'       => 'page',
	);
	register_post_type( 'autor', $args );

}
add_action( 'init', 'registriraj_autor_cpt', 0 );

function html_meta_box_knjige()
{
	$post_id = get_the_ID();
	wp_nonce_field('spremi_autora_knjige', 'autor_knjige_nonce');
	$autor = get_post_meta($post_id, 'autori_knjige', true);
	echo '
		<div>
			<div>
				<label for="autori_knjige">Autori: </label>
				<select id="autori_knjige" name="autori_knjige" style="width: 60%; height: 60px; margin-left: 10px;">
				'.
				$args = array(
					'posts_per_page' => -1,
					'post_type' => 'autor', 
					'post_status' => 'publish'
				);
				$autori = get_posts($args);
				$html = " ";
				foreach($autori as $a){
					$selected = "";
					if($autor == $a->post_title){
						$selected = "selected";
					};
					$html .= '<option value="'.$a->post_title.'" '. $selected .' >'.$a->post_title.'</option>';
				}
				echo $html.'</select> 
			</div>
		</div>';
}

function html_meta_box_smjer(){
	$post_id = get_the_ID();
	wp_nonce_field('spremi_smjer_rada', 'smjer_rada_nonce');
	$smjer = get_post_meta($post_id, 'smjer_rada', true);
	echo '
	<div>
		<div>
			<label for="autori_knjige">Smjerovi: </label>
			<select id="smjer_rada" name="smjer_rada" style="width: 60%; height: 60px; margin-left: 10px;">
			'.
			$args = array(
				'posts_per_page' => -1,
				'post_type' => 'smjer', 
				'post_status' => 'publish'
			);
			$smjerovi = get_posts($args);
			$html = " ";
			foreach($smjerovi as $a){
				$selected = "";
				if($smjer == $a->post_title){
					$selected = "selected";
				};
				$html .= '<option value="'.$a->post_title.'" '. $selected .' >'.$a->post_title.'</option>';
			}
			echo $html.'</select> 
		</div>
	</div>';

}

function html_meta_box_mentor(){
	$post_id = get_the_id();
	wp_nonce_field('spremi_mentora_rada', 'mentor_rada_nonce');
	$mentor = get_post_meta($post_id, 'mentor_rada', true);
	echo '
	<div>
		<div>
			<label for="mentor_rada">Mentori: </label>
			<select id="mentor_rada" name="mentor_rada" style="width: 60%; height: 60px; margin-left: 10px;">
			'.
			$args = array(
				'posts_per_page' => -1,
				'post_type' => 'mentor', 
				'post_status' => 'publish'
			);
			$mentori = get_posts($args);
			$html = " ";
			foreach($mentori as $a){
				$selected = "";
				if($mentor == $a->post_title){
					$selected = "selected";
				};
				$html .= '<option value="'.$a->post_title.'" '. $selected .' >'.$a->post_title.'</option>';
			}
			echo $html.'</select> 
		</div>
	</div>';
}

function spremi_mentora_rada($post_id){
	$is_autosave = wp_is_post_autosave($post_id);
	$is_revision = wp_is_post_revision( $post_id );
	$is_valid_nonce_autor_knjige = ( isset( $_POST[ 'mentor_rada_nonce' ] ) &&
			 wp_verify_nonce($_POST[ 'mentor_rada_nonce' ], basename( __FILE__ ) ) ) ? 'true' : 'false';

	if($is_autosave || $is_revision || !$is_valid_nonce_autor_knjige){return;}
	if(!empty($_POST['mentor_rada'])){
		if(is_array($_POST[ 'mentor_rada' ])){
			$smjer = implode(", ", $_POST[ 'mentor_rada']);
		}else{
				$smjer = $_POST['mentor_rada'];
		}
		update_post_meta($post_id, 'mentor_rada', $smjer);
	}else{
		delete_post_meta($post_id, 'mentor_rada');
	}
		 
}

function spremi_smjer_rada($post_id){
	$is_autosave = wp_is_post_autosave($post_id);
	$is_revision = wp_is_post_revision( $post_id );
	$is_valid_nonce_smjer_rada = (isset($_POST['smjer_rada_nonce']) && wp_verify_nonce($_POST['smjer_rada_nonce'], basename(__FILE__))) ? 'true' : 'false';
	if($is_autosave || $is_revision || !$is_valid_nonce_smjer_rada){return;}
	if(!empty($_POST['smjer_rada'])){
		if(is_array($_POST[ 'smjer_rada' ])){
			$smjer = implode(", ", $_POST[ 'smjer_rada']);
		}else{
				$smjer = $_POST['smjer_rada'];
		}
		update_post_meta($post_id, 'smjer_rada', $smjer);
	}else{
		delete_post_meta($post_id, 'smjer_rada');
	}
}
function spremi_autora_knjige($post_id){
	$is_autosave = wp_is_post_autosave($post_id);
	$is_revision = wp_is_post_revision( $post_id );
	$is_valid_nonce_autor_knjige = ( isset( $_POST[ 'autor_knjige_nonce' ] ) &&
			 wp_verify_nonce($_POST[ 'autor_knjige_nonce' ], basename( __FILE__ ) ) ) ? 'true' : 'false';

	if($is_autosave || $is_revision || !$is_valid_nonce_autor_knjige){return;}
	if(!empty($_POST['autori_knjige'])){
		if(is_array($_POST[ 'autori_knjige' ])){
			$autori = implode(", ", $_POST[ 'autori_knjige']);
		}else{
				$autori = $_POST['autori_knjige'];
		}
		update_post_meta($post_id, 'autori_knjige', $autori);
	}else{
		delete_post_meta($post_id, 'autori_knjige');
	}
}
// Register Custom Post Type
function registriraj_cpt_radovi() {

	$labels = array(
		'name'                  => 'Radovi',
		'singular_name'         => 'Rad',
		'menu_name'             => 'Radovi',
		'name_admin_bar'        => 'Radovi',
		'archives'              => 'Radovi arhiva',
		'attributes'            => 'Atributi',
		'parent_item_colon'     => 'Roditeljski elementi',
		'all_items'             => 'Svi radovi',
		'add_new_item'          => 'Dodaj rad',
		'add_new'               => 'Dodaj novi',
		'new_item'              => 'Novi rad',
		'edit_item'             => 'Uredi rad',
		'update_item'           => 'Ažuriraj rad',
		'view_item'             => 'Pogledaj rad',
		'view_items'            => 'Pogledaj radove',
		'search_items'          => 'Pretraži radove',
		'not_found'             => 'Nije pronađeno',
		'not_found_in_trash'    => 'Nije pronađeno u smeću',
		'featured_image'        => 'Istaknutu slika',
		'set_featured_image'    => 'Postavi istaknutu sliku',
		'remove_featured_image' => 'Ukloni istaknutu sliku',
		'use_featured_image'    => 'Postavi za istaknutu sliku',
		'insert_into_item'      => 'Umetni',
		'uploaded_to_this_item' => 'Preneseno',
		'items_list'            => 'Lista radova',
		'items_list_navigation' => 'Navigacija među radovima',
		'filter_items_list'     => 'Filtriranje radova',
	);
	$args = array( 
		'label'                 => 'Rad',
		'description'           => 'Diplomski i seminarski radovi',
		'labels'                => $labels,
		'supports'              => array( 'title', 'editor', 'thumbnail' ),
        'menu_icon' => 'dashicons-welcome-learn-more',
		'hierarchical'          => false,
		'public'                => true,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_position'         => 5,
		'show_in_admin_bar'     => true,
		'show_in_nav_menus'     => true,
		'can_export'            => true,
		'has_archive'           => true,
		'exclude_from_search'   => false,
		'publicly_queryable'    => true,
		'capability_type'       => 'page',
	);
	register_post_type( 'rad', $args );

}
// Register Custom Taxonomy
function registriraj_taksonomiju_vrsta() {

	$labels = array(
		'name'                       => 'Vrste',
		'singular_name'              => 'Vrsta',
		'menu_name'                  => 'Vrsta akadem. rada',
		'all_items'                  => 'Sve vrste',
		'parent_item'                => 'Roditeljski element',
		'parent_item_colon'          => 'Roditeljski element',
		'new_item_name'              => 'Nova vrsta',
		'add_new_item'               => 'Dodaj novu vrstu',
		'edit_item'                  => 'Uredi vrstu',
		'update_item'                => 'Ažuriraj vrstu',
		'view_item'                  => 'Pogledaj vrstu',
		'separate_items_with_commas' => 'Odvoji zarezom',
		'add_or_remove_items'        => 'Dodaj ili ukloni vrste',
		'choose_from_most_used'      => 'Odaberi među najčešće korištenim',
		'popular_items'              => 'Popularne vrste',
		'search_items'               => 'Pretraži vrste',
		'not_found'                  => 'Nije pronađeno',
		'no_terms'                   => 'Nema rezultata',
		'items_list'                 => 'Lista',
		'items_list_navigation'      => 'Navigacija',
	);
	$args = array(
		'labels'                     => $labels,
		'hierarchical'               => false,
		'public'                     => true,
		'show_ui'                    => true,
		'show_admin_column'          => true,
		'show_in_nav_menus'          => true,
		'show_tagcloud'              => true,
	);
	register_taxonomy( 'vrsta_rada', array( 'rad' ), $args );

}
add_action( 'init', 'registriraj_cpt_radovi', 0 );
add_action( 'init', 'registriraj_taksonomiju_vrsta', 0 );

// Register Custom Taxonomy
function registriraj_taksonomiju_ustanova() {

	$labels = array(
		'name'                       => 'Ustanove',
		'singular_name'              => 'Ustanova',
		'menu_name'                  => 'Ustanova',
		'all_items'                  => 'Sve ustanove',
		'parent_item'                => 'Roditeljski element',
		'parent_item_colon'          => 'Roditeljski element',
		'new_item_name'              => 'Nova ustanova',
		'add_new_item'               => 'Dodaj novu ustanovu',
		'edit_item'                  => 'Uredi ustanovu',
		'update_item'                => 'Ažuriraj ustanovu',
		'view_item'                  => 'Pogledaj ustanovu',
		'separate_items_with_commas' => 'Odvoji zarezom',
		'add_or_remove_items'        => 'Dodaj ili ukloni',
		'choose_from_most_used'      => 'Odaberi među najkorištenijima',
		'popular_items'              => 'Popularne ustanove',
		'search_items'               => 'Pretraži ustanove',
		'not_found'                  => 'Nije pronađeno',
		'no_terms'                   => 'Nema rezultata',
		'items_list'                 => 'Lista',
		'items_list_navigation'      => 'Navigacija',
	);
	$args = array(
		'labels'                     => $labels,
		'hierarchical'               => false,
		'public'                     => true,
		'show_ui'                    => true,
		'show_admin_column'          => true,
		'show_in_nav_menus'          => true,
		'show_tagcloud'              => true,
	);
	register_taxonomy( 'ustanova', array( 'rad' ), $args );

}
add_action( 'init', 'registriraj_taksonomiju_ustanova', 0 );
// Register Custom Taxonomy
function registriraj_taksonomiju_autor_rada() {

	$labels = array(
		'name'                       => 'Autori rada',
		'singular_name'              => 'Autor rada',
		'menu_name'                  => 'Autor rada',
		'all_items'                  => 'Svi autori radova',
		'parent_item'                => 'Roditeljski element',
		'parent_item_colon'          => 'Roditeljski element',
		'new_item_name'              => 'Novi autor rada',
		'add_new_item'               => 'Dodaj novog autora rada',
		'edit_item'                  => 'Uredi autora rada',
		'update_item'                => 'Ažuriraj autora rada',
		'view_item'                  => 'Pogledaj autora rada',
		'separate_items_with_commas' => 'Odvoji zarezom',
		'add_or_remove_items'        => 'Dodaj ili ukloni',
		'choose_from_most_used'      => 'Odaberi među najkorištenijim',
		'popular_items'              => 'Popularno',
		'search_items'               => 'Pretraži',
		'not_found'                  => 'Nije pronađeno',
		'no_terms'                   => 'Nema rezultata',
		'items_list'                 => 'Lista',
		'items_list_navigation'      => 'Navigacija',
	);
	$args = array(
		'labels'                     => $labels,
		'hierarchical'               => false,
		'public'                     => true,
		'show_ui'                    => true,
		'show_admin_column'          => true,
		'show_in_nav_menus'          => true,
		'show_tagcloud'              => true,
	);
	register_taxonomy( 'autor_rada', array( 'rad' ), $args );

}
add_action( 'init', 'registriraj_taksonomiju_autor_rada', 0 );
// Register Custom Post Type
function registriraj_mentor_cpt() {

	$labels = array(
		'name'                  => 'Mentori',
		'singular_name'         => 'Mentor',
		'menu_name'             => 'Mentori',
		'name_admin_bar'        => 'Mentor',
		'archives'              => 'Mentori arhiva',
		'attributes'            => 'Atributi',
		'parent_item_colon'     => 'Roditeljski element',
		'all_items'             => 'Svi mentori',
		'add_new_item'          => 'Dodaj novog mentora',
		'add_new'               => 'Dodaj novog',
		'new_item'              => 'Novi mentor',
		'edit_item'             => 'Uredi mentora',
		'update_item'           => 'Ažuriraj mentora',
		'view_item'             => 'Pogledaj mentora',
		'view_items'            => 'Pogledaj mentore',
		'search_items'          => 'Pretraži mentora',
		'not_found'             => 'Nije pronađeno',
		'not_found_in_trash'    => 'Nije pronađeno u smetju',
		'featured_image'        => 'Istaknuta slika',
		'set_featured_image'    => 'Postavi istaknutu sliku',
		'remove_featured_image' => 'Ukloni istaknutu sliku',
		'use_featured_image'    => 'Postavi za istaknutu sliku',
		'insert_into_item'      => 'Umetni',
		'uploaded_to_this_item' => 'Preneseno',
		'items_list'            => 'Lista',
		'items_list_navigation' => 'Navigacija',
		'filter_items_list'     => 'Filtriranje',
	);
	$args = array(
		'label'                 => 'Mentor',
		'description'           => 'Mentori akademskih radova',
		'labels'                => $labels,
		'supports'              => array( 'title', 'editor', 'thumbnail' ),
		'hierarchical'          => false,
		'public'                => true,
		'show_ui'               => true,
		'show_in_menu'          => true,
		'menu_icon' =>   'dashicons-businesswoman',
		'menu_position'         => 4,
		'show_in_admin_bar'     => true,
		'show_in_nav_menus'     => true,
		'can_export'            => true,
		'has_archive'           => true,
		'exclude_from_search'   => false,
		'publicly_queryable'    => true,
		'capability_type'       => 'page',
	);
	register_post_type( 'mentor', $args );

}
add_action( 'init', 'registriraj_mentor_cpt', 0 );

function load_stylesheets(){


    wp_register_style('bootstrap', get_template_directory_uri().'/css/bootstrap.min.css', array(), false, 'all');
    wp_enqueue_style('bootstrap');

    wp_register_style('style', get_template_directory_uri().'/style.css', array(), false, 'all');
    wp_enqueue_style('style');

    wp_register_style('fonts', get_template_directory_uri().'/css/fonts.css', array(), false, 'all');
    wp_enqueue_style('fonts');

    
    wp_register_style('google-fonts', 'http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900', array(), false, 'all');
	wp_enqueue_style('google-fonts');
	

}
function include_jquery(){
    wp_deregister_script('jquery');
    wp_enqueue_script('jquery', get_template_directory_uri().'/js/jquery-3.5.1.min.js', "", 1, true);
    add_action('wp_enqueue_scripts', 'jquery');
}
add_action('wp_enqueue_scripts', 'include_jquery');
add_action('wp_enqueue_scripts', 'load_stylesheets');

function include_bootstrapJs(){
	wp_enqueue_script('bootstrapjs', get_template_directory_uri().'/js/bootstrap.min.js', "", 1, true);
}
add_action('wp_enqueue_scripts', 'include_bootstrapJs');

function loadjs(){

	wp_enqueue_script( 'customjs', get_template_directory_uri() . '/js/scripts.js', array('jquery') );
	wp_localize_script('customjs', 'my_ajax_object', array('ajax_url'=>admin_url('admin-ajax.php')));

}
function enqueue_load_fa() {
	wp_enqueue_script( 'load-fa', 'https://kit.fontawesome.com/451aff4b85.js' );
}

add_action( 'wp_enqueue_scripts', 'enqueue_load_fa');
add_action('wp_enqueue_scripts', 'loadjs');

/*						CPT - TAX - METABOX  
--------------------------------------------------------------------------------------------------------------------
*/
if ( ! file_exists( get_template_directory() . '/class-wp-bootstrap-navwalker.php' ) ) {
    // file does not exist... return an error.
    return new WP_Error( 'class-wp-bootstrap-navwalker-missing', __( 'It appears the class-wp-bootstrap-navwalker.php file may be missing.', 'wp-bootstrap-navwalker' ) );
} else {
    // file exists... require it.
    require_once get_template_directory() . '/class-wp-bootstrap-navwalker.php';
}

function console_log($data){
	echo '<script>';
	echo 'console.log('.json_encode($data).')';
	echo '</script>';
}
?>