<?php

get_header();

?>
<div class="container">
    <div class="container" id="katalog">
        <h3>Knjižnični katalog Visoke Škole</h3>
        <p style="margin-top:25px;">Katalog je žila kucavica svake knjižnice, u njemu možete pronaći sve knjige, literaturu, djela i znanstvene radove koji se nalaze u knjižnici. <br>
            Svi segmenti obradbe knjižnične građe rezultiraju u određenoj knjižnici izradbom kataloga i drugih baza podataka koji se stavljaju na uvid korisnicima i knjižničnome osoblju. Izradba kataloga, tehnička obradba publikacija i njihov smještaj u spremišta ili u otvoren prostor namijenjen korisnicima, u knjižnicama se obavlja istodobno.</p>
        <div class="md-form active-cyan active-cyan-2 mb-3">
            <input class="form-control" id="userSearch" type="text" placeholder="&#xF002; Pretraži" aria-label="Search" style="font-family: FontAwesome, Arial; font-style: normal">
        </div>
        <div class="ajax-loader">
        
        </div>
        <hr>
        <?php

        $sva_djela = daj_knjige();
        echo '<div class="container-fluid books-div" style="text-align:center;">
        <div class="row">';
        foreach ($sva_djela as $a) {
            $sHtml = "<div class='col-lg-3 col-sm-12'>";
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
            echo $sHtml . '</div>';
        }
        echo '</div></div>'
        ?>
    </div>
</div>
<?php

get_footer();

?>