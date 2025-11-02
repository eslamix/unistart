<?php
// meta tag robots
osc_add_hook('header','dreamfree_nofollow_construct');

osc_enqueue_script('jquery-validate');
dreamfree_add_body_class('item item-post');
$action = 'item_add_post';
$edit = false;
if(Params::getParam('action') == 'item_edit') {
    $action = 'item_edit_post';
    $edit = true;
}
?>
<?php osc_current_web_theme_path('header.php'); ?>

<div class="form-container form-horizontal">
    <div class="resp-wrapper">
        <div class="header">
            <h4 class="title-widget-search"><?php _e('Publish a listing', 'dreamfree'); ?></h4>
        </div>

        <div class="form-additem">
            <form name="item" action="<?php echo osc_base_url(true); ?>" method="post" enctype="multipart/form-data" id="item-post">
                <ul id="error_list"></ul>
                <fieldset>
                    <input type="hidden" name="action" value="<?php echo $action; ?>" />
                    <input type="hidden" name="page" value="item" />
                    <?php if($edit){ ?>
                        <input type="hidden" name="id" value="<?php echo osc_item_id();?>" />
                        <input type="hidden" name="secret" value="<?php echo osc_item_secret();?>" />
                    <?php } ?>

                    <h4 class="title-widget-search"><?php _e('General Information', 'dreamfree'); ?></h4>

                    <!-- Category -->
                    <label class="control-label" for="select_1"><?php _e('Category', 'dreamfree'); ?></label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend user-input-profile">
                            <span class="input-group-text" id="basic-addon1"><i class="fa fa-th-large"></i>
                                <?php ItemForm::category_select(null, null, __('Select a category', 'dreamfree')); ?>
                            </span>
                        </div>
                    </div>

                    <!-- Title -->
                    <label class="control-label" for="title[<?php echo osc_current_user_locale(); ?>]"><?php _e('Title', 'dreamfree'); ?></label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend user-input-profile">
                            <span class="input-group-text" id="basic-addon1"><i class="fa fa-pencil"></i>
                                <?php ItemForm::title_input('title', osc_current_user_locale(), osc_esc_html(dreamfree_item_title())); ?>
                            </span>
                        </div>
                    </div>

                    <!-- Description -->
                    <label class="control-label" for="description[<?php echo osc_current_user_locale(); ?>]"><?php _e('Description', 'dreamfree'); ?></label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend user-input-profile">
                            <span class="input-group-text" id="basic-addon1"><i class="fa fa-pencil-square-o"></i>
                                <?php ItemForm::description_textarea('description', osc_current_user_locale(), osc_esc_html(dreamfree_item_description())); ?>
                            </span>
                        </div>
                    </div>

                    <!-- Price -->
                    <?php if(osc_price_enabled_at_items()) { ?>
                        <label class="control-label" for="price"><?php _e('Price', 'dreamfree'); ?></label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend user-input-profile">
                                <span class="input-group-text" id="basic-addon1"><i class="fa fa-usd"></i>
                                    <div class="price-input"><?php ItemForm::price_input_text(); ?></div>
                                    <div class="price-inputa"><?php ItemForm::currency_select(); ?></div>
                                </span>
                            </div>
                        </div>
                    <?php } ?>

                    <!-- Images -->
                    <?php if(osc_images_enabled_at_items()) {
                        ItemForm::ajax_photos();
                    } ?>

                    <!-- <h4 class="title-widget-search"><?php _e('Upload PDF File', 'dreamfree'); ?></h4>
                    <label class="control-label" for="pdf_file"><?php _e('PDF File (Optional)', 'dreamfree'); ?></label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend user-input-profile">
                            <span class="input-group-text" id="basic-addon1"><i class="fa fa-file-pdf-o"></i>
                                <input type="file" name="pdf_file" id="pdf_file" accept=".pdf" />
                            </span>
                        </div>
                    </div> -->

                    <input type="file" name="pdf_file" accept="application/pdf">





                    <!-- Country selection -->
                    <label class="control-label" for="countryId"><?php _e('Country', 'dreamfree'); ?></label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend user-input-profile">
                            <span class="input-group-text" id="basic-addon1"><i class="fa fa-tags"></i>
                                <?php ItemForm::country_select(null, null, __('Select a country', 'dreamfree')); ?>
                            </span>
                        </div>
                    </div>

                    <!-- Hidden phone/WhatsApp fields -->
                    <?php
                    $default_info = array(
                        'phone'   => '+201000000000',
                        'whatsapp'=> '+201000000000'
                    );
                    ?>
                    <input type="hidden" name="user-phone" value="<?php echo $default_info['phone']; ?>">
                    <input type="hidden" name="user-whatsapp" value="<?php echo $default_info['whatsapp']; ?>">

                    <!-- Seller info -->
                    <?php
                    $def = osc_user();
                    $user_info = array(
                        's_contact_name' => isset($def['s_name']) ? $def['s_name'] : 'John Doe',
                        's_address' => $default_info['whatsapp'],
                        's_city_area' => $default_info['phone'],
                        's_contact_email' => isset($def['s_email']) ? $def['s_email'] : 'example@example.com'
                    );
                    ?>

                    <?php if(!osc_is_web_user_logged_in()) { ?>
                        <input type="hidden" name="contactName" value="<?php echo $user_info['s_contact_name']; ?>">
                        <input type="hidden" name="contactEmail" value="<?php echo $user_info['s_contact_email']; ?>">
                    <?php } ?>

                    <!-- Plugin hooks -->
                    <?php
                    if($edit) {
                        ItemForm::plugin_edit_item();
                    } else {
                        ItemForm::plugin_post_item();
                    }
                    ?>

                    <!-- Recaptcha -->
                    <?php if(osc_recaptcha_items_enabled()) { ?>
                        <div class="controls">
                            <?php osc_show_recaptcha(); ?>
                        </div>
                    <?php } ?>

                    <div class="controls">
                        <button type="submit" class="btn btn-danger">
                            <?php if($edit) { _e("Update", 'dreamfree'); } else { _e("Publish", 'dreamfree'); } ?>
                        </button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<?php osc_current_web_theme_path('footer.php'); ?>
