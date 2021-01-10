<?php
/* 
Template Name: Registration
*/
get_header();
$smjerovi = daj_smjerove();
?>

<div class="container-fluid reg_div">
    <form type="post" action="" id="newCustomerForm">
        <div id="login-box">
            <div class="left">
                <h1>Registracija</h1>
                <input type="text" name="name_surname" placeholder="Ime i prezime" />
                <input type="text" name="email" placeholder="E-mail" />
                <input type="password" name="password" placeholder="Lozinka" />
                <input type="password" name="password2" placeholder="Ponovite lozinku" />
                <select name="smjer" id="" class="form-select form-select-sm">
                    <option selected disabled>Odaberite smjer</option>
                    <?php 
                    foreach($smjerovi as $a){
                        echo '<option value="'.$a->ID.'">'.$a->post_title.'</option>';
                    }
                    ?>
                </select>
                <input type="hidden" name="action" value="registriraj_korisnika" />
                <input type="submit" >
            </div>

            <div class="right">
                <?php
                $src =  get_template_directory_uri() . '/images/books.jpg';
                ?>
                <img src="<?php echo $src ?>" alt="" style='height: 100%; width: 100%; object-fit: contain'>
            </div>
        </div>
    </form>

</div>



<div id="feedback"></div>
<br /><br />
<?php

get_footer();
?>