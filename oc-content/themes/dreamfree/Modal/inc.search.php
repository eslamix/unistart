<div class="uptp">
<div class="fil0ters">
    <form action="<?php echo osc_base_url(true); ?>" method="get" class="nocsrf">
        <input type="hidden" name="page" value="search"/>
        <input type="hidden" name="sOrder" value="<?php echo osc_search_order(); ?>" />
        <input type="hidden" name="iOrderType" value="<?php $allowedTypesForSorting = Search::getAllowedTypesForSorting() ; echo $allowedTypesForSorting[osc_search_order_type()]; ?>" />
        <?php foreach(osc_search_user() as $userId) { ?>
        <input type="hidden" name="sUser[]" value="<?php echo $userId; ?>"/>
        <?php } ?>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-search"></i><input class="input-for-query" type="text" name="sPattern"  id="query" value="<?php echo osc_esc_html(osc_search_pattern()); ?>" /></span>
</span></div></div>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profile">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-th-large"></i><?php osc_categories_select('sCategory', null, __('Category', 'dreamfree')) ; ?>
</span></div></div>
<div class="input-group mb-3">
<div class="input-group-prepend user-input-profile">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-globe"></i><?php UserForm::country_select(osc_get_countries(), osc_user()); ?>
</span></div></div>

        <div class="plugin-hooks">
            <?php
            if(osc_search_category_id()) {
                osc_run_hook('search_form', osc_search_category_id()) ;
            } else {
                osc_run_hook('search_form') ;
            }
            ?>
        </div>
        <?php
        $aCategories = osc_search_category();
        foreach($aCategories as $cat_id) { ?>
            <input type="hidden" name="sCategory[]" value="<?php echo osc_esc_html($cat_id); ?>"/>
        <?php } ?>
        <div class="actions">
            <button class="btn btn-danger inc-search"type="submit"><?php _e('Apply', 'dreamfree') ; ?></button>
        </div>
    </form>
  </div>
</div>