<?php
// meta tag robots
    osc_add_hook('header','dreamfree_nofollow_construct');

    dreamfree_add_body_class('user user-profile');
    osc_add_hook('before-main','sidebar');
    function sidebar(){
        osc_current_web_theme_path('user-sidebar.php');
    }
    osc_add_filter('meta_title_filter','custom_meta_title');
    function custom_meta_title($data){
        return __('Change password', 'dreamfree');;
    }
    osc_current_web_theme_path('header.php') ;
    $osc_user = osc_user();
?>
<h1><?php _e('Change password', 'dreamfree'); ?></h1>
<div class="form-container form-horizontal">
    <div class="resp-wrapper">
        <ul id="error_list"></ul>
        <form action="<?php echo osc_base_url(true); ?>" method="post">
            <input type="hidden" name="page" value="user" />
            <input type="hidden" name="action" value="change_password_post" />

                <label class="control-label" for="password"><?php _e('Current password', 'dreamfree'); ?> *</label>
<div class="input-group mb-3">
<div class="input-group-prepend input-profile-main">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-lock"></i><input type="password" name="password" id="password" value="" autocomplete="off" />
 </span></div></div>
 

                <label class="control-label" for="new_password"><?php _e('New password', 'dreamfree'); ?> *</label>
<div class="input-group mb-3">
<div class="input-group-prepend input-profile-main">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-unlock-alt"></i> <input type="password" name="new_password" id="new_password" value="" autocomplete="off" />
 </span></div></div>
 

                <label class="control-label" for="new_password2"><?php _e('Repeat new password', 'dreamfree'); ?> *</label>
<div class="input-group mb-3">
<div class="input-group-prepend input-profile-main">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-unlock"></i> <input type="password" name="new_password2" id="new_password2" value="" autocomplete="off" />
 </span></div></div>
 
            <div class="control-group">
                <div class="controls">
                    <button type="submit" class="btn btn-danger user-button-profilea"><?php _e("Update", 'dreamfree');?></button>
                </div>
            </div>
        </form>
    </div>
</div>
<?php osc_current_web_theme_path('footer.php') ; ?>