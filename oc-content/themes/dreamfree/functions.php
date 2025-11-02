<?php

/**

DEFINES

*/
    define('dreamfree_THEME_VERSION', '320');
    if( (string)osc_get_preference('keyword_placeholder', 'dreamfree')=="" ) {
        Params::setParam('keyword_placeholder', __('ie. PHP Programmer', 'dreamfree') ) ;
    }
    osc_register_script('fancybox', osc_current_web_theme_url('js/fancybox/jquery.fancybox.pack.js'), array('jquery'));
    osc_enqueue_style('fancybox', osc_current_web_theme_url('js/fancybox/jquery.fancybox.css'));
    osc_enqueue_script('fancybox');

    osc_enqueue_style('font-awesome', osc_current_web_theme_url('css/font-awesome-4.1.0/css/font-awesome.min.css'));
    // used for date/dateinterval custom fields
    osc_enqueue_script('php-date');
    if(!OC_ADMIN) {
        osc_enqueue_style('fine-uploader-css', osc_assets_url('js/fineuploader/fineuploader.css'));
        if(getPreference('rtl','dreamfree')=='0') {
            osc_enqueue_style('dreamfree-fine-uploader-css', osc_current_web_theme_url('css/ajax-uploader.css'));
        } else {
            osc_enqueue_style('dreamfree-fine-uploader-css', osc_current_web_theme_url('css/ajax-uploader-rtl.css'));
        }
    }
    osc_enqueue_script('jquery-fineuploader');


