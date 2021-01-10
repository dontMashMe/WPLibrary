<?php get_header();
    

    if(have_posts()){
        while(have_posts()){
            the_post();
            $knjiga = vrati_knjigu_poId($post->ID);
            $istaknutaSlika = get_the_post_thumbnail_url($post->ID);
            $autor_obj = vrati_autora(get_post_meta($post->ID, 'autori_knjige', true));
            $kategorije ="";
            foreach($knjiga->kategorije as $a){
                foreach($a as $b){
                    $kategorije .= $b->kategorija_ime.", ";
                }
            }
            $kategorije = rtrim($kategorije, ", ");
            $dostupnoHtml;
            $btnHtml;
            if($knjiga->dostupnost > 0){
                $dostupnoHtml = '<span style="color: green;">Dostupno ('.$knjiga->dostupnost.')</span>';
                if(isset($_SESSION['user_id'])){
                    $btnHtml = '<button type="button" class="btn btn-primary" onclick="dodajKosaricu('.$knjiga->id_knjige.')"><i class="fas fa-shopping-cart" style="padding-right:5px;"></i>Dodaj u košaricu</button>';
                }else{
                    $btnHtml = '<button type="button" class="btn btn-secondary"><i class="fas fa-shopping-cart" style="padding-right:5px;"></i>Niste prijavljeni</button>';
                }
            }else{
                $btnHtml = '<button type="button" class="btn btn-danger" disabled><i class="fas fa-shopping-cart" style="padding-right:5px;"></i>Dodaj u košaricu</button>';
                $dostupnoHtml = '<span style="color: red;"><strong>Nije dostupno</strong></span>';
            }
            $html = '
                <div class="container single_knjiga_div">
                    <div class="row">
                        <div class="col-md-6" style="text-align:center; margin-bottom:50px;">
                            <img class="single_knjiga_img" src="'.$istaknutaSlika.'">
                        </div>
                        <div class="col-md-6">
                            <h1 class="single-title">'.get_the_title($post->ID).'</h1>
                            <hr>
                            '.$btnHtml.'
                            <hr>
                            <span style="color: green;">'.$dostupnoHtml.'</span>
                        </div>
                    </div>
                    <div class="row single_knjiga_rowUnder">
                        <div class="col-md-12">
                            <table class="table" id="single_knjiga_table">
                                <tbody>
                                    <tr>
                                        <th>Autor:</th>
                                        <td><a href="'.$autor_obj->guid.'">'.$autor_obj->post_title . '</a></td>
                                    </tr>
                                    <tr>
                                        <th>Opis:</th>
                                        <td>'.$knjiga->post_content.'</td>
                                    </tr>
                                    <tr>
                                        <th>Kategorije:</th>
                                        <td>'.$kategorije.'</td>
                                    <tr>
                                    <tr>
                                        <th>Izdavač:</th>
                                        <td>'.$knjiga->izdavac.'</td>
                                    </tr>
                                    <tr>
                                        <th>Broj stranica:</th>
                                        <td>'.$knjiga->broj_stranica.'</td>
                                    </tr>
                                    <tr>
                                        <th>Šifra:</th>
                                        <td>'.$knjiga->kata_broj.'</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            ';
            echo $html;
        }
    }

    get_footer();?>