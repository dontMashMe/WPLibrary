<?php

get_header();

$rad = daj_rad_poId($post->ID);
$mentor_obj = vrati_mentora(get_post_meta($post->ID, 'mentor_rada', true));
$smjer_obj = vrati_smjer(get_post_meta($post->ID, 'smjer_rada', true));
console_log($smjer_obj);
$istaknutaSlika = get_the_post_thumbnail_url($post->ID);
?>

<div class="container single_knjiga_div">

    <div class="row">
        <div class="col-md-9">
            <h1 class="single-title"><?php echo get_the_title($post->ID) ?></h1>
            <hr>
        </div>
        <div class="col-md-3" style="text-align:center;">
            <img src="<?php echo $istaknutaSlika ?>" alt="" class="single_rad_img">
        </div>
    </div>
    <div class="row single_knjiga_rowUnder" style="margin-top:25px;">
        <div class="col-md-12">
            <table class="table" id="single_knjiga_table">
                <tbody>
                    <tr>
                        <th>Autor:</th>
                        <td><?php echo  $rad->autor_rada ?></td>
                    </tr>

                    <tr>
                        <th>Opis:</th>
                        <td><?php echo skrati_tekst_tekst($rad->sadrzaj, 220)?></td>
                    </tr>
                    <tr>
                        <th>Mentor:</th>
                        <td><a href="<?php echo $mentor_obj->guid ?>"><?php echo $mentor_obj->post_title ?></a></td>
                    </tr>
                    <tr>
                        <th>Ustanova:</th>
                        <td><?php echo $rad->ustanova ?></td>
                    <tr>

                    <tr>
                        <th>Smjer:</th>
                        <td><a href="<?php echo $smjer_obj->guid ?>"><?php echo $smjer_obj->post_title ?></a></td>
                    </tr>
                    <tr>
                        <th>Prava pristupa:</th>
                        <td>Pristup korisnicima matične ustanove</td>
                    </tr>
                    <tr>
                        <th>Datum i vrijeme pohrane:</th>
                        <td><?php echo $rad->datum_objave ?></td>
                    </tr>
                    <tr>
                        <th>Uvjeti korištenja:</th>
                        <td><a href="https://rightsstatements.org/page/InC/1.0/?language=en"><img src="<?php echo get_template_directory_uri() . '/images/cc_all.png' ?>" alt=""></a></td>
                    </tr>

                </tbody>
            </table>
        </div>
    </div>
</div>



<?php

get_footer();

?>