/**

FUNCTIONS

*/

    // install options
    if( !function_exists('dreamfree_theme_install') ) {
        function dreamfree_theme_install() {
            osc_set_preference('keyword_placeholder', Params::getParam('keyword_placeholder'), 'dreamfree');
            osc_set_preference('version', dreamfree_THEME_VERSION, 'dreamfree');
            osc_set_preference('footer_link', '0', 'dreamfree');
            osc_set_preference('donation', '0', 'dreamfree');
            osc_set_preference('defaultShowAs@all', 'gallery', 'dreamfree');
            osc_set_preference('defaultShowAs@search', 'gallery');
            osc_set_preference('defaultLocationShowAs', 'dropdown', 'dreamfree'); // dropdown / autocomplete
            osc_set_preference('rtl', '0', 'dreamfree');
            osc_reset_preferences();
        }
    }
    // update options
    if( !function_exists('dreamfree_theme_update') ) {
        function dreamfree_theme_update($current_version) {
            if($current_version==0) {
                dreamfree_theme_install();
            }
            osc_delete_preference('default_logo', 'dreamfree');

            $logo_prefence = osc_get_preference('logo', 'dreamfree');
            $logo_name     = 'dreamfree_logo';
            $temp_name     = WebThemes::newInstance()->getCurrentThemePath() . 'images/logo.jpg';
            if( file_exists( $temp_name ) && !$logo_prefence) {

                $img = ImageResizer::fromFile($temp_name);
                $ext = $img->getExt();
                $logo_name .= '.'.$ext;
                $img->saveToFile(osc_uploads_path().$logo_name);
                osc_set_preference('logo', $logo_name, 'dreamfree');
            }
            osc_set_preference('version', '301', 'dreamfree');

            if($current_version<313 || $current_version=='3.0.1') {
                // add preferences
                osc_set_preference('defaultLocationShowAs', 'dropdown', 'dreamfree');
                osc_set_preference('version', '313', 'dreamfree');
            }
            osc_set_preference('version', '314', 'dreamfree');
            if($current_version<320 ) {
                // add preferences
                osc_set_preference('rtl', '0', 'dreamfree');
                osc_set_preference('version', '320', 'dreamfree');
            }
            osc_set_preference('version', '320', 'dreamfree');
            osc_reset_preferences();
        }
    }
    if(!function_exists('check_install_dreamfree_theme')) {
        function check_install_dreamfree_theme() {
            $current_version = osc_get_preference('version', 'dreamfree');
            //check if current version is installed or need an update<
            if( $current_version=='' ) {
                dreamfree_theme_update(0);
            } else if($current_version < dreamfree_THEME_VERSION){
                dreamfree_theme_update($current_version);
            }
        }
    }

    if(!function_exists('dreamfree_add_body_class_construct')) {
        function dreamfree_add_body_class_construct($classes){
            $dreamfreeBodyClass = dreamfreeBodyClass::newInstance();
            $classes = array_merge($classes, $dreamfreeBodyClass->get());
            return $classes;
        }
    }
    if(!function_exists('dreamfree_body_class')) {
        function dreamfree_body_class($echo = true){
            /**
            * Print body classes.
            *
            * @param string $echo Optional parameter.
            * @return print string with all body classes concatenated
            */
            osc_add_filter('dreamfree_bodyClass','dreamfree_add_body_class_construct');
            $classes = osc_apply_filter('dreamfree_bodyClass', array());
            if($echo && count($classes)){
                echo 'class="'.implode(' ',$classes).'"';
            } else {
                return $classes;
            }
        }
    }
    if(!function_exists('dreamfree_add_body_class')) {
        function dreamfree_add_body_class($class){
            /**
            * Add new body class to body class array.
            *
            * @param string $class required parameter.
            */
            $dreamfreeBodyClass = dreamfreeBodyClass::newInstance();
            $dreamfreeBodyClass->add($class);
        }
    }
    if(!function_exists('dreamfree_nofollow_construct')) {
        /**
        * Hook for header, meta tags robots nofollos
        */
        function dreamfree_nofollow_construct() {
            echo '<meta name="robots" content="noindex, nofollow, noarchive" />' . PHP_EOL;
            echo '<meta name="googlebot" content="noindex, nofollow, noarchive" />' . PHP_EOL;

        }
    }
    if( !function_exists('dreamfree_follow_construct') ) {
        /**
        * Hook for header, meta tags robots follow
        */
        function dreamfree_follow_construct() {
            echo '<meta name="robots" content="index, follow" />' . PHP_EOL;
            echo '<meta name="googlebot" content="index, follow" />' . PHP_EOL;

        }
    } 












    /* logo */
    if( !function_exists('logo_header') ) {
        function logo_header() {
             $logo = osc_get_preference('logo','dreamfree');
             $html = '<a href="'.osc_base_url().'"><img border="0" alt="' . osc_page_title() . '" src="' . dreamfree_logo_url() . '"></a>';
             if( $logo!='' && file_exists( osc_uploads_path() . $logo ) ) {
                return $html;
             } else {
                return '<a href="'.osc_base_url().'">'.osc_page_title().'</a>';
            }
        }
    }
    /* logo */
    if( !function_exists('dreamfree_logo_url') ) {
        function dreamfree_logo_url() {
            $logo = osc_get_preference('logo','dreamfree');
            if( $logo ) {
                return osc_uploads_url($logo);
            }
            return false;
        }
    }
    if( !function_exists('dreamfree_draw_item') ) {
        function dreamfree_draw_item($class = false,$admin = false, $premium = false) {
            $filename = 'loop-single';
            if($premium){
                $filename .='-premium';
            }
            require WebThemes::newInstance()->getCurrentThemePath().$filename.'.php';
        }
    }
    if( !function_exists('dreamfree_show_as') ){
        function dreamfree_show_as(){

            $p_sShowAs    = Params::getParam('sShowAs');
            $aValidShowAsValues = array('gallery', 'list');
            if (!in_array($p_sShowAs, $aValidShowAsValues)) {
                $p_sShowAs = dreamfree_default_show_as();
            }

            return $p_sShowAs;
        }
    }
    if( !function_exists('dreamfree_default_direction') ){
        function dreamfree_default_direction(){
            return getPreference('rtl','dreamfree');
        }
    }
    if( !function_exists('dreamfree_default_show_as') ){
        function dreamfree_default_show_as(){
            return getPreference('defaultShowAs@all','dreamfree');
        }
    }
    if( !function_exists('dreamfree_default_location_show_as') ){
        function dreamfree_default_location_show_as(){
            return osc_get_preference('defaultLocationShowAs','dreamfree');
        }
    }
    if( !function_exists('dreamfree_draw_categories_list') ) {
        function dreamfree_draw_categories_list(){ ?>
        <?php if(!osc_is_home_page()){ echo '<div class="resp-wrapper">'; } ?>
         <?php
         //cell_3
        $total_categories   = osc_count_categories();
        $col1_max_cat       = ceil($total_categories/8);

         osc_goto_first_category();
         $i      = 0;

         while ( osc_has_categories() ) {
         ?>
        <?php
            if($i%$col1_max_cat == 0){
                if($i > 0) { echo '</div>'; }
                if($i == 0) {
                   echo '<div class="cell_3 first_cel">';
                } else {
                    echo '<div class="cell_3">';
                }
            }
        ?>

<div class="dropdown">
            
                
                    <?php
					$_url       = osc_search_category_url();
					$_slug      = osc_category_slug();
					$_catid      =  osc_category_id() ;
                    $_name      = osc_category_name();
					$_total_items = osc_category_total_items();
                    if ( osc_count_subcategories() > 0 ) { ?>                    
                    <?php } ?>
                    <?php if($_total_items > 0) { ?>
              <div class="dropdown-toggle top-category-icon"   data-toggle="dropdown"  ><a class="category <?php echo $_slug; ?>" href="<?php echo $_url; ?>"><center><img class="category-icon" src="<?php echo osc_current_web_theme_url('images/cat/') . $_catid  .'.png' ?>" title="<?php echo $_name ; ?>"/><p><?php echo $_name ; ?></p></a><p><div class="total_items-top"><?php echo $_total_items ; ?>&nbsp;<?php _e("listings", 'dreamfree');?></div></p></center></div>
                    <?php } else { ?>
                    <div class="dropdown-toggle top-category-icon"   data-toggle="dropdown"  ><a class="category <?php echo $_slug; ?>" href="<?php echo $_url; ?>"><center><img class="category-icon" src="<?php echo osc_current_web_theme_url('images/cat/') . $_catid  .'.png' ?>" title="<?php echo $_name ; ?>"/><p><?php echo $_name ; ?></p></a><p><div class="total_items-top"><?php echo $_total_items ; ?>&nbsp;<?php _e('listings', 'dreamfree') ; ?></div></p></center></div>
                    
					<?php } ?>
                
                 <?php if ( osc_count_subcategories() > 0 ) { ?>
                   <div class="dropdown-menu subcategories-top" aria-labelledby="dropdownMenuButton">
                         <?php $tic = 0; while ( osc_has_subcategories() && $tic < 8) { ?>
                            
                             <?php if( osc_category_total_items() > 0 ) { ?>
                                 <a class="dropdown-item subcategories"<?php echo osc_category_slug() ; ?>" href="<?php echo osc_search_category_url() ; ?>"><?php echo osc_category_name() ; ?><span class="badge badge-secondary total-items-top"><?php echo osc_category_total_items() ; ?></span></a>
                             <?php } else { ?>
                                <a class="dropdown-item subcategories"<?php echo osc_category_slug() ; ?>" href="#"><?php echo osc_category_name() ; ?><span class="badge badge-secondary total-items-top"><?php echo osc_category_total_items() ; ?></span></a>
                             <?php } ?>
                             
                         <?php } ?>
                   

                 <?php } ?>
            
        
		</div></div><br>
        <?php
                $i++;
            }
            echo '</div>';
        ?>
        <?php if(!osc_is_home_page()){ echo '</div>'; } ?>
        <?php
        }
    }
    if( !function_exists('dreamfree_search_number') ) {
        /**
          *
          * @return array
          */
        function dreamfree_search_number() {
            $search_from = ((osc_search_page() * osc_default_results_per_page_at_search()) + 1);
            $search_to   = ((osc_search_page() + 1) * osc_default_results_per_page_at_search());
            if( $search_to > osc_search_total_items() ) {
                $search_to = osc_search_total_items();
            }

            return array(
                'from' => $search_from,
                'to'   => $search_to,
                'of'   => osc_search_total_items()
            );
        }
    }
    /*
     * Helpers used at view
     */
    if( !function_exists('dreamfree_item_title') ) {
        function dreamfree_item_title() {
            $title = osc_item_title();
            foreach( osc_get_locales() as $locale ) {
                if( Session::newInstance()->_getForm('title') != "" ) {
                    $title_ = Session::newInstance()->_getForm('title');
                    if( @$title_[$locale['pk_c_code']] != "" ){
                        $title = $title_[$locale['pk_c_code']];
                    }
                }
            }
            return $title;
        }
    }
    if( !function_exists('dreamfree_item_description') ) {
        function dreamfree_item_description() {
            $description = osc_item_description();
            foreach( osc_get_locales() as $locale ) {
                if( Session::newInstance()->_getForm('description') != "" ) {
                    $description_ = Session::newInstance()->_getForm('description');
                    if( @$description_[$locale['pk_c_code']] != "" ){
                        $description = $description_[$locale['pk_c_code']];
                    }
                }
            }
            return $description;
        }
    }
    if( !function_exists('related_listings') ) {
        function related_listings() {
            View::newInstance()->_exportVariableToView('items', array());

            $mSearch = new Search();
            $mSearch->addCategory(osc_item_category_id());
            $mSearch->addRegion(osc_item_region());
            $mSearch->addItemConditions(sprintf("%st_item.pk_i_id < %s ", DB_TABLE_PREFIX, osc_item_id()));
            $mSearch->limit('0', '5');

            $aItems      = $mSearch->doSearch();
            $iTotalItems = count($aItems);
            if( $iTotalItems == 5 ) {
                View::newInstance()->_exportVariableToView('items', $aItems);
                return $iTotalItems;
            }
            unset($mSearch);

            $mSearch = new Search();
            $mSearch->addCategory(osc_item_category_id());
            $mSearch->addItemConditions(sprintf("%st_item.pk_i_id != %s ", DB_TABLE_PREFIX, osc_item_id()));
            $mSearch->limit('0', '3');

            $aItems = $mSearch->doSearch();
            $iTotalItems = count($aItems);
            if( $iTotalItems > 0 ) {
                View::newInstance()->_exportVariableToView('items', $aItems);
                return $iTotalItems;
            }
            unset($mSearch);

            return 0;
        }
    }

    if( !function_exists('osc_is_contact_page') ) {
        function osc_is_contact_page() {
            if( Rewrite::newInstance()->get_location() === 'contact' ) {
                return true;
            }

            return false;
        }
    }

    if( !function_exists('get_breadcrumb_lang') ) {
        function get_breadcrumb_lang() {
            $lang = array();
            $lang['item_add']               = __('Publish a listing', 'dreamfree');
            $lang['item_edit']              = __('Edit your listing', 'dreamfree');
            $lang['item_send_friend']       = __('Send to a friend', 'dreamfree');
            $lang['item_contact']           = __('Contact publisher', 'dreamfree');
            $lang['search']                 = __('Search results', 'dreamfree');
            $lang['search_pattern']         = __('Search results: %s', 'dreamfree');
            $lang['user_dashboard']         = __('Dashboard', 'dreamfree');
            $lang['user_dashboard_profile'] = __("%s's profile", 'dreamfree');
            $lang['user_account']           = __('Account', 'dreamfree');
            $lang['user_items']             = __('Listings', 'dreamfree');
            $lang['user_alerts']            = __('Alerts', 'dreamfree');
            $lang['user_profile']           = __('Update account', 'dreamfree');
            $lang['user_change_email']      = __('Change email', 'dreamfree');
            $lang['user_change_username']   = __('Change username', 'dreamfree');
            $lang['user_change_password']   = __('Change password', 'dreamfree');
            $lang['login']                  = __('Login', 'dreamfree');
            $lang['login_recover']          = __('Recover password', 'dreamfree');
            $lang['login_forgot']           = __('Change password', 'dreamfree');
            $lang['register']               = __('Create a new account', 'dreamfree');
            $lang['contact']                = __('Contact', 'dreamfree');
            return $lang;
        }
    }

	
    if(!function_exists('user_dashboard_redirect')) {
        function user_dashboard_redirect() {
            $page   = Params::getParam('page');
            $action = Params::getParam('action');
            if($page=='user' && $action=='dashboard') {
                if(ob_get_length()>0) {
                    ob_end_flush();
                }
                header("Location: ".osc_user_list_items_url(), TRUE,301);
            }
        }
        osc_add_hook('init', 'user_dashboard_redirect');
    }
