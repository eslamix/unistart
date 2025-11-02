<?php
// meta tag robots
    if( osc_count_items() == 0 || stripos($_SERVER['REQUEST_URI'], 'search') ) {
        osc_add_hook('header','dreamfree_nofollow_construct');
    } else {
        osc_add_hook('header','dreamfree_follow_construct');
    }

    dreamfree_add_body_class('search');
    $listClass = '';
    $buttonClass = '';
    if(osc_search_show_as() == 'gallery'){
          $listClass = 'listing-grid';
          $buttonClass = 'active';
    }
    osc_add_hook('before-main','sidebar');
    function sidebar(){
        osc_current_web_theme_path('search-sidebar.php');
    }
    osc_add_hook('footer','autocompleteCity');
    function autocompleteCity(){ ?>
    <script type="text/javascript">
    $(function() {
                    function log( message ) {
                        $( "<div/>" ).text( message ).prependTo( "#log" );
                        $( "#log" ).attr( "scrollTop", 0 );
                    }

                    $( "#sCity" ).autocomplete({
                        source: "<?php echo osc_base_url(true); ?>?page=ajax&action=location",
                        minLength: 2,
                        select: function( event, ui ) {
                            $("#sRegion").attr("value", ui.item.region);
                            log( ui.item ?
                                "<?php echo osc_esc_html( __('Selected', 'dreamfree') ); ?>: " + ui.item.value + " aka " + ui.item.id :
                                "<?php echo osc_esc_html( __('Nothing selected, input was', 'dreamfree') ); ?> " + this.value );
                        }
                    });
                });
    </script>
    <?php
    }
?>
<?php osc_current_web_theme_path('header.php') ; ?>
<a href="<?php echo  osc_search_category_url() ; ?>"><h4 class="title-widget-search"><?php echo search_title(); ?></h4></a> 	 



     <div class="list-header">
        <div class="resp-wrapper">
            <?php osc_run_hook('search_ads_listing_top'); ?>

            <?php if(osc_count_items() == 0) { ?>
                <p class="empty" ><?php printf(__('There are no results matching "%s"', 'dreamfree'), osc_search_pattern()) ; ?></p>
            <?php } else { ?>
            <span class="counter-search"><?php
                $search_number = dreamfree_search_number();
                printf(__('%1$d - %2$d of %3$d listings', 'dreamfree'), $search_number['from'], $search_number['to'], $search_number['of']);
            ?></span>
            <div class="actions">
              <span class="doublebutton <?php echo $buttonClass; ?>">
                   <a href="<?php echo osc_esc_html(osc_update_search_url(array('sShowAs'=> 'list'))); ?>" class="list-button" data-class-toggle="listing-grid" data-destination="#listing-card-list"><span><?php _e('List','dreamfree'); ?></span></a>
                   <a href="<?php echo osc_esc_html(osc_update_search_url(array('sShowAs'=> 'gallery'))); ?>" class="grid-button" data-class-toggle="listing-grid" data-destination="#listing-card-list"><span><?php _e('Grid','dreamfree'); ?></span></a>
              </span>
            <!--     START sort by       -->
            <span class="see_by">
              <span><?php _e('Sort by', 'dreamfree'); ?>:</span>
              <?php
              $orders = osc_list_orders();
              $current = '';
              foreach($orders as $label => $params) {
                  $orderType = ($params['iOrderType'] == 'asc') ? '0' : '1';
                  if(osc_search_order() == $params['sOrder'] && osc_search_order_type() == $orderType) {
                      $current = $label;
                  }
              }
              ?>
              <label><?php echo $current; ?><b class="arrow-envelope"><b class="arrow-down"></b></b></label>
              <?php $i = 0; ?>
              <ul>
                  <?php
                  foreach($orders as $label => $params) {
                      $orderType = ($params['iOrderType'] == 'asc') ? '0' : '1'; ?>
                      <?php if(osc_search_order() == $params['sOrder'] && osc_search_order_type() == $orderType) { ?>
                          <li><a class="current" href="<?php echo osc_esc_html(osc_update_search_url($params)); ?>"><?php echo $label; ?></a></li>
                      <?php } else { ?>
                          <li><a href="<?php echo osc_esc_html(osc_update_search_url($params)); ?>"><?php echo $label; ?></a></li>
                      <?php } ?>
                      <?php $i++; ?>
                  <?php } ?>
                </ul>
            </span>
            <!--     END sort by       -->
            </div>

            <?php } ?>
          </div>
     </div>
        <?php
            $i = 0;
            osc_get_premiums(5);
            if(osc_count_premiums() > 0) {
            echo '<h4 class="title-widget-search">'.__('Premium listings','dreamfree').'</h4>';
            View::newInstance()->_exportVariableToView("listType", 'premiums');
            View::newInstance()->_exportVariableToView("listClass",$listClass.' premium-list');
            osc_current_web_theme_path('loop.php');
            echo '<div style="clear:both;"></div><br/>';
            }
        ?>
     <?php if(osc_count_items() > 0) {
        echo '<h4 class="title-widget-search">'.__('Listings','dreamfree').'</h4>';
        View::newInstance()->_exportVariableToView("listType", 'items');
        View::newInstance()->_exportVariableToView("listClass",$listClass);
        osc_current_web_theme_path('loop.php');
    ?>

     <div class="clear"></div>
      <?php
      if(osc_rewrite_enabled()){
      $footerLinks = osc_search_footer_links();
      if(count($footerLinks)>0) {
      ?>
      <div id="related-searches">
        <h5><?php _e('Other searches that may interest you','dreamfree'); ?></h5>
        <ul class="footer-links">
          <?php foreach($footerLinks as $f) { View::newInstance()->_exportVariableToView('footer_link', $f); ?>
          <?php if($f['total'] < 3) continue; ?>
            <li><a href="<?php echo osc_footer_link_url(); ?>"><?php echo osc_footer_link_title(); ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php }
      } ?>
     <div class="paginate" >
          <?php echo osc_search_pagination(); ?>
     </div>
     <?php } ?>
<?php osc_current_web_theme_path('footer.php') ; ?> 
<div class="wrapper" id="content">
<!--  subcategory top  -->
<style>.subcategori-incategoriall{display: block;}
@media only screen and (max-width: 740px){.subcategori-incategoriall{    display: none;}}
</style> 
<script type="text/javascript">
 $(document).ready(function() {
 $('.subcategory').toggle();
 $('.expand').live('click',function(){
 });
 });
 </script>

<!--  subcategory top  -->