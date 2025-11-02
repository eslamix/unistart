<?php
// التأكد إن $category مصفوفة قبل الوصول للمفتاح
$category = __get("category");
if(!is_array($category)) {
    $category = array();
}
if(!isset($category['pk_i_id'])) {
    $category['pk_i_id'] = null;
}
?>

<div id="sidebar">

  <div class="collapse" id="collapseExamplea">
    <div class="card card-body">
      <?php osc_alert_form(); ?>
    </div>
  </div>

  <div class="fil0ters">
    <form action="<?php echo osc_base_url(true); ?>" method="get" class="nocsrf">
        <input type="hidden" name="page" value="search"/>
        <input type="hidden" name="sOrder" value="<?php echo osc_search_order(); ?>" />
        <input type="hidden" name="iOrderType" value="<?php $allowedTypesForSorting = Search::getAllowedTypesForSorting(); echo $allowedTypesForSorting[osc_search_order_type()]; ?>" />
        
        <?php foreach(osc_search_user() as $userId) { ?>
            <input type="hidden" name="sUser[]" value="<?php echo $userId; ?>"/>
        <?php } ?>

        <label class="control-label" for="message"><?php _e('Advanced Search', 'dreamfree'); ?></label>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <i class="fa fa-search"></i>
                    <input class="form-control" type="text" name="sPattern" id="query" value="<?php echo osc_esc_html(osc_search_pattern()); ?>" />
                </span>
            </div>
        </div>

        <label class="control-label" for="Category"><?php _e('Category', 'dreamfree'); ?></label>
        <div class="input-group mb-3">
            <div class="input-group-prepend user-input-profile">
                <span class="input-group-text" id="basic-addon">
                    <i class="fa fa-th-large"></i>

                   <?php

$categories = Category::newInstance()->toTree();

echo '<select name="sCategory" id="sCategory" class="form-control">';
echo '<option value="">' . __('Select a category', 'dreamfree') . '</option>';

foreach ($categories as $c) {
    $hasSubcategories = isset($c['categories']) && count($c['categories']) > 0;

    $style = 'style="color:#007bff;font-weight:bold;background:#f9f9f9;"';

    echo '<option value="' . $c['pk_i_id'] . '" ' . $style . '>';
    echo osc_esc_html($c['s_name']);
    echo '</option>';

    // الأقسام الفرعية (بشكل عادي)
    if ($hasSubcategories) {
        foreach ($c['categories'] as $sub) {
            echo '<option value="' . $sub['pk_i_id'] . '">&nbsp;&nbsp;— ' . osc_esc_html($sub['s_name']) . '</option>';
        }
    }
}

echo '</select>';
?>

                </span>
            </div>
        </div>

        <label class="control-label" for="country"><?php _e('Country', 'dreamfree'); ?></label>
        <div class="input-group mb-3">
            <div class="input-group-prepend user-input-profile">
                <span class="input-group-text" id="basic-addon1">
                    <i class="fa fa-globe"></i>
                    <?php UserForm::country_select(osc_get_countries(), osc_user()); ?>
                </span>
            </div>
        </div>

        <?php if(osc_images_enabled_at_items()) { ?>
            <label class="control-label" for="message"><?php _e('Show only', 'dreamfree'); ?></label>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text more-img" id="basic-addon1">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" name="bPic" id="withPicture" value="1" <?php echo (osc_search_has_pic() ? 'checked' : ''); ?> />
                            <label for="withPicture"><?php _e('listings with pictures', 'dreamfree'); ?></label>
                        </div>
                    </span>
                </div>
            </div>
        <?php } ?>

        <?php if(osc_price_enabled_at_items()) { ?>
            <label class="control-label" for="message"><?php _e('Price', 'dreamfree'); ?></label>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">
                        <i class="fa fa-long-arrow-down"></i>
                        <input class="form-control" type="text" id="priceMin" name="sPriceMin" value="<?php echo osc_esc_html(osc_search_price_min()); ?>" size="12" maxlength="12" />
                    </span>
                </div>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">
                        <i class="fa fa-long-arrow-up"></i>
                        <input class="form-control" type="text" id="priceMax" name="sPriceMax" value="<?php echo osc_esc_html(osc_search_price_max()); ?>" size="12" maxlength="12" />
                    </span>
                </div>
            </div>
        <?php } ?>

        <div class="plugin-hooks">
            <?php
            if(osc_search_category_id()) {
                osc_run_hook('search_form', osc_search_category_id());
            } else {
                osc_run_hook('search_form');
            }
            ?>
        </div>

        <?php
        $aCategories = osc_search_category();
        foreach($aCategories as $cat_id) { ?>
            <input type="hidden" name="sCategory[]" value="<?php echo osc_esc_html($cat_id); ?>"/>
        <?php } ?>

        <div class="actions">
            <button class="btn btn-danger" type="submit"><?php _e('Apply', 'dreamfree'); ?></button>
        </div>
    </form>
  </div>
</div>
