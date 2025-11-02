<?php
// meta tag robots
    osc_add_hook('header','dreamfree_nofollow_construct');

    dreamfree_add_body_class('page');
    osc_current_web_theme_path('header.php') ;
?>

<h1><?php echo osc_static_page_title(); ?></h1>
<div class="stati-page"><?php echo osc_static_page_text(); ?></div>
<?php osc_current_web_theme_path('footer.php') ; ?>