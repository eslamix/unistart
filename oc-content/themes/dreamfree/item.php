<?php
// meta tag robots
if(osc_item_is_spam() || osc_premium_is_spam()) {
    osc_add_hook('header','dreamfree_nofollow_construct');
} else {
    osc_add_hook('header','dreamfree_follow_construct');
}

osc_enqueue_script('fancybox');
osc_enqueue_style('fancybox', osc_current_web_theme_url('js/fancybox/jquery.fancybox.css'));
osc_enqueue_script('jquery-validate');

dreamfree_add_body_class('item');
osc_add_hook('after-main','sidebar');
function sidebar(){
    osc_current_web_theme_path('item-sidebar.php');
}

osc_current_web_theme_path('header.php');
?>
<div id="item-content">
<h3 class="item-title" style="font-size: 20px; font-weight: 700; color: #000; margin-bottom: 6px;">
  <?php echo osc_item_title(); ?>
</h3>

<?php if(osc_item_country() != '') { ?>
  <div class="item-country" style="font-size: 12px; color: #555; display: flex; align-items: center;">
    <i class="fa fa-tags" style="margin-right: 6px;"></i>
    <?php echo osc_esc_html(osc_item_country()); ?>
  </div>
<?php } ?>


<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active item-a" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true"><?php _e('Images', 'dreamfree'); ?></a>
  </div>
</nav>

<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
    <div class="container">
      <table class="table">
        <thead>
          <tr>
            <th>
              <div class="container in-img">
                <table class="table">
                  <thead>
                    <tr>
                      <th><i class="fa fa-tags" title="<?php _e("ID", 'dreamfree'); ?>"></i>&nbsp;: <?php echo osc_item_id(); ?>#</th>
                      <th><i class="fa fa-eye" title="<?php _e("Preview", 'dreamfree'); ?>"></i>&nbsp;: <?php echo osc_item_views(); ?>#</th>
                      <th>
                        <div class="published">
                          <?php if(osc_item_mod_date() == '') { ?>
                            <i class="fa fa-clock-o" title="<?php _e('published', 'dreamfree'); ?>"></i>&nbsp;<span title="<?php echo osc_esc_html(osc_format_date(osc_item_pub_date())); ?>"><?php echo dreamfree_smart_date(osc_item_pub_date()); ?></span>
                          <?php } else { ?>
                            <i class="fa fa-recycle" title="<?php _e('Last update', 'dreamfree'); ?>"></i>&nbsp;<span title="<?php echo osc_esc_html(osc_format_date(osc_item_mod_date())); ?>"><?php echo dreamfree_smart_date(osc_item_mod_date()); ?></span>
                          <?php } ?>
                        </div>
                      </th>
                    </tr>
                  </thead>
                </table>
              </div>

              <?php if(osc_images_enabled_at_items()) { 
                if(osc_count_item_resources() > 0) { $i = 0; ?>
                <div class="item-photos">
                  <span>
                    <center>
                      <a href="<?php echo osc_resource_url(); ?>" class="fancyboxo" data-fancybox="gallery" title="<?php _e('Image', 'dreamfree'); ?> <?php echo $i+1;?> / <?php echo osc_count_item_resources();?>">
                        <?php if(function_exists('tis_status_box')) { tis_status_box(osc_item_id()); } ?>
                        <center><img class="item-photos-img" src="<?php echo osc_resource_url(); ?>" alt="<?php echo osc_item_title(); ?>" title="<?php echo osc_item_title(); ?>" /></center>
                      </a>
                    </center>
                  </span>
                </div>
              <?php } } ?>

              <div class="thumbs">
                <?php for($i = 0; osc_has_item_resources(); $i++) { ?>
                  <a href="<?php echo osc_resource_url(); ?>" class="fancyboxo" data-fancybox="gallery" title="<?php _e('Image', 'dreamfree'); ?> <?php echo $i+1;?> / <?php echo osc_count_item_resources();?>">
                    <img class="item-photos-img" src="<?php echo osc_resource_thumbnail_url(); ?>" width="75" alt="<?php echo osc_item_title(); ?>" title="<?php echo osc_item_title(); ?>" />
                  </a>
                <?php } ?>
              </div>

            </th>
          </tr>
        </thead>
      </table>
    </div>
  </div>
