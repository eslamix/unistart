<?php

    // meta tag robots
    osc_add_hook('header','dreamfree_follow_construct');

    $address = '';
    if(osc_user_address()!='') {
        if(osc_user_city_area()!='') {
            $address = osc_user_address();
        } else {
            $address = osc_user_address();
        }
    } else {

    }
    $location_array = array();
    if(trim(osc_user_city()." ".osc_user_zip())!='') {
        $location_array[] = trim(osc_user_city()." ".osc_user_zip());
    }
    if(osc_user_region()!='') {
        $location_array[] = osc_user_region();
    }
    if(osc_user_country()!='') {
        $location_array[] = osc_user_country();
    }
    $location = implode(", ", $location_array);
    unset($location_array);

    osc_enqueue_script('jquery-validate');

    dreamfree_add_body_class('user-public-profile');
    osc_add_hook('after-main','sidebar');
    function sidebar(){
        osc_current_web_theme_path('user-public-sidebar.php');
    }

    osc_current_web_theme_path('header.php');
?>
<div id="item-content">
      <div id="description">
        <?php if(function_exists('profile_picture_show')) { ?>
          <div class="pp-img"><?php profile_picture_show(120);?></div>
        <?php } ?>

<ul class="list-group">
          <li class="list-group-item"><i class="fa fa-user" style="font-size: 16px;"></i>&nbsp;&nbsp;<?php _e('Name', 'dreamfree'); ?>&nbsp;:&nbsp;<span class="info-right"><?php echo osc_user_name(); ?></span></li>
          <li class="list-group-item"><i class="fa fa-user-o" style="font-size: 16px;"></i>&nbsp;&nbsp;<?php _e('Last Activity', 'dreamfree'); ?>&nbsp;:&nbsp;<span class="info-right"><?php echo osc_format_date(osc_user_field('dt_access_date')); ?></span></li>
		  <?php if ( osc_user_phone_mobile() != "" ) { ?><li class="list-group-item"><i class="fa fa-mobile" style="font-size: 16px;"></i>&nbsp;&nbsp;<?php _e('Mobile', 'dreamfree'); ?>&nbsp;:&nbsp;<span class="info-right"><?php echo osc_user_phone_mobile() ; ?></span></li><?php } ?>
          <?php if ( osc_user_phone() != "" && osc_user_phone() != osc_user_phone_mobile() ) { ?><li class="list-group-item"><i class="fa fa-phone" style="font-size: 16px;"></i>&nbsp;&nbsp;<?php _e('Phone', 'dreamfree'); ?>&nbsp;:&nbsp;</span><span class="info-right"><?php echo osc_user_phone() ; ?></span></li><?php } ?>                    
          <?php if ($address != '') { ?><li class="list-group-item"><i class="fab fa-whatsapp" style="font-size: 16px;"></i>&nbsp;&nbsp;<?php _e('WhatsApp', 'dreamfree'); ?>&nbsp;:&nbsp;<span class="info-right"><?php echo $address; ?></span></li><?php } ?>
          <?php if ($location != '') { ?><li class="list-group-item"><i class="fa fa-globe" style="font-size: 16px;"></i>&nbsp;&nbsp;<?php _e('Location', 'dreamfree'); ?>&nbsp;:&nbsp;<span class="info-right"><?php echo $location; ?></span></li><?php } ?>
          <?php if (osc_user_website() != '') { ?><li class="list-group-item"><i class="fa fa-link" style="font-size: 16px;"></i>&nbsp;&nbsp;<?php _e('Website', 'dreamfree'); ?>&nbsp;:&nbsp;<span class="info-right"><a href="<?php echo osc_user_website(); ?>" target="_blank" rel="nofollow"><?php echo osc_user_website(); ?></a></span></li><?php } ?>
          
        </ul>
      </div>

    <?php if( osc_user_info() !== '' ) { ?>

    <span class="badge badge-danger title-all"><?php _e('User description', 'dreamfree'); ?></span>
    <?php } ?>
		  <ul class="list-group">
  <li class="list-group-item"><?php echo nl2br(osc_user_info()); ?></li>
</ul>
    
    <?php if( osc_count_items() > 0 ) { ?>
    <div class="similar_ads">
        <span class="badge badge-danger title-all"><?php _e('Latest listings', 'dreamfree'); ?></span>
        <?php osc_current_web_theme_path('loop.php'); ?>
        <div class="paginate"><?php echo osc_pagination_items(); ?></div>
        <div class="clear"></div>
    </div>
    <?php } ?>
</div>
<?php osc_current_web_theme_path('footer.php') ; ?>