// GET ALL SEARCH PARAMETERS
function dreamfree_search_params() {
 return array(
   'sCategory' => Params::getParam('sCategory'),
   'sCountry' => Params::getParam('sCountry'),
   'sRegion' => Params::getParam('sRegion'),
   'sCity' => Params::getParam('sCity'),
   //'sPriceMin' => Params::getParam('sPriceMin'),
   //'sPriceMin' => Params::getParam('sPriceMax'),
   'sCompany' => Params::getParam('sCompany'),
   'sShowAs' => Params::getParam('sShowAs'),
   'sOrder' => Params::getParam('sOrder'),
   'iOrderType' => Params::getParam('iOrderType')
  );
}	
// SMART DATE
function dreamfree_smart_date( $time ) {
  $time_diff = round(abs(time() - strtotime( $time )) / 60);
  $time_diff_h = floor($time_diff/60);
  $time_diff_d = floor($time_diff/1440);
  $time_diff_w = floor($time_diff/10080);
  $time_diff_m = floor($time_diff/43200);
  $time_diff_y = floor($time_diff/518400);


  if($time_diff < 2) {
    $time_diff_name = __('minute ago', 'dreamfree');
  } else if ($time_diff < 60) {
    $time_diff_name = sprintf(__('%d minutes ago', 'dreamfree'), $time_diff);
  } else if ($time_diff < 120) {
    $time_diff_name = sprintf(__('%d hour ago', 'dreamfree'), $time_diff_h);
  } else if ($time_diff < 1440) {
    $time_diff_name = sprintf(__('%d hours ago', 'dreamfree'), $time_diff_h);
  } else if ($time_diff < 2880) {
    $time_diff_name = sprintf(__('%d day ago', 'dreamfree'), $time_diff_d);
  } else if ($time_diff < 10080) {
    $time_diff_name = sprintf(__('%d days ago', 'dreamfree'), $time_diff_d);
  } else if ($time_diff < 20160) {
    $time_diff_name = sprintf(__('%d week ago', 'dreamfree'), $time_diff_w);
  } else if ($time_diff < 43200) {
    $time_diff_name = sprintf(__('%d weeks ago', 'dreamfree'), $time_diff_w);
  } else if ($time_diff < 86400) {
    $time_diff_name = sprintf(__('%d month ago', 'dreamfree'), $time_diff_m);
  } else if ($time_diff < 518400) {
    $time_diff_name = sprintf(__('%d months ago', 'dreamfree'), $time_diff_m);
  } else if ($time_diff < 1036800) {
    $time_diff_name = sprintf(__('%d year ago', 'dreamfree'), $time_diff_y);
  } else {
    $time_diff_name = sprintf(__('%d years ago', 'dreamfree'), $time_diff_y);
  }

  return $time_diff_name;
}
    if( !function_exists('get_user_menu') ) {
        function get_user_menu() {
            $options   = array();
            $options[] = array(
                'name' => __('Public Profile'),
                 'url' => osc_user_public_profile_url(),
               'class' => 'list-group-item list-group-item-action user-pro'
            );
            $options[] = array(
                'name'  => __('Listings', 'dreamfree'),
                'url'   => osc_user_list_items_url(),
                'class' => 'list-group-item list-group-item-action user-pro'
            );
            $options[] = array(
                'name' => __('Alerts', 'dreamfree'),
                'url' => osc_user_alerts_url(),
                'class' => 'list-group-item list-group-item-action user-pro'
            );
            $options[] = array(
                'name'  => __('Account', 'dreamfree'),
                'url'   => osc_user_profile_url(),
                'class' => 'list-group-item list-group-item-action user-pro'
            );
            $options[] = array(
                'name'  => __('Change email', 'dreamfree'),
                'url'   => osc_change_user_email_url(),
                'class' => 'list-group-item list-group-item-action user-pro'
            );
            $options[] = array(
                'name'  => __('Change username', 'dreamfree'),
                'url'   => osc_change_user_username_url(),
                'class' => 'list-group-item list-group-item-action user-pro'
            );
            $options[] = array(
                'name'  => __('Change password', 'dreamfree'),
                'url'   => osc_change_user_password_url(),
                'class' => 'list-group-item list-group-item-action user-pro'
            );
            $options[] = array(
                'name'  => __('Delete account', 'dreamfree'),
                'url'   => '#',
                'class' => 'opt_delete_account list-group-item list-group-item-action user-pro'
            );

            return $options;
        }
    }

    if( !function_exists('delete_user_js') ) {
        function delete_user_js() {
            $location = Rewrite::newInstance()->get_location();
            $section  = Rewrite::newInstance()->get_section();
            if( ($location === 'user' && in_array($section, array('dashboard', 'profile', 'alerts', 'change_email', 'change_username',  'change_password', 'items'))) || (Params::getParam('page') ==='custom' && Params::getParam('in_user_menu')==true ) ) {
                osc_enqueue_script('delete-user-js');
            }
        }
        osc_add_hook('header', 'delete_user_js', 1);
    }

    if( !function_exists('user_info_js') ) {
        function user_info_js() {
            $location = Rewrite::newInstance()->get_location();
            $section  = Rewrite::newInstance()->get_section();

            if( $location === 'user' && in_array($section, array('dashboard', 'profile', 'alerts', 'change_email', 'change_username',  'change_password', 'items')) ) {
                $user = User::newInstance()->findByPrimaryKey( Session::newInstance()->_get('userId') );
                View::newInstance()->_exportVariableToView('user', $user);
                ?>
<script type="text/javascript">
    dreamfree.user = {};
    dreamfree.user.id = '<?php echo osc_user_id(); ?>';
    dreamfree.user.secret = '<?php echo osc_user_field("s_secret"); ?>';
</script>
            <?php }
        }
        osc_add_hook('header', 'user_info_js');
    }

    function theme_dreamfree_actions_admin() {
        //if(OC_ADMIN)
        if( Params::getParam('file') == 'oc-content/themes/dreamfree/admin/settings.php' ) {
            if( Params::getParam('donation') == 'successful' ) {
                osc_set_preference('donation', '1', 'dreamfree');
                osc_reset_preferences();
            }
        }

        switch( Params::getParam('action_specific') ) {
            case('settings'):
                $footerLink  = Params::getParam('footer_link');
				$catsmall  = Params::getParam('catsmall');
				$statsmain  = Params::getParam('statsmain');
				
                osc_set_preference('keyword_placeholder', Params::getParam('keyword_placeholder'), 'dreamfree');
				 osc_set_preference('footer_link', ($footerLink ? '1' : '0'), 'dreamfree');
                osc_set_preference('catsmall', ($catsmall ? '1' : '0'), 'dreamfree');
				osc_set_preference('statsmain', ($statsmain ? '1' : '0'), 'dreamfree');
                osc_set_preference('defaultShowAs@all', Params::getParam('defaultShowAs@all'), 'dreamfree');
                osc_set_preference('defaultShowAs@search', Params::getParam('defaultShowAs@all'));

                osc_set_preference('defaultLocationShowAs', Params::getParam('defaultLocationShowAs'), 'dreamfree');

osc_set_preference('coode_adsense',         trim(Params::getParam('coode_adsense', false, false, false)),                  'dreamfree');			
osc_set_preference('name-site',         trim(Params::getParam('name-site', false, false, false)),                  'dreamfree');	
osc_set_preference('link-site',         trim(Params::getParam('link-site', false, false, false)),                  'dreamfree');				
osc_set_preference('facebook',         trim(Params::getParam('facebook', false, false, false)), 'dreamfree');		
osc_set_preference('pinterest',         trim(Params::getParam('pinterest', false, false, false)), 'dreamfree');		
osc_set_preference('twitter',         trim(Params::getParam('twitter', false, false, false)), 'dreamfree');		
osc_set_preference('linkedin',         trim(Params::getParam('linkedin', false, false, false)), 'dreamfree');
				

                osc_set_preference('header-728x90',         trim(Params::getParam('header-728x90', false, false, false)),                  'dreamfree');
                osc_set_preference('homepage-728x90',       trim(Params::getParam('homepage-728x90', false, false, false)),                'dreamfree');
                osc_set_preference('sidebar-300x250',       trim(Params::getParam('sidebar-300x250', false, false, false)),                'dreamfree');
                osc_set_preference('sidebara-300x250',       trim(Params::getParam('sidebara-300x250', false, false, false)),                'dreamfree');                
				osc_set_preference('search-results-top-728x90',     trim(Params::getParam('search-results-top-728x90', false, false, false)),          'dreamfree');
                osc_set_preference('search-results-middle-728x90',  trim(Params::getParam('search-results-middle-728x90', false, false, false)),       'dreamfree');

                osc_set_preference('rtl', (Params::getParam('rtl') ? '1' : '0'), 'dreamfree');

                osc_add_flash_ok_message(__('Theme settings updated correctly', 'dreamfree'), 'admin');
                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/dreamfree/admin/settings.php'));
            break;
            case('upload_logo'):
                $package = Params::getFiles('logo');
                if( $package['error'] == UPLOAD_ERR_OK ) {
                    $img = ImageResizer::fromFile($package['tmp_name']);
                    $ext = $img->getExt();
                    $logo_name     = 'dreamfree_logo';
                    $logo_name    .= '.'.$ext;
                    $path = osc_uploads_path() . $logo_name ;
                    $img->saveToFile($path);

                    osc_set_preference('logo', $logo_name, 'dreamfree');

                    osc_add_flash_ok_message(__('The logo image has been uploaded correctly', 'dreamfree'), 'admin');
                } else {
                    osc_add_flash_error_message(__("An error has occurred, please try again", 'dreamfree'), 'admin');
                }
                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/dreamfree/admin/header.php'));
            break;
            case('remove'):
                $logo = osc_get_preference('logo','dreamfree');
                $path = osc_uploads_path() . $logo ;
                if(file_exists( $path ) ) {
                    @unlink( $path );
                    osc_delete_preference('logo','dreamfree');
                    osc_reset_preferences();
                    osc_add_flash_ok_message(__('The logo image has been removed', 'dreamfree'), 'admin');
                } else {
                    osc_add_flash_error_message(__("Image not found", 'dreamfree'), 'admin');
                }
                osc_redirect_to(osc_admin_render_theme_url('oc-content/themes/dreamfree/admin/header.php'));
            break;
        }
    }

    function dreamfree_redirect_user_dashboard()
    {
        if( (Rewrite::newInstance()->get_location() === 'user') && (Rewrite::newInstance()->get_section() === 'dashboard') ) {
            header('Location: ' .osc_user_list_items_url());
            exit;
        }
    }

    function dreamfree_delete() {
        Preference::newInstance()->delete(array('s_section' => 'dreamfree'));
    }

    osc_add_hook('init', 'dreamfree_redirect_user_dashboard', 2);
    osc_add_hook('init_admin', 'theme_dreamfree_actions_admin');
    osc_add_hook('theme_delete_dreamfree', 'dreamfree_delete');
    osc_admin_menu_appearance(__('Header logo', 'dreamfree'), osc_admin_render_theme_url('oc-content/themes/dreamfree/admin/header.php'), 'header_dreamfree');
    osc_admin_menu_appearance(__('Theme settings', 'dreamfree'), osc_admin_render_theme_url('oc-content/themes/dreamfree/admin/settings.php'), 'settings_dreamfree');
