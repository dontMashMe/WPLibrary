<?php get_header();?>


<?php 
$sva_djela = daj_knjige();
shuffle($sva_djela);
console_log($sva_djela);
$prva_knjiga = $sva_djela[0];
$druga_knjiga = $sva_djela[1];
$treca_knjiga = $sva_djela[2];

?>

<div id="banner-wrapper">
    <div id="banner" class="container row" style="text-align: center;">
        <div class="col-md-4 box">
        <h3><?php echo $prva_knjiga->ime_knjige ?></h3>
			<p><?php echo skratiTekst($prva_knjiga)?></p>
			<a href="<?php echo $prva_knjiga->guid?>" class="button">Pročitaj više!</a>
        </div>
        <div class="col-md-4 box">
        <h3><?php echo $druga_knjiga->ime_knjige ?></h3>
			<p><?php echo skratiTekst($druga_knjiga)?></p>
			<a href="<?php echo $druga_knjiga->guid?>" class="button">Pročitaj više!</a>
        </div>
        <div class="col-md-4 box">
        <h3><?php echo $treca_knjiga->ime_knjige ?></h3>
			<p><?php echo skratiTekst($treca_knjiga)?></p>
			<a href="<?php echo $treca_knjiga->guid?>" class="button">Pročitaj više!</a>
        </div>
    </div>
</div>

<div class="container pt-5 pb-5">
    <h1 class="display-3">
        <?php the_title()?>
    </h1>
    

    <?php if(have_posts()) : while(have_posts()) : the_post();?>
        <?php the_content();?>

    <?php endwhile; endif;?>
    
</div>

<?php get_footer();?>