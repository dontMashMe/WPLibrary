<?php
/* 
Template Name: Login
*/

get_header();
?>




<div class="container-fluid reg_div">
    <form type="post" action="" id="customerFormPrijava">
        <div id="login-box">
            <div class="left">
                <h1>Prijava</h1>
                <input type="text" name="email" placeholder="E-mail" required />
                <input type="password" name="password" placeholder="Lozinka" required />
                <input type="hidden" name="action" value="prijavi_korisnika" />
                <p>Nemaš račun? <a href="http://localhost/wordpress/registracija/">Registriraj se!</a></p>
                <input type="submit">
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

</div>


<div id="feedback"></div>
<br /><br />
<?php

get_footer();
?>