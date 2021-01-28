<?php get_header();
    

    if(have_posts()){
        while(have_posts()){

            the_post();
            if(get_the_post_thumbnail_url($post->ID)){
                $istaknutaSlika = get_the_post_thumbnail_url($post->ID);
            }else{
                $istaknutaSlika = get_template_directory_uri().'/images/no_author.png'; 
            }
            $knjige_autora = daj_knjige_autora(get_the_title($post->ID));
            $knjigeHtml = "<ul class='autor_list_singl' style='margin-left:15px;'>";
            foreach($knjige_autora as $a){
                $knjigeHtml .= "<li><b><a href='".$a->guid."'>".$a->ime_knjige."</a></b></li>";
            }            
            $knjigeHtml .="</ul>";
            $html = '<div class="container-fluid" style="margin-bottom:50px; margin-top:50px;">
                        <div class="row">';
            $html .=        '<div class="col-sm-5 autor_pic_div" style=text-align:center;>';
            $html .=            '<img class="autor_pic_singl" src="'.$istaknutaSlika.'">
                            </div>';
            $html .=        '<div class="col-sm-7">
                                  <h2>'.get_the_title($post->ID).'</h2>
                                  <h6 style="margin-bottom: 10px; margin-top:10px;">Djela:</h6>
                                  '.$knjigeHtml.'
                                  <hr>
                                  <h6>Životopis</h6>
                                  <p>'.$post->post_content.'</p>
                                 
                            </div>
                        </div>
                    </div>
            ';
            echo $html;
        }
    }

    get_footer();?>