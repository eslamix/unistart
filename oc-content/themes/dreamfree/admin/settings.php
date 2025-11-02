<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
<script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
<script src="<?php echo osc_current_web_theme_url('admin/js/admin.js');?>"></script>
<link type="text/css" rel="stylesheet" href="<?php echo osc_current_web_theme_url('admin/css/style.css');?>">
<link type="text/css" rel="stylesheet" href="<?php echo osc_current_web_theme_url('css/font-awesome-4.1.0/css/font-awesome.css');?>">
<?php if ( (!defined('ABS_PATH')) ) exit('ABS_PATH is not loaded. Direct access is not allowed.'); ?>
<?php if ( !OC_ADMIN ) exit('User access is not allowed.'); ?>
<?php if( (!defined('MULTISITE') || MULTISITE==0)&& !osc_get_preference('footer_link', 'dreamfree') && !osc_get_preference('donation', 'dreamfree') ) { ?>
<?php } ?>
  <div class="head">
      <?php include 'head.php'; ?>
  </div>




<h2 class="render-title <?php echo (osc_get_preference('footer_link', 'dreamfree') ? '' : 'separate-top'); ?>"><?php _e('Theme settings', 'dreamfree'); ?></h2>
<form action="<?php echo osc_admin_render_theme_url('oc-content/themes/dreamfree/admin/settings.php'); ?>" method="post" class="nocsrf">
<input type="hidden" name="action_specific" value="settings" />
   
<div class="form-horizontal">
<div class="form-row">
<div class="form-label"><?php _e('site name', 'dreamfree'); ?></div>
<div class="form-controls"><input type="text" class="xlarge" name="name-site" value="<?php echo osc_esc_html( osc_get_preference('name-site', 'dreamfree') ); ?>"></div>
</div>

<div class="form-row">
<div class="form-label"><?php _e('Site Link', 'dreamfree'); ?></div>
<div class="form-controls"><input type="text" class="xlarge" name="link-site" value="<?php echo osc_esc_html( osc_get_preference('link-site', 'dreamfree') ); ?>"></div>
</div>
<div class="form-row">
<div class="form-label"><?php _e('facebook', 'dreamfree'); ?></div>
<div class="form-controls"><input type="text" class="xlarge" name="facebook" value="<?php echo osc_esc_html( osc_get_preference('facebook', 'dreamfree') ); ?>"></div>
</div>
<div class="form-row">
<div class="form-label"><?php _e('pinterest', 'dreamfree'); ?></div>
<div class="form-controls"><input type="text" class="xlarge" name="pinterest" value="<?php echo osc_esc_html( osc_get_preference('pinterest', 'dreamfree') ); ?>"></div>
</div>
<div class="form-row">
<div class="form-label"><?php _e('twitter', 'dreamfree'); ?></div>
<div class="form-controls"><input type="text" class="xlarge" name="twitter" value="<?php echo osc_esc_html( osc_get_preference('twitter', 'dreamfree') ); ?>"></div>
</div>
<div class="form-row">
<div class="form-label"><?php _e('linkedin', 'dreamfree'); ?></div>
<div class="form-controls"><input type="text" class="xlarge" name="linkedin" value="<?php echo osc_esc_html( osc_get_preference('linkedin', 'dreamfree') ); ?>"></div>
</div>


<div class="form-row">
<div class="form-label"><?php _e('Show lists as:', 'dreamfree'); ?></div>
<div class="form-controls">
<select name="defaultShowAs@all">
<option value="gallery" <?php if(dreamfree_default_show_as() == 'gallery'){ echo 'selected="selected"' ; } ?>><?php _e('Gallery','dreamfree'); ?></option>
<option value="list" <?php if(dreamfree_default_show_as() == 'list'){ echo 'selected="selected"' ; } ?>><?php _e('List','dreamfree'); ?></option>
</select>
</div>
</div>

       
   

<h2 class="render-title"><?php _e('Location input', 'dreamfree'); ?></h2>  
<div class="form-horizontal">
<div class="form-row">
<div class="form-label"><?php _e('Show location input as:', 'dreamfree'); ?></div>
<div class="form-controls">
<select name="defaultLocationShowAs">
<option value="dropdown" <?php if(dreamfree_default_location_show_as() == 'dropdown'){ echo 'selected="selected"' ; } ?>><?php _e('Dropdown','dreamfree'); ?></option>
<option value="autocomplete" <?php if(dreamfree_default_location_show_as() == 'autocomplete'){ echo 'selected="selected"' ; } ?>><?php _e('Autocomplete','dreamfree'); ?></option>
</select>
</div>
</div>
</div>                                
<fieldset style="    background: #f1f2f3;">	
<?php if(!defined('MULTISITE') || MULTISITE==0) { ?>
<div class="form-row">
<div class="form-label"><strong><?php _e('Activate featured ads', 'dreamfree'); ?></strong></div>
<div class="form-controls">
<div class="form-label-checkbox">
<input type="checkbox" id="footer_link" name="footer_link" value="1" <?php echo (osc_get_preference('footer_link', 'dreamfree') ? 'checked' : ''); ?> >
<label for="footer_link"></label>
 <?php _e('You can enable or disable featured ad impressions', 'dreamfree'); ?> 
 </div>
</div>
</div>
<?php } ?>
</fieldset>
<fieldset style="    background: #dfe2e6;">	
<?php if(!defined('MULTISITE') || MULTISITE==0) { ?>
<div class="form-row">
<div class="form-label"><strong><?php _e('Activate partition icons', 'dreamfree'); ?></strong></div>
<div class="form-controls">
<div class="form-label-checkbox">
<input type="checkbox" id="catsmall" name="catsmall" value="1" <?php echo (osc_get_preference('catsmall', 'dreamfree') ? 'checked' : ''); ?> >
<label for="catsmall"></label> 
<?php _e('You can enable or disable section icons to appear in the site interface', 'dreamfree'); ?>

</div>
</div>
</div>
<?php } ?>

