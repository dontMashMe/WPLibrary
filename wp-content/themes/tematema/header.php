<!DOCTYPE html>
<html>

<head>

    <?php wp_head(); ?>

</head>



<body <?php body_class(); ?>>


    <header>
        <nav class="navbar navbar-expand-md navbar-light bg-light" role="navigation">
            <div class="container navcontainer">
                <!-- Brand and toggle get grouped for better mobile display -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigacija" aria-controls="navigacija" aria-expanded="false" aria-label="<?php esc_attr_e('Toggle navigation', 'your-theme-slug'); ?>">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <img src="http://localhost/wordpress/wp-content/uploads/2020/12/logo.png">
                <?php
                wp_nav_menu(array(
                    'theme_location'    => 'top-menu',
                    'depth'             => 1,
                    'container'         => 'div',
                    'container_class'   => 'collapse navbar-collapse',
                    'container_id'      => 'navigacija',
                    'menu_class'        => 'nav navbar-nav',
                    'fallback_cb'       => 'WP_Bootstrap_Navwalker::fallback',
                    'walker'            => new WP_Bootstrap_Navwalker(),
                ));
                ?>

            </div>
            <div class="user-welcome">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-4">
                            <img src="<?php echo get_template_directory_uri() . '/images/user-img.jpg' ?>" alt="desc" class="profile-pic">
                        </div>
                        <div class="col-sm-8 user-pers-links">
                            <h6 id="user-name"></h6>
                            <span id="profile"></span>
                            <span id="user-links"></span>
                        </div>
                    </div>
                </div>
            </div>

        </nav>



    </header>
    <div class="main-cont">


        <?php
        /* 
    <div id="header" class="container">
	    <div id="logo">
            <img src="http://localhost/wordpress/wp-content/uploads/2020/12/logo.png">
    		<!--<h1 style="float: right;"><a href="#">Knjižnica Visoke Škole</a></h1> -->
    	</div>
    	<div id="menu">
        <?php wp_nav_menu(
        array(
            'theme_location' => 'top-menu',
            'menu_class' => 'navigation'));?>
        </div>
    </div>

     <div class="container-fluid">
        <div class="row headerRow">
            <div class="col-lg-4 logoCol">
                <img src="http://localhost/wordpress/wp-content/uploads/2020/12/logo.png">
            </div>
            <div class="col-sm-8" id="menu">
            <?php wp_nav_menu(
                array(
                  'theme_location' => 'top-menu',
                  'menu_class' => 'navigation'));?>
            </div>
        </div>
    </div>

*/
        ?>