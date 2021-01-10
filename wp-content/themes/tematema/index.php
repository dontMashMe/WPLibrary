<?php
get_header();
$istaknutaSlika;
?>

<div class="container-fluid vijesti-maindiv">

    <div class="row">
        <div class="col-lg-8 col-sm-12 vijesti-left">
            <?php $recent_posts = wp_get_recent_posts(array(
                'numberposts' => 1, // Number of recent posts thumbnails to display
                'post_status' => 'publish' // Show only the published posts
            ));
            console_log($recent_posts[0]);
            ?>
            <p class="h4" style="padding-top:0.5em;">Posljednja obavijest.</p>
            <hr>
            <small style="color:#0174b2;">Dana <?php echo $recent_posts[0]['post_date'] ?></small>
            <div class="row">
                <div class="col-sm-5">
                    <?php if (get_the_post_thumbnail_url($post->ID)) {
                        $sIstaknutaSlika = get_the_post_thumbnail_url($post->ID);
                    } else {
                        $sIstaknutaSlika = get_template_directory_uri() . '/images/news-def.png';
                    }
                    ?>
                    <img src="<?php echo $sIstaknutaSlika ?>" alt="" class="vijesti-img">

                </div>
                <div class="col-sm-7 vijesti-left-right"> 
                    <p class="h4" style="padding-top:0.5em;"><?php echo $recent_posts[0]['post_title'] ?></p>
                    <p class="vijesti-text"><?php echo $recent_posts[0]['post_content'] ?></p>
                </div>
            </div>
        </div>

        <div class="col-lg-4 col-sm-12 vijesti-right">
            <p class="h5">Popis svih vijesti</p>
            <div class="list-group">
                <?php
                $recent_posts = wp_get_recent_posts(array(
                    'numberposts' => 3, // Number of recent posts thumbnails to display
                    'post_status' => 'publish' // Show only the published posts
                ));
                foreach ($recent_posts as $post) : ?>
                    <a href="<?php echo $post['guid']?>" style="margin-top:15px;" class="list-group-item list-group-item-action flex-column align-items-start active">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1"><?php echo $post['post_title']?></h5>
                            <small>3 days ago</small>
                        </div>
                        <p class="mb-1"><?php echo skrati_tekst_tekst($post['post_content'], 140) ?></p>
                        <small>Dana <?php echo $post['post_date'] ?></small>
                    </a>
                <?php endforeach;
                wp_reset_query(); ?>
            </div>

        </div>
    </div>

</div>

<?php
get_footer();
?>