</div>

<div id="description">
  <h4 class="title-widget-search"><?php _e('Description', 'dreamfree'); ?></h4>
  <div class="item-Description-in"><?php echo osc_item_description(); ?></div>
  <br />

  <h4 class="title-widget-search"><?php _e('Additional details', 'dreamfree'); ?></h4>
  
  <div id="custom_fields">
    <?php
    $youtube_url = "";
    if(osc_count_item_meta() >= 1) { ?>
      <div class="meta_list">
        <?php while(osc_has_item_meta()) { 
          if(osc_item_meta_value() != '') { ?>
            <div class="container">
              <table class="table table-bordered item-meta-name">
                <tbody>
                  <tr>
                    <th class="item-meta-name-th"><?php echo osc_item_meta_name(); ?>&nbsp;:</th>
                    <th class="item-meta-name-tha" style="background: #f1f1f1;"><?php echo osc_item_meta_value(); ?></th>
                  </tr>
                </tbody>
              </table>
            </div>
            <?php
            // لو الحقل اسمه "فيديو" خزن الرابط
            if(osc_item_meta_name() == "فيديو") {
                $youtube_url = osc_item_meta_value();
            }
            ?>
        <?php } } ?>
      </div>
    <?php } ?>
  </div>

  <!-- 🔹 زر تحميل PDF يظهر فوق الفيديو -->
  <?php
  $pdf_dir = osc_themes_path() . osc_current_web_theme() . '/images/pdf/';
  $pdf_url = osc_current_web_theme_url('images/pdf/');
  $pdf_file = $pdf_dir . osc_item_id() . '.pdf';

  if (file_exists($pdf_file)) {
      echo '<div class="item-pdf" style="margin:15px 0; text-align:center;">';
      echo '<a href="' . $pdf_url . osc_item_id() . '.pdf" target="_blank" download class="btn btn-sm btn-primary" style="background-color:#007bff; color:white; padding:6px 14px; border-radius:4px; text-decoration:none;">';
      echo '<i class="fa fa-file-pdf-o"></i> ' . __('تحميل PDF', 'dreamfree') . '</a>';
      echo '</div>';
  }
  ?>

  <!-- 🎥 عرض فيديو يوتيوب تحت زر التحميل -->
  <?php
  if($youtube_url != "") {
      preg_match("/(?:youtube\.com\/(?:watch\?v=|embed\/)|youtu\.be\/)([^\&\?\/]+)/", $youtube_url, $matches);
      if(isset($matches[1])) {
          $youtube_id = $matches[1];
          echo '<div class="youtube-video" style="margin:20px 0; text-align:center;">
                  <iframe width="560" height="315" src="https://www.youtube.com/embed/'.$youtube_id.'" frameborder="0" allowfullscreen></iframe>
                </div>';
      }
  }
  ?>

  <?php osc_run_hook('item_detail', osc_item()); ?>

  <p class="contact_button">
    <?php if(!osc_item_is_expired()) {
      if(!( (osc_logged_user_id() == osc_item_user_id()) && osc_logged_user_id() != 0)) {
        if(osc_reg_user_can_contact() && osc_is_web_user_logged_in() || !osc_reg_user_can_contact()) {
        }
      }
    } ?>
  </p>
</div>

<?php related_listings(); ?>
<?php if(osc_count_items() > 0) { ?>
  <div class="similar_ads">
    <h4 class="title-widget-search"><?php _e('Related listings', 'dreamfree'); ?></h4>
    <?php
      View::newInstance()->_exportVariableToView("listType", 'items');
      View::newInstance()->_exportVariableToView("listClass", 'listing-grid');
      osc_current_web_theme_path('loop.php');
    ?>
    <div class="clear"></div>
  </div>
<?php } ?>

</div>
<?php osc_current_web_theme_path('footer.php'); ?>
