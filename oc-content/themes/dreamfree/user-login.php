<?php
// meta tag robots
    osc_add_hook('header','dreamfree_nofollow_construct');

    dreamfree_add_body_class('login');
    osc_current_web_theme_path('header.php');
?>
<div class="form-container form-horizontal form-container-box">
    <div class="header">
        <h4 class="title-widget-boxa"><?php _e('Access to your account', 'dreamfree'); ?></h4>
    </div>
    <div class="resp-wrapper">
        <form action="<?php echo osc_base_url(true); ?>" method="post" >
            <input type="hidden" name="page" value="login" />
            <input type="hidden" name="action" value="login_post" />


                
<div class="input-group mb-3"><label class="" for="email"><?php _e('E-mail', 'dreamfree'); ?></label>
<div class="input-group-prepend">
<span class="input-group-text form-controlna" id="basic-addon1"><i class="fa fa-at"></i><?php UserForm::email_login_text(); ?>
 </span></div></div>
 
                <label class="" for="password"><?php _e('Password', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend for-input-register">
<span class="input-group-text form-controlna" id="basic-addon1"><i class="fa fa-lock"></i></i><?php UserForm::password_login_text(); ?>
 </span></div></div>
 
            <div class="control-group">
                <div class="controls checkbox">
                    <?php UserForm::rememberme_login_checkbox();?> <label for="remember"><?php _e('Remember me', 'dreamfree'); ?></label>
                </div>
                <div class="controls">
                    <button type="submit" class="btn btn-danger for-item-comment"><?php _e("Log in", 'dreamfree');?></button>
                </div>
            </div>
			
            <div class="actions">

                <a href="<?php echo osc_register_account_url(); ?>"><?php _e("Register", 'dreamfree'); ?></a><br /><a href="<?php echo osc_recover_user_password_url(); ?>"><?php _e("Forgot password?", 'dreamfree'); ?></a>
			</div>
			
        </form>
    </div>
</div>
<?php osc_current_web_theme_path('footer.php') ; ?>