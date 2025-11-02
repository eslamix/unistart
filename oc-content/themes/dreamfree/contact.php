<?php
// meta tag robots
    osc_add_hook('header','dreamfree_nofollow_construct');

    dreamfree_add_body_class('contact');
    osc_enqueue_script('jquery-validate');
    osc_current_web_theme_path('header.php');
?>
<style>.cell_3{display: none;}</style>

<div class="form-container form-horizontal form-container-box">
    <div class="header">
        <h4 class="title-widget-boxa"><?php _e('Contact us', 'dreamfree'); ?></h4>
    </div>
    <div class="resp-wrapper">
        <ul id="error_list"></ul>
        <form name="contact_form" action="<?php echo osc_base_url(true); ?>" method="post" >
            <input type="hidden" name="page" value="contact" />
            <input type="hidden" name="action" value="contact_post" />
            
                <label class="control-label" for="yourName">
                    <?php _e('Your name', 'dreamfree'); ?>
                    (<?php _e('optional', 'dreamfree'); ?>)</label>
                
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i><?php ContactForm::your_name(); ?></div>
 </span></div>
 

                <label class="control-label" for="yourEmail">
                    <?php _e('Your email address', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-at"></i><?php ContactForm::your_email(); ?></div>
 </span></div>
 
            
                <label class="control-label" for="subject">
                    <?php _e('Subject', 'dreamfree'); ?>
                    (<?php _e('optional', 'dreamfree'); ?>)</label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-pencil"></i><?php ContactForm::the_subject(); ?>
 </span></div></div>
 

                <label class="control-label" for="message">
                    <?php _e('Message', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-pencil-square-o"></i><?php ContactForm::your_message(); ?></div>
            </span></div></div>
            <div class="control-group">
                <div class="controls">
                    <?php osc_run_hook('contact_form'); ?>
                    <?php osc_show_recaptcha(); ?>
                    <button type="submit" class="btn btn-danger"><?php _e("Send", 'dreamfree');?></button>
                    <?php osc_run_hook('admin_contact_form'); ?>
                </div>
            </div>
        </form>
        <?php ContactForm::js_validation(); ?>
    </div> 

<?php osc_current_web_theme_path('footer.php') ; ?>
<script type="text/javascript">
	$("#xxxxx").attr('placeholder', '<?php _e('Your search', 'coral'); ?>');
	$("#sCity").attr('placeholder', '<?php _e('City', 'coral'); ?>');
	$("#priceMin").attr('placeholder', '<?php _e('Min', 'coral'); ?>');
	$("#priceMax").attr('placeholder', '<?php _e('Max', 'coral'); ?>');
</script>