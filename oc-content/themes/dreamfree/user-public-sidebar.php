<div id="sidebar">
    <?php if(osc_logged_user_id() !=  osc_user_id()) { ?>
    <?php     if(osc_reg_user_can_contact() && osc_is_web_user_logged_in() || !osc_reg_user_can_contact() ) { ?>
        <div id="contact" class="widget-box form-container form-vertical">
            <h4 class="title-widget-box"><?php _e("Contact", 'dreamfree'); ?></h4>
                <ul id="error_list"></ul>
            <form action="<?php echo osc_base_url(true); ?>" method="post" name="contact_form" id="contact_form" <?php if(osc_item_attachment()) { echo 'enctype="multipart/form-data"'; };?> >
                <?php osc_prepare_user_info(); ?>
                 <input type="hidden" name="action" value="contact_post" />
                    <input type="hidden" name="page" value="item" />
                    <input type="hidden" name="id" value="<?php echo osc_item_id(); ?>" />
                
                    <label class="control-label" for="yourName"><?php _e('Your name', 'dreamfree'); ?>:</label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i><?php ContactForm::your_name(); ?></div>
                </span></div>
				
               
                    <label class="control-label" for="yourEmail"><?php _e('Your e-mail address', 'dreamfree'); ?>:</label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-at"></i><div class=""><?php ContactForm::your_email(); ?></div>
               </span></div></div>
			   
               
                    <label class="control-label" for="phoneNumber"><?php _e('Phone number', 'dreamfree'); ?> (<?php _e('optional', 'dreamfree'); ?>):</label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-mobile"></i><?php ContactForm::your_phone_number(); ?></div>
                 </span></div>

                
                    <label class="control-label" for="message"><?php _e('Message', 'dreamfree'); ?>:</label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-pencil-square-o"></i><?php ContactForm::your_message(); ?></div>
                 </span></div>

                <?php if(osc_item_attachment()) { ?>
                    <div class="control-group">
                        <label class="control-label" for="attachment"><?php _e('Attachment', 'dreamfree'); ?>:</label>
                        <div class="controls"><?php ContactForm::your_attachment(); ?></div>
                    </div>
                <?php }; ?>
                        <div class="recaptcha-show">
<?php osc_show_recaptcha(); ?>
                        </div>
                <div class="control-group">
                    <div class="controls">


                        <button type="submit" class="btn btn-danger"><?php _e("Send", 'dreamfree');?></button>
                    </div>
                </div>
            </form>
            <?php ContactForm::js_validation(); ?>
                <?php
        }
    }
    ?>

</div> </div><!-- /sidebar -->