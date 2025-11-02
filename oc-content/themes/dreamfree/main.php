<?php
// meta tag robots
    osc_add_hook('header','dreamfree_follow_construct');

    dreamfree_add_body_class('home');


    $buttonClass = '';
    $listClass   = '';
    if(dreamfree_show_as() == 'gallery'){
          $listClass = 'listing-grid';
          $buttonClass = 'active';
    }
?>
<?php osc_current_web_theme_path('header.php') ; ?>
<div class="clear"></div>

	<!-- start category-top	
<?php if( (!defined('MULTISITE') || MULTISITE==0) && osc_get_preference('catsmall', 'dreamfree') !== '0') {?>
<div class="category-top-icon"><?php osc_run_hook('inside-main'); ?> </div>
<?php } ?>
<!-- start category-top -->	
<!-- <br> -->
<div class="clear"><?php if (function_exists('carousel')) {carousel();} ?></div>
<!-- <br> --> 
<div class="latest_ads">


<!-- start main-Premium -->
<?php if( (!defined('MULTISITE') || MULTISITE==0) && osc_get_preference('footer_link', 'dreamfree') !== '0') {?>
<?php osc_current_web_theme_path('Modal/inc.main-Premium.php') ; ?>
<?php } ?>
<!-- start main-Premium -->
<div style="font-size: 20px;  color: #595858bd; letter-spacing: 0.5px; margin-bottom: 0px; font-family: 'Arial', sans-serif; max-width: 100%;">
    <?php _e('Latest listings', 'dreamfree'); ?>
</div>

<style>
@media only screen and (max-width: 740px){
    div[style*="Latest listings"] {
        font-size: 18px;
    }
}
</style>
 <?php if( osc_count_latest_items() == 0) { ?>
    <div class="clear"></div>
    <p class="empty"><?php _e("There aren't listings available at this moment", 'dreamfree'); ?></p>
<?php } else { ?>
    <div class="actions">

    </div>
    <?php
    View::newInstance()->_exportVariableToView("listType", 'latestItems');
    View::newInstance()->_exportVariableToView("listClass",$listClass);
    osc_current_web_theme_path('loop.php');
    ?>
    <div class="clear"></div>
    <?php if( osc_count_latest_items() == osc_max_latest_items() ) { ?>
        <p class="see_more_link"><a href="<?php echo osc_search_show_all_url() ; ?>">
            <strong><?php _e('See all listings', 'dreamfree') ; ?> &raquo;</strong></a>
        </p>
    <?php } ?>
<?php } ?>
</div>
</div><!-- main -->
<?php if( (!defined('MULTISITE') || MULTISITE==0) && osc_get_preference('statsmain', 'dreamfree') !== '0') {?>
<br>
  <table class="stats-main">
    <thead>
      <tr>
        <th class="stats-main-dow"><img src="oc-content/themes/dreamfree/images/stats/users.png" width="50" height="50"></th>
        <th class="stats-main-dow"><img src="oc-content/themes/dreamfree/images/stats/glob.png" width="50" height="50"></th>
		<th class="stats-main-dow"><img src="oc-content/themes/dreamfree/images/stats/catg.png" width="50" height="50"></th>
        <th class="stats-main-dow"><img src="oc-content/themes/dreamfree/images/stats/totle-item.png" width="50" height="50"></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><?php _e("Registered users", 'dreamfree') ; ?><span class="badge nmbertext"><?php echo osc_total_users () ; ?></span></td>
<td><?php _e("Number of countries", 'dreamfree') ; ?><span class="badge nmbertext">19.6 الف</span></td>
		<td><?php _e("Total ratings", 'dreamfree') ; ?><span class="badge nmbertext"><?php echo osc_count_categories () ; ?></span></td>
		<td><?php _e("Total item", 'dreamfree') ; ?><span class="badge nmbertext"><?php echo osc_total_items () ; ?></span></td>
      </tr>
    </tbody>
  </table>
  <?php } ?>
<div class="clear"><!-- do not close, use main clossing tag for this case -->
<?php if( osc_get_preference('homepage-728x90', 'dreamfree') != '') { ?>
<!-- homepage ad 728x60-->
<center>
    <?php echo osc_get_preference('homepage-728x90', 'dreamfree'); ?>
</center>
<!-- /homepage ad 728x60-->
<?php } ?>
<?php osc_current_web_theme_path('footer.php') ; ?>
<style>
.top-inc-cat{display: none;}

@media only screen and (max-width: 740px){
.top-inc-cat{display: inline-block;}	
}
.title-Latest-Listings{
		    height: 35px;
    line-height: 28px;
    margin-right: 5px;
	    /* background: #333; */
		margin-top:0px;
	font-size: 15px;
	    margin-bottom: 3px;
}
</style> 