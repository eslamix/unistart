<?php
    $js_lang = array(
        'delete' => __('Delete', 'dreamfree'),
        'cancel' => __('Cancel', 'dreamfree')
    );

    osc_enqueue_script('jquery');
    osc_enqueue_script('jquery-ui');
	osc_register_script('global-theme-js', osc_current_web_theme_js_url('global.js'), 'jquery');
    osc_register_script('delete-user-js', osc_current_web_theme_js_url('delete_user.js'), 'jquery-ui');
    osc_enqueue_script('global-theme-js');
?>
<?php
if(osc_current_user_locale() == 'ar_SY') {
	osc_enqueue_style('bootstrap', osc_current_web_theme_url('css/bootstrap.min.css'));
   osc_enqueue_style('bootstrap-rtl', osc_current_web_theme_url('css/bootstrap-rtl.css'));
   osc_enqueue_style('main-rtl', osc_current_web_theme_url('css/main-rtl.css'));
} else {
      
}
if(osc_current_user_locale() == 'en_US') {
	osc_enqueue_style('bootstrap', osc_current_web_theme_url('css/bootstrap.min.css'));
osc_enqueue_style('main', osc_current_web_theme_url('css/main.css'));

} else {

 
};?>
<script src="https://kit.fontawesome.com/c8d4e54978.js"></script>
<script src="https://use.fontawesome.com/01f3694d27.js"></script>
<script type="text/javascript" src="<?php echo osc_base_url(); ?>oc-content/themes/dreamfree/js/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo osc_base_url(); ?>oc-content/themes/dreamfree/js/bootstrap.bundle.js"></script>
<script type="text/javascript" src="<?php echo osc_base_url(); ?>oc-content/themes/dreamfree/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<?php echo osc_base_url(); ?>oc-content/themes/dreamfree/js/jquery.fancybox.min.js"></script>
<?php if(osc_get_preference('coode_adsense', 'dreamfree') <> '') { ?>
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-<?php echo osc_get_preference('coode_adsense', 'dreamfree'); ?>"crossorigin="anonymous"></script>
<?php } ?>


<meta http-equiv="Content-type" content="text/html; charset=utf-8" />

<title><?php echo meta_title() ; ?></title>
<meta name="title" content="<?php echo osc_esc_html(meta_title()); ?>" />
<?php if( meta_description() != '' ) { ?>
<meta name="description" content="<?php echo osc_esc_html(meta_description()); ?>" />
<?php } ?>
<?php if( meta_keywords() != '' ) { ?>
<meta name="keywords" content="<?php echo osc_esc_html(meta_keywords()); ?>" />
<?php } ?>
<?php if( osc_get_canonical() != '' ) { ?>
<!-- canonical -->
<link rel="canonical" href="<?php echo osc_get_canonical(); ?>"/>
<!-- /canonical -->
<?php } ?>
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="Fri, Jan 01 1970 00:00:00 GMT" />
<style>.subcategori-incategoriall{display: none;}</style>
<meta name="viewport" content="initial-scale = 1.0,maximum-scale = 1.0" />

<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<!-- favicon -->
<link rel="shortcut icon" href="<?php echo osc_current_web_theme_url('favicon/favicon-32x32.png'); ?>">
<!-- /favicon --> 

<link href="https://fonts.googleapis.com/css?family=Almarai&display=swap" rel="stylesheet">

<link href="<?php echo osc_current_web_theme_url('css/jquery.fancybox.min.css') ; ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo osc_current_web_theme_url('js/jquery-ui/jquery-ui-1.10.2.custom.min.css') ; ?>" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    var dreamfree = window.dreamfree || {};
    dreamfree.base_url = '<?php echo osc_base_url(true); ?>';
    dreamfree.langs = <?php echo json_encode($js_lang); ?>;
    dreamfree.fancybox_prev = '<?php echo osc_esc_js( __('Previous image','dreamfree')) ?>';
    dreamfree.fancybox_next = '<?php echo osc_esc_js( __('Next image','dreamfree')) ?>';
    dreamfree.fancybox_closeBtn = '<?php echo osc_esc_js( __('Close','dreamfree')) ?>';
</script>


<?php osc_run_hook('header') ; ?>
