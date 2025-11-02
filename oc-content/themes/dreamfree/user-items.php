<?php
// meta tag robots
    osc_add_hook('header','dreamfree_nofollow_construct');

    dreamfree_add_body_class('user user-items');
    osc_add_hook('before-main','sidebar');
    function sidebar(){
        osc_current_web_theme_path('user-sidebar.php');
    }
    osc_current_web_theme_path('header.php') ;

    $listClass = '';
    $buttonClass = '';
    if(Params::getParam('ShowAs') == 'gallery'){
        $listClass = 'listing-grid';
        $buttonClass = 'active';
    }
?>
<div class="list-header">
    <?php osc_run_hook('search_ads_listing_top'); ?>
    <h1><?php _e('My listings', 'dreamfree'); ?></h1>
    <?php if(osc_count_items() == 0) { ?>
        <p class="empty" ><?php _e('No listings have been added yet', 'dreamfree'); ?></p>
    <?php } else { ?>

    </div>
    <?php
        View::newInstance()->_exportVariableToView("listClass",$listClass);
        View::newInstance()->_exportVariableToView("listAdmin", true);
        osc_current_web_theme_path('loop.php');
    ?>
    <div class="clear"></div>
    <?php
    if(osc_rewrite_enabled()){
        $footerLinks = osc_search_footer_links();
    ?>
        <ul class="footer-links">
            <?php foreach($footerLinks as $f) { View::newInstance()->_exportVariableToView('footer_link', $f); ?>
                <?php if($f['total'] < 3) continue; ?>
                <li><a href="<?php echo osc_footer_link_url(); ?>"><?php echo osc_footer_link_title(); ?></a></li>
            <?php } ?>
        </ul>
    <?php } ?>
    <div class="paginate" >
        <?php echo osc_pagination_items(); ?>
    </div>
<?php } ?>
<?php osc_current_web_theme_path('footer.php') ; ?>