/**

TRIGGER FUNCTIONS

*/
check_install_dreamfree_theme();
if(osc_is_home_page()){
    osc_add_hook('inside-main','dreamfree_draw_categories_list');
} else if( osc_is_static_page() || osc_is_contact_page() ){
    osc_add_hook('before-content','dreamfree_draw_categories_list');
}

if(osc_is_home_page() || osc_is_search_page()){
    dreamfree_add_body_class('has-searchbox');
}


function dreamfree_sidebar_category_search($catId = null)
{
    $aCategories = array();
    if($catId==null) {
        $aCategories[] = Category::newInstance()->findRootCategoriesEnabled();
    } else {
        // if parent category, only show parent categories
        $aCategories = Category::newInstance()->toRootTree($catId);
        end($aCategories);
        $cat = current($aCategories);
        // if is parent of some category
        $childCategories = Category::newInstance()->findSubcategoriesEnabled($cat['pk_i_id']);
        if(count($childCategories) > 0) {
            $aCategories[] = $childCategories;
        }
    }

    if(count($aCategories) == 0) {
        return "";
    }

    dreamfree_print_sidebar_category_search($aCategories, $catId);
}

function dreamfree_print_sidebar_category_search($aCategories, $current_category = null, $i = 0)
{
    $class = '';
    if(!isset($aCategories[$i])) {
        return null;
    }

    if($i===0) {
        $class = 'class="category"';
    }

    $c   = $aCategories[$i];
    $i++;
    if(!isset($c['pk_i_id'])) {
        echo '<ul '.$class.'>';
        if($i==1) {
            echo '<li><a href="'.osc_esc_html(osc_update_search_url(array('sCategory'=>null, 'iPage'=>null))).'">'.__('All categories', 'dreamfree')."</a></li>";
        }
        foreach($c as $key => $value) {
    ?>
            <li>
                <a id="cat_<?php echo osc_esc_html($value['pk_i_id']);?>" href="<?php echo osc_esc_html(osc_update_search_url(array('sCategory'=> $value['pk_i_id'], 'iPage'=>null))); ?>">
                <?php if(isset($current_category) && $current_category == $value['pk_i_id']){ echo '<strong>'.$value['s_name'].'</strong>'; }
                else{ echo $value['s_name']; } ?>
                </a>

            </li>
    <?php
        }
        if($i==1) {
        echo "</ul>";
        } else {
        echo "</ul>";
        }
    } else {
    ?>
    <ul <?php echo $class;?>>
        <?php if($i==1) { ?>
        <li><a href="<?php echo osc_esc_html(osc_update_search_url(array('sCategory'=>null, 'iPage'=>null))); ?>"><?php _e('All categories', 'dreamfree'); ?></a></li>
        <?php } ?>
            <li>
                <a id="cat_<?php echo osc_esc_html($c['pk_i_id']);?>" href="<?php echo osc_esc_html(osc_update_search_url(array('sCategory'=> $c['pk_i_id'], 'iPage'=>null))); ?>">
                <?php if(isset($current_category) && $current_category == $c['pk_i_id']){ echo '<strong>'.$c['s_name'].'</strong>'; }
                      else{ echo $c['s_name']; } ?>
                </a>
                <?php dreamfree_print_sidebar_category_search($aCategories, $current_category, $i); ?>
            </li>
        <?php if($i==1) { ?>
        <?php } ?>
    </ul>
<?php
    }
}