</fieldset>

<fieldset style="    background: #f1f2f3;">	

<?php if(!defined('MULTISITE') || MULTISITE==0) { ?>
<div class="form-row">

<div class="form-label"><strong><?php _e('Activate website stats', 'dreamfree'); ?></strong></div>
<div class="form-controls">
<div class="form-label-checkbox">
<input type="checkbox" id="statsmain" name="statsmain" value="1" <?php echo (osc_get_preference('statsmain', 'dreamfree') ? 'checked' : ''); ?> >
<label for="statsmain"></label> 
 <?php _e('You can enable or disable stats to appear in the site interface', 'dreamfree'); ?>
 </div>
</div>
</div>
<?php } ?>

</fieldset>			


            <div class="form-actions">
                <input type="submit" value="<?php _e('Save changes', 'dreamfree'); ?>" class="btn btn-submit">
            </div>

<h2 class="render-title"><?php _e('Ads management', 'dreamfree'); ?></h2>
    <div class="form-row">
        <div class="form-label"></div>
        <div class="form-controls">
            <p><?php _e('In this section you can configure your site to display ads and start generating revenue.', 'dreamfree'); ?><br/><?php _e('If you are using an online advertising platform, such as Google Adsense, copy and paste here the provided code for ads.', 'dreamfree'); ?></p>
        </div>
    </div>


			        <div class="form-controls">
            <p><?php _e('In this section you can configure your site to display ads and start generating revenue.', 'dreamfree'); ?><br/><?php _e('If you are using an online advertising platform, such as Google Adsense, copy and paste here the provided code for ads.', 'dreamfree'); ?></p>
        </div>

        <div class="form-horizontal">
		<br>
		<h2 class="render-title"><?php _e('Ads management', 'dreamfree'); ?></h2>
		
		<div class="form-row">
<div class="form-label"><?php _e('code adsense', 'dreamfree'); ?></div>
<div class="form-controls"><input type="text" class="xlarge" name="coode_adsense" value="<?php echo osc_esc_html( osc_get_preference('coode_adsense', 'dreamfree') ); ?>" placeholder="pub-xxxxxxxxx"></div>
</div>
<br>
            <div class="form-row">
                <div class="form-label"><?php _e('Header 728x90', 'dreamfree'); ?></div>
                <div class="form-controls">
                    <textarea style="height: 115px; width: 500px;"name="header-728x90"><?php echo osc_esc_html( osc_get_preference('header-728x90', 'dreamfree') ); ?></textarea>
                    <br/><br/>
                    <div class="help-box"><?php _e('This ad will be shown at the top of your website, next to the site title and above the search results. Note that the size of the ad has to be 728x90 pixels.', 'dreamfree'); ?></div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label"><?php _e('Homepage 728x90', 'dreamfree'); ?></div>
                <div class="form-controls">
                    <textarea style="height: 115px; width: 500px;" name="homepage-728x90"><?php echo osc_esc_html( osc_get_preference('homepage-728x90', 'dreamfree') ); ?></textarea>
                    <br/><br/>
                    <div class="help-box"><?php _e('This ad will be shown on the main site of your website. It will appear both at the top and bottom of your site homepage. Note that the size of the ad has to be 728x90 pixels.', 'dreamfree'); ?></div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label"><?php _e('Search results 728x90 (top of the page)', 'dreamfree'); ?></div>
                <div class="form-controls">
                    <textarea style="height: 115px; width: 500px;" name="search-results-top-728x90"><?php echo osc_esc_html( osc_get_preference('search-results-top-728x90', 'dreamfree') ); ?></textarea>
                    <br/><br/>
                    <div class="help-box"><?php _e('This ad will be shown on top of the search results of your site. Note that the size of the ad has to be 728x90 pixels.', 'dreamfree'); ?></div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label"><?php _e('Search results 728x90 (middle of the page)', 'dreamfree'); ?></div>
                <div class="form-controls">
                    <textarea style="height: 115px; width: 500px;" name="search-results-middle-728x90"><?php echo osc_esc_html( osc_get_preference('search-results-middle-728x90', 'dreamfree') ); ?></textarea>
                    <br/><br/>
                    <div class="help-box"><?php _e('This ad will be shown among the search results of your site. Note that the size of the ad has to be 728x90 pixels.', 'dreamfree'); ?></div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-label"><?php _e('Sidebar 300x250', 'dreamfree'); ?></div>
                <div class="form-controls">
                    <textarea style="height: 115px; width: 500px;" name="sidebar-300x250"><?php echo osc_esc_html( osc_get_preference('sidebar-300x250', 'dreamfree') ); ?></textarea>
                    <br/><br/>
                    <div class="help-box"><?php _e('This ad will be shown at the right sidebar of your website, on the product detail page. Note that the size of the ad has to be 300x350 pixels.', 'dreamfree'); ?></div>
                </div>
            </div>
            <div class="form-actions">
			
                <input type="submit" value="<?php _e('Save changes', 'dreamfree'); ?>" class="btn btn-submit">
            </div>

</form>