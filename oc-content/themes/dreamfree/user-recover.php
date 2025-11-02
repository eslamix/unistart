<?php
// meta tag robots
    osc_add_hook('header','dreamfree_nofollow_construct');

    dreamfree_add_body_class('recover');
    osc_current_web_theme_path('header.php');
?>
<div class="form-container form-horizontal form-container-box">
    <div class="header">
        <h1><?php _e('Recover your password', 'dreamfree'); ?></h1>
    </div>
    <div class="resp-wrapper">
        <form action="<?php echo osc_base_url(true); ?>" method="post" >
        <input type="hidden" name="page" value="login" />
        <input type="hidden" name="action" value="recover_post" />
        <div class="control-group">
            <label class="control-label" for="email"><?php _e('E-mail', 'dreamfree'); ?></label>

<div class="input-group mb-3">
<div class="input-group-prepend for-input-register">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-lock"></i><?php UserForm::email_text(); ?>
                <?php osc_show_recaptcha('recover_password'); ?>
</span></div></div>
            <div class="control-group">
                <div class="controls">
                    <button type="submit" class="btn btn-danger"><?php _e("Send me a new password", 'dreamfree');?></button>
                </div>
            </div>
        </form>
    </div>
</div></div>
<?php osc_current_web_theme_path('footer.php') ; ?>