/**

CLASSES

*/
class dreamfreeBodyClass
{
    /**
    * Custom Class for add, remove or get body classes.
    *
    * @param string $instance used for singleton.
    * @param array $class.
    */
    private static $instance;
    private $class;

    private function __construct()
    {
        $this->class = array();
    }

    public static function newInstance()
    {
        if (  !self::$instance instanceof self)
        {
            self::$instance = new self;
        }
        return self::$instance;
    }

    public function add($class)
    {
        $this->class[] = $class;
    }
    public function get()
    {
        return $this->class;
    }
}

/**

HELPERS

*/
if( !function_exists('osc_uploads_url')) {
    function osc_uploads_url($item = '') {
        $logo = osc_get_preference('logo', 'dreamfree');
        if ($logo != '' && file_exists(osc_uploads_path() . $logo)) {
            $path = str_replace(ABS_PATH, '', osc_uploads_path() . '/');
            return osc_base_url() . $path . $item;
        }
    }
}

/*

    ads  SEARCH

 */
if (!function_exists('search_ads_listing_top_fn')) {
    function search_ads_listing_top_fn() {
        if(osc_get_preference('search-results-top-728x90', 'dreamfree')!='') {
            echo '<div class="clear"></div>' . PHP_EOL;
            echo '<center><div class="ads_728">' . PHP_EOL;
            echo osc_get_preference('search-results-top-728x90', 'dreamfree');
            echo '</div></center>' . PHP_EOL;
        }
    }
}
//osc_add_hook('search_ads_listing_top', 'search_ads_listing_top_fn');

