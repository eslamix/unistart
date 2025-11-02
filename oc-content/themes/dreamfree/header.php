<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="<?php echo str_replace('_', '-', osc_current_user_locale()) ; ?>">
	<head>
	
        <?php osc_current_web_theme_path('common/head.php') ; ?>
    </head>
<body <?php dreamfree_body_class(); ?>>
<div id="header">

	    <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <div id="logo">
            <?php echo logo_header(); ?>
            <span id="description"><?php echo osc_page_description(); ?></span>
        </div>
		<div class="mobail">
<a href="<?php echo osc_base_url(); ?>"><img src="<?php echo osc_current_web_theme_url('images/logo-mobile.png'); ?>" width="48" height="48"></a>    
	 </div>

<div class="navbar-brand top740">
  <a class="navbar-nav mr-auto" href="http://localhost/asas/index.php?page=categories">
  <button class="btn btn-universities"
        style="display: flex; align-items: center; gap: 6px; 
               font-size: 15px; font-weight: 600;
               border-radius: 6px; 
               background: linear-gradient(135deg, #343a40, #23272b);
               color: #fff;
               box-shadow: 0 2px 5px rgba(0,0,0,0.15);
               transition: all 0.3s ease;">
  <i class="fa fa-university" style="font-size:17px;"></i>
  <span style="opacity: 0.9;">الجامعات</span>
</button>

<style>
.btn-universities:hover {
  background: linear-gradient(135deg, #495057, #343a40) !important;
  transform: translateY(-2px);
  box-shadow: 0 4px 10px rgba(52, 58, 64, 0.4);
}
</style>



  </a>
</div>

<style>
.btn.btn-danger:hover {
  background: linear-gradient(135deg, #b02a37, #841b24) !important;
  transform: translateY(-1px);
  box-shadow: 0 4px 10px rgba(132, 27, 36, 0.4);
}
</style>


	
	<div class="navbar-brand" style="float: left;">
  <a class="navbar-nav mr-auto" href="http://localhost/asas/index.php?page=catg">
    <button class="btn btn-categories"
            style="display: flex; align-items: center; gap: 6px; 
                   font-size: 15px; font-weight: 600;
                   border-radius: 6px; 
                   background: linear-gradient(135deg, #007bff, #0056b3);
                   color: #fff;
                   box-shadow: 0 2px 5px rgba(0, 0, 0, 0);
                   transition: all 0.3s ease;">
      <i class="fa fa-list" style="font-size:17px;"></i>
      <span style="opacity: 0.9;">الأقسام</span>
    </button>
  </a>
</div>

<style>
.btn-categories:hover {
  background: linear-gradient(135deg, #0056b3, #003f7f) !important;
  transform: translateY(-2px);
  box-shadow: 0 4px 10px rgba(0,86,179,0.4);
}
</style>

        <button class="navbar-toggler top-top" "type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
		
          <ul class="navbar-nav mr-auto">

            <li class="nav-item">
			
              <a class="nav-link" href="#">
			  
<ul class="list-group in-740">
  <li class="list-group-item">  
             <?php if( osc_users_enabled() || ( !osc_users_enabled() && !osc_reg_user_post() )) { ?>
            <a href="<?php echo osc_item_post_url_in_category() ; ?>" class="btn btn-danger  Publish-top-small" role="button"><?php _e("Publish your ad for free", 'dreamfree');?></a> 
            <?php } ?>    
			
  </li>  
  <?php if( osc_is_static_page() || osc_is_contact_page() ){ ?>
              <?php } ?>
            <?php if( osc_users_enabled() ) { ?>
            <?php if( osc_is_web_user_logged_in() ) { ?>
			
 
    <li class="list-group-item"><a href="<?php echo osc_user_dashboard_url(); ?>"><?php _e('My account', 'dreamfree'); ?></li>
  <li class="list-group-item"><a href="<?php echo osc_user_logout_url(); ?>"><?php _e('Logout', 'dreamfree'); ?></a></li>
  <?php } else { ?>
  <li class="list-group-item"><a id="login_open" href="<?php echo osc_user_login_url(); ?>"><?php _e('Login', 'dreamfree') ; ?></a></li>
  <?php if(osc_user_registration_enabled()) { ?>
  <li class="list-group-item"><a href="<?php echo osc_register_account_url() ; ?>"><?php _e('Register', 'dreamfree'); ?></a></li>
                  <?php }; ?>
            <?php } ?>
            <?php } ?>
			
  <li class="list-group-item"><a href="<?php echo osc_contact_url(); ?>"><?php _e('Contact', 'dreamfree'); ?></a></li>
  			                        <?php
                     while( osc_has_static_pages() ) { ?>
                   <li class="list-group-item page-title-top">
                      <a href="<?php echo osc_static_page_url(); ?>"><?php echo osc_static_page_title(); ?></a>
                    </li>
                   <?php
                   }
                   osc_reset_static_pages();
                   ?>
</ul>			  

        </div>
		          </ul>
		  		  <ul class="nav nav-pills nav-fill">
				  
  <li class="nav-item Publish-top-page">
   	  
             <?php if( osc_users_enabled() || ( !osc_users_enabled() && !osc_reg_user_post() )) { ?>
            <a style="color:#fff;font-weight: 600;font-size: 13px;"href="<?php echo osc_item_post_url_in_category() ; ?>" class="btn btn-danger top-bblc" role="button"><?php _e("Publish your ad for free", 'dreamfree');?></a> 
            <?php } ?>   
  </li>
      <li class="nav-item">
    <a class="nav-link link-filla" href="<?php echo osc_contact_url(); ?>"><?php _e('Contact', 'dreamfree'); ?></a>
  </li>
      <?php if( osc_is_static_page() || osc_is_contact_page() ){ ?>
              <?php } ?>
            <?php if( osc_users_enabled() ) { ?>
            <?php if( osc_is_web_user_logged_in() ) { ?>
  <li class="nav-item">

    <a class="nav-link link-filla" href="<?php echo osc_user_logout_url(); ?>"><?php _e('Logout', 'dreamfree'); ?></a>
  </li>
  <li class="nav-item">
   <a class="nav-link link-filla" href="<?php echo osc_user_dashboard_url(); ?>"><?php _e('My account', 'dreamfree'); ?></a>
  <?php } else { ?>
  </li>
    
    <li class="nav-item">
    <a class="nav-link link-filla" href="<?php echo osc_user_login_url(); ?>"><?php _e('Login', 'dreamfree') ; ?></a>
  </li>
    <li class="nav-item">
    <a class="nav-link link-filla" href="<?php echo osc_register_account_url() ; ?>"><?php _e('Register', 'dreamfree'); ?></a>
  </li>
                    <?php }; ?>
            <?php } ?>



</ul>


      </nav>
	  
	  <!-- inc.search -->
	 <div class="collapse" id="collapseExample">
<?php osc_current_web_theme_path('Modal/inc.search.php'); ?>
</div>
<!-- inc.search -->
<!-- inc.Menu.category -->
<div class="collapse" id="collapseExample1">
<?php osc_current_web_theme_path('Modal/inc.Menu.category.php'); ?>
</div>
<!-- inc.Menu.category -->
	    <!-- header ad  728x60-->
    <div class="ads_header">
    <?php echo osc_get_preference('header-728x90', 'dreamfree'); ?>
    <!-- /header ad 728x60-->
    </div>
	

    <div class="wrapper">


    </div>
<?php osc_show_widgets('header'); ?>
<div class="wrapper wrapper-flash">
    <?php
        $breadcrumb = osc_breadcrumb('&nbsp;/&nbsp;', false, get_breadcrumb_lang());
        if( $breadcrumb !== '') { ?>
        <div class="breadcrumb">
            <?php echo $breadcrumb; ?>
            <div class="clear"></div>
        </div>
    <?php
        }
    ?>

    <?php osc_show_flash_message(); ?>
</div>
<!--  subcategory top  -->
<div class="subcategori-incategoriall">	
<?php $curr_cat =  osc_category_id(); ?>
<?php while (  osc_has_categories() ) { $cat_id  =  osc_category_id($locale =  ""); ?>
<span class="category <?php  echo  osc_category_slug() ; ?>"></span> 
<?php if (  osc_count_subcategories() > 0  ) {  ?>
 <div class="subcategory" id="showSubcat<?php echo  $cat_id; ?>" ><?php if ($curr_cat ==  $cat_id) { ?><script>document.getElementById('showSubcat<?php echo  $cat_id; ?>').style.display = 'none';</script><?php }  ?>
<?php while (  osc_has_subcategories() ) { $subcat_id  =  osc_category_id($locale =  "");  {?><?php }  ?>
<a class="category <?php  echo  osc_category_slug() ; ?>" href="<?php echo  osc_search_category_url() ; ?>" /><div class="subcategori-incategori"><?php echo  osc_category_name() ; ?><span class="badge badge-secondary total-items-search"><?php echo osc_category_total_items() ; ?></span></div></a>
<?php }  ?>
 </div>
<?php }  ?>
<?php }  ?>

<br><div class="clear"></div><div class="faslh120-20"></div></div>
<!--  subcategory top  -->
<div class="wrapper" id="content">
    <?php osc_run_hook('before-main'); ?>
		<?php if( osc_get_preference('link-mobail-230x90', 'dreamfree') != '') { ?>
	<div class="mobail-header-ads">
<center><a title="<?php echo osc_get_preference('meta-mobail-230x90', 'dreamfree'); ?>" target="_blank" href="<?php echo osc_get_preference('link-mobail-230x90', 'dreamfree'); ?>"><img src="<?php echo osc_get_preference('img-mobail-230x90', 'dreamfree'); ?>"></a></center>
</div> 
	
<?php }; ?>
    <div id="main">
        
