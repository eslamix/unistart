 
 <div class="faslh12"></div>
  <!--From here Premium Listings code begins osclass-ar.com-->
  <div class="title-main-card-premiums"> <span class="badge badge-danger title-main-card-premiums"><?php _e('Premium listings', 'dreamfree') ; ?></span></div> 
<?php if( osc_count_premiums() == 0) { ?>
    <div class="clear"></div>
    <p class="empty"><?php _e("No Premium listings available at this moment", 'dreamfree'); ?></p>
<?php } else { ?>  
<?php
            $i = 0;
            osc_get_premiums(100);
            if(osc_count_premiums() > 0) {
            View::newInstance()->_exportVariableToView("listType", 'premiums');
           View::newInstance()->_exportVariableToView("listClass", 'listing-grid');
            osc_current_web_theme_path('loop.php');
            echo '<div style="clear:both;"></div><br/>';
            }
        ?>
		<?php } ?>
<!--From here Premium Listings code begins osclass-ar.com -->
