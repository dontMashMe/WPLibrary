<?php wp_footer();?>
</div>
<footer>
            <div class="container foot-container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="footer-content">
                            <div class="footer-head">
                                <?php dynamic_sidebar('footer-sidebar1'); ?>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-6 col-xs-12 foot-vsmti">
                        <div class="footer-content">
                            <div class="footer-head">
								<?php dynamic_sidebar('footer-sidebar2'); ?>
                            </div>
                        </div>
                    </div>
                    <p class="copyright text-muted">Copyright &copy; VSMTI <?php echo date("Y.") ?></p>
                </div>
            </footer>
            <?php wp_footer(); ?>
        </body>
    </html>