if (!function_exists('search_ads_listing_medium_fn')) {
    function search_ads_listing_medium_fn() {
        if(osc_get_preference('search-results-middle-728x90', 'dreamfree')!='') {
            echo '<center><div class="clear"></div>' . PHP_EOL;
            echo '<div class="ads_728">' . PHP_EOL;
            echo osc_get_preference('search-results-middle-728x90', 'dreamfree');
            echo '</div></center>' . PHP_EOL;
        }
    }
}
function cust_get_single_custom_field_value($name) {
    $getItemMeta = osc_get_item_meta();
    $cf = array();

    foreach ($getItemMeta as $key => $field) {
        if ($field['s_name'] == $name) {
            $cf = $getItemMeta[$key];
            break;
        }
    }

    if ($cf['e_type'] == 'DATE' || $cf['e_type'] == 'DATEINTERVAL') {
        if (!is_array($cf['s_value'])) {
            if (!$cf['s_value']) return array();
            $cf['s_value'] = osc_format_date(date('Y-m-d', $cf['s_value']));
        } else {
            if (!$cf['s_value']['from'] || !$cf['s_value']['to']) return array();
            $cf['s_value'] = __('From') . ' ' . osc_format_date(date('Y-m-d', $cf['s_value']['from'])). ' ' . __('to') . ' ' . osc_format_date(date('Y-m-d', $cf['s_value']['to']));
        }
    }

    return $cf['s_value'];
}
osc_add_hook('search_ads_listing_medium', 'search_ads_listing_medium_fn');



