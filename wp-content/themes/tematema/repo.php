<?php

/* 
Template Name: Repository
*/
get_header();
$radovi = daj_radove();
console_log($radovi);
?>
<div class="container-fluid repo-div">
    <h4>Dobro došli u digitalni repozitorij završnih radova Visoke škole Virovitica!</h4>
    <p>Digitalni repozitorij je zbirka koja u digitalnom obliku okuplja, trajno pohranjuje i omogućuje slobodan pristup znanstveno-istraživačkoj, intelektualnoj i kreativnoj produkciji nastaloj radom ustanove, odnosno njenih djelatnika i studenata. U repozitorij se mogu pohranjivati završni i diplomski radovi studenata, disertacije, pre-print radovi, znanstveni i stručni radovi, podaci istraživanja, knjige, nastavni materijali, slike, video i audiozapisi, prezentacije te digitalizirana građa.</p>
    <div class="md-form active-cyan active-cyan-2 mb-3">
            <input class="form-control" id="userSearchRepo" type="text" placeholder="&#xF002; Pretraži" aria-label="Search" style="font-family: FontAwesome, Arial; font-style: normal">
    </div>
    <h5>ZADNJE DODANO</h5>
    <hr>
    <ul class="list-group repo-holder">
    <?php 
    
    foreach($radovi as $a){
        ?>
        <div style="margin-top:25px;"class="list-group-item flex-column align-items-start">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1" style="color:#0174b2;"><?php echo $a->ime_rada ?></h5>
                <small><strong>Datum dodavanja:</strong> <?php echo $a->datum_objave ?></small>
            </div>
            <p class="mb-1"><?php echo skrati_tekst_tekst($a->sadrzaj, 260)?></p>
            <small><strong>Smjer:</strong> <?php echo $a->smjer ?></small><br>
            <small><a href="<?php echo $a->guid?>"><i class="far fa-eye" style="padding-right:5px;"></i>Pogledaj</a></small>
        </div>
        <?php
        }
    ?>
    </ul>
</div>

<?php

get_footer();
?>