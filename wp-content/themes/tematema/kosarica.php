<?php

/* 
Template Name: Kosarica
*/
get_header();
?>

<script>
    var ids= [];
</script>
<div class="container-fluid kosarica-opis">
    <div class="row">
        <div class="col-lg-4 kosarica-left">
            <p>Košarica je privremeno mjesto gdje se nalaze knjige koje želite posuditi.</p>
            <p style="margin-top:-10px;">Ovdje možete pregledati knjige prije samog posuđivanja.</p>
        </div>

        <?php
        $user_info = vrati_user_info();
        if ($user_info != null) {
            $kosarica = vrati_kosaricu();
            if (sizeof($kosarica) == 0) {
        ?>
                <div class="col-lg-8" style="padding-left:5em;">
                    <h4>Košarica je prazna.</h4>
                    <img style="padding-top:1em; width:200px; height:200px;" src="<?php echo get_template_directory_uri() . '/images/empty-kos.png' ?>" alt="">
                </div>
    </div>
<?php
            } else {
?>
    <div class="col-lg-8 text-center kosarica-right">
        <h4 class="heading-4">Vaša košarica</h4>
        <ul class="list-group mt-4 pb-4 list-kosarica">
            <?php
                foreach ($kosarica as $a) 
                {
                    $knjiga = vrati_knjigu_poId($a);
                    ?>
                        <li id="<?php echo $knjiga->id_knjige?>" class="list-group-item d-flex justify-content-between align-items-center">
                            <a href="<?php echo $knjiga->guid?>"><i class="far fa-eye" aria-hidden="true"></i></a><?php echo $knjiga->ime_knjige . "     -     " . get_post_meta($knjiga->id_knjige, 'autori_knjige', true) ?>
                            <script>
                                ids.push(<?php echo $knjiga->id_knjige?>);
                            </script>
                            <a href="" onclick="makni_izKosarice(<?php echo $knjiga->id_knjige?>, ids); popIdKnjige(<?php echo $knjiga->id_knjige?>, ids); return false;"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                        </li>
                    <?php
                }
            ?>
        </ul>
        <button type="button" onclick="dovrsiNarudzbu(ids)" class="btn btn-success">Dovrši narudžbu</button>

    </div>

<?php
    }
        } else {
?>
<div class="col-lg-8">
    <h4>Niste prijavljeni!</h4>
    <img style="padding-top:1em;" src="<?php echo get_template_directory_uri() . '/images/sad-kos.png' ?>" alt="">
</div>
</div>

<?php
        }
?>

</div>


<br><br><br><br><br>
<?php

get_footer();
?>