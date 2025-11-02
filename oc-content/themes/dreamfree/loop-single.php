<?php $size = explode('x', osc_thumbnail_dimensions()); ?>
<li class="item-card-modern <?php if(osc_item_is_premium()) echo 'premium'; ?>">

  <!-- صورة المشروع -->
  <div class="item-thumb">
    <a href="<?php echo osc_item_url(); ?>" title="<?php echo osc_esc_html(osc_item_title()); ?>">
      <?php if(osc_count_item_resources()) { ?>
        <img src="<?php echo osc_resource_thumbnail_url(); ?>" alt="<?php echo osc_esc_html(osc_item_title()); ?>">
      <?php } else { ?>
        <img src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" alt="<?php echo osc_esc_html(osc_item_title()); ?>">
      <?php } ?>
    </a>
    <?php if(osc_item_is_premium()) { ?>
      <span class="badge-premium"><i class="fa fa-star"></i> مشروع مميز</span>
    <?php } ?>
  </div>

  <!-- تفاصيل المشروع -->
  <div class="item-body">
    <!-- العنوان (اسم المشروع) -->
    <h3 class="item-title">
      <a href="<?php echo osc_item_url(); ?>"><?php echo osc_esc_html(osc_item_title()); ?></a>
    </h3>

    <!-- الوصف -->
    <p class="item-desc">
      <?php echo osc_highlight( osc_item_description(), 150 ); ?>
    </p>

    <!-- التصنيف -->
    <div class="item-category">
      <i class="fa fa-university"></i>
      <?php echo osc_esc_html( osc_item_category() ); ?>
    </div>

    <!-- نوع المشروع -->
    <div class="item-location">
  <i class="fa fa-tags"></i>
  <?php echo osc_esc_html(osc_item_country()); ?>
</div>

    <div class="item-footer">
      <span class="time">
        <i class="fa fa-clock-o"></i>
        <?php echo dreamfree_smart_date( osc_item_mod_date() ?: osc_item_pub_date() ); ?>
      </span>
      <a href="<?php echo osc_item_url(); ?>" class="btn-view">عرض المشروع</a>
    </div>
  </div>
</li>

<style>
/* تصميم الكارت */
.item-card-modern {
  display: flex;
  flex-direction: column;
  background: #fff;
  border-radius: 14px;
  box-shadow: 0 4px 18px rgba(20,20,20,0.06);
  overflow: hidden;
  transition: transform 0.25s ease, box-shadow 0.25s ease;
  list-style: none;
  margin: 16px;
  width: 100%;
  max-width: 270px;
}
.item-card-modern:hover {
  transform: translateY(-6px);
  box-shadow: 0 12px 30px rgba(20,20,20,0.12);
}

.item-thumb { position: relative; width: 100%; overflow: hidden; aspect-ratio: 4/3; }
.item-thumb img { width: 100%; height: 100%; object-fit: cover; transition: transform .45s ease; }
.item-card-modern:hover .item-thumb img { transform: scale(1.06); }
.badge-premium { position: absolute; top: 10px; left: 10px; background: linear-gradient(45deg,#FFD700,#FFC107); color: #222; font-weight: 700; font-size: 13px; padding: 6px 10px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.12); }

.item-body { padding: 14px 16px; display: flex; flex-direction: column; justify-content: flex-start; min-height: 200px; }

.item-title { margin: 0 0 8px 0; font-size: 17px; font-weight: 700; }
.item-title a { color: #111; text-decoration: none; }
.item-title a:hover { color: #007bff; }

.item-desc { color: #6b6b6b; font-size: 14px; line-height: 1.45; margin: 0 0 12px 0;
  display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis;
}

.item-category {
  font-size: 14px;
  color: #444;
  font-weight: 600;
  margin-bottom: 6px;
}
.item-category i { color: #007bff; margin-left: 6px; }

/* نوع المشروع */
.item-location {
  font-size: 13.5px;
  color: #555;
  margin-bottom: 12px;
}
.item-location i {
  color: #007bff;
  margin-left: 6px;
}

.item-footer { margin-top: auto; display: flex; justify-content: space-between; align-items: center; border-top: 1px solid #f0f0f0; padding-top: 10px; }
.time { font-size: 13px; color: #9a9a9a; }
.btn-view { background: #007bff; color: #fff; font-size: 13px; font-weight: 700; padding: 7px 12px; border-radius: 8px; text-decoration: none; transition: all 0.25s ease; display: inline-block; }
.btn-view:hover { background: #0056b3; color: #fff !important; box-shadow: 0 4px 10px rgba(0, 86, 179, 0.4); transform: translateY(-1px); }
</style>