?>
<?php
// ... (الكود الموجود مسبقاً في functions.php)

/**
 * دالة لمعالجة ورفع ملف PDF عند نشر/تعديل الإعلان
 * هذه الدالة يتم ربطها بهوكس Osclass بعد حفظ بيانات الإعلان الأساسية.
 */
function dreamfree_handle_pdf_upload($item) {
    // 1. تحديد المجلد الهدف باستخدام دالة Osclass للحصول على مسار الثيم
    // هذا سيعطينا المسار: /oc-content/themes/dreamfree/
    $upload_dir = osc_themes_path() . osc_current_web_theme() . '/images/pdf/';

    // تأكد من وجود المجلد وإمكانية الكتابة فيه
    if (!is_dir($upload_dir)) {
        mkdir($upload_dir, 0755, true);
    }

    // 2. التحقق من وجود ملف PDF مرفوع
    if (isset($_FILES['pdf_file']) && $_FILES['pdf_file']['error'] == 0) {
        $file = $_FILES['pdf_file'];

        // 3. التحقق من أن الملف المرفوع هو PDF (MIME Type)
        $allowed_mime_types = array('application/pdf');
        if (!in_array($file['type'], $allowed_mime_types)) {
            // يمكن إضافة رسالة خطأ هنا
            return;
        }

        // 4. تحديد اسم الملف ليكون ID الإعلان مع اللاحقة .pdf
        $item_id = $item['pk_i_id'];
        $new_filename = $item_id . '.pdf';
        $destination = $upload_dir . $new_filename;

        // 5. نقل الملف من المسار المؤقت إلى المسار الدائم
        if (move_uploaded_file($file['tmp_name'], $destination)) {
            // تم رفع الملف بنجاح!
            // يمكنك هنا إضافة كود لتخزين اسم الملف أو مساره في قاعدة البيانات إذا لزم الأمر
            // (على سبيل المثال كـ Item Extra Field)
        } else {
            // فشل في نقل الملف
        }
    }
}

// ربط الدالة بهوكس Osclass عند نشر إعلان جديد
osc_add_hook('posted_item', 'dreamfree_handle_pdf_upload');

// ربط الدالة بهوكس Osclass عند تعديل إعلان
osc_add_hook('edited_item', 'dreamfree_handle_pdf_upload');
?>