<?php
// meta tag robots
    osc_add_hook('header','dreamfree_nofollow_construct');

    dreamfree_add_body_class('register');
    osc_enqueue_script('jquery-validate');
    osc_current_web_theme_path('header.php') ;
?>
<div class="form-container form-horizontal form-container-box">
    <div class="header">
         <h4 class="title-widget-boxa"><?php _e('Register an account for free', 'dreamfree'); ?></h4>
    </div>
    <div class="resp-wrapper">
        <form name="register" action="<?php echo osc_base_url(true); ?>" method="post" >
            <input type="hidden" name="page" value="register" />
            <input type="hidden" name="action" value="register_post" />
            <ul id="error_list"></ul>


                <label class="control-label" for="name"><?php _e('Name', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend for-input-register">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i><?php UserForm::name_text(); ?>
 </span></div></div>
 

                <label class="control-label" for="email"><?php _e('E-mail', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend for-input-register">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-at"></i><?php UserForm::email_text(); ?>
 </span></div></div>
 

                <label class="control-label" for="password"><?php _e('Password', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend for-input-register">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-lock"></i><?php UserForm::password_text(); ?>
 </span></div></div>
 

                <label class="control-label" for="password-2"><?php _e('Repeat password', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend for-input-register">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-unlock-alt"></i> <?php UserForm::check_password_text(); ?>
                    <p id="password-error" style="display:none;">
                        <?php _e("Passwords don't match", 'dreamfree'); ?>
                    </p>
 </span></div></div>
            <?php osc_run_hook('user_register_form'); ?>
            <div class="control-group">
                <div class="controls">
                    <?php osc_show_recaptcha('register'); ?>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <button type="submit" class="btn btn-danger for-item-comment"><?php _e("Create", 'dreamfree'); ?></button>
                </div>
            </div>
        </form>
    </div>
</div>
<?php UserForm::js_validation(); ?>
<?php osc_current_web_theme_path('footer.php') ; ?>