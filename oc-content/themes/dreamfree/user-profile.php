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
        return __('Update account', 'dreamfree');
    }
    osc_current_web_theme_path('header.php') ;
    $osc_user = osc_user();
?>
<h1><?php _e('Update account', 'dreamfree'); ?></h1>
<?php UserForm::location_javascript(); ?>

<hr>
<div class="form-container form-horizontal">
    <div class="resp-wrapper">
        <ul id="error_list"></ul>
		<?php if(function_exists('profile_picture_upload')) { echo profile_picture_upload(); } ?>
        <form action="<?php echo osc_base_url(true); ?>" method="post">
            <input type="hidden" name="page" value="user" />
            <input type="hidden" name="action" value="profile_post" />
			
<label class="control-label" for="name"><?php _e('Name', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profilea">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i><?php UserForm::name_text(osc_user()); ?>
 </span></div></div>
 

                <label class="control-label" for="user_type"><?php _e('User type', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profilea">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-users"></i><?php UserForm::is_company_select(osc_user()); ?>
 </span></div></div>

                <label class="control-label" for="phoneMobile"><?php _e('Cell phone', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profilea">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-mobile"></i><?php UserForm::mobile_text(osc_user()); ?>
 </span></div></div>

                <label class="control-label"l for="address"><?php _e('WhatsApp', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profilea">
<span class="input-group-text" id="basic-addon1"><i class="fab fa-whatsapp"></i><?php UserForm::address_text(osc_user()); ?>
 </span></div></div> 

<label class="control-label" for="phoneLand"><?php _e('Phone', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profilea">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-phone"></i><?php UserForm::phone_land_text(osc_user()); ?>
 </span></div></div>
 

<label class="control-label" for="country"><?php _e('Country', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profilea">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-globe"></i><?php UserForm::country_select(osc_get_countries(), osc_user()); ?>
</span></div></div>

                <label class="control-label" for="region"><?php _e('Region', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profilea">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-map-marker"></i><?php UserForm::region_select(osc_get_regions(), osc_user()); ?>
 </span></div></div>
 

                <label class="control-label" for="city"><?php _e('City', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profilea">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-map"></i><?php UserForm::city_select(osc_get_cities(), osc_user()); ?>
 </span></div></div>
 
                <label class="control-label" for="city_area"><?php _e('City area', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profilea">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-map-signs"></i><?php UserForm::city_area_text(osc_user()); ?>
 </span></div></div>

                <label class="control-label" for="webSite"><?php _e('Website', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profilea">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-link"></i><?php UserForm::website_text(osc_user()); ?>
 </span></div></div>

                <label class="control-label" for="s_info"><?php _e('Description', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profilea">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-pencil-square-o"></i><?php UserForm::info_textarea('s_info', osc_locale_code(), @$osc_user['locale'][osc_locale_code()]['s_info']); ?>
 </span></div></div>

            <?php osc_run_hook('user_profile_form', osc_user()); ?>
            <div class="control-group">
                <div class="controls">
                    <button type="submit" class="btn btn-danger user-button-profilea"><?php _e("Update", 'dreamfree');?></button>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <?php osc_run_hook('user_form', osc_user()); ?>
                </div>
            </div>
        </form>
    </div>
</div>

<?php osc_current_web_theme_path('footer.php') ; ?>