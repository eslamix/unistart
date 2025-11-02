	<?php
    // meta tag robots
    osc_add_hook('header','dreamfree_nofollow_construct');

    osc_enqueue_script('jquery-validate');
    dreamfree_add_body_class('contact');
?>
<div id="sidebar">


    <?php if( osc_get_preference('sidebar-300x250', 'dreamfree') != '') {?>
    <!-- sidebar ad 350x250 -->
    <div class="alert alert-success ads_item-sidebar alert-for-item" role="alert">
        <?php echo osc_get_preference('sidebar-300x250', 'dreamfree'); ?>
		
    </div>
    <!-- /sidebar ad 350x250 -->
    <?php } ?>

		<div class="container mt-3">
  <div class="media border p-3">
    
    <div class="media-body">     
      <h6><i><small>	  
	              <?php if( osc_item_user_id() != null ) { ?>
                <i class="far fa-user"></i>&nbsp;<?php _e('Name', 'dreamfree') ?> : <a href="<?php echo osc_user_public_profile_url( osc_item_user_id() ); ?>" ><?php echo osc_item_contact_name(); ?></a>
            <?php } else { ?>
                <i class="far fa-user"></i>&nbsp;<?php printf(__('Name: %s', 'dreamfree'), osc_item_contact_name()); ?>
            <?php } ?>			
	  </i></small></h6>
   
	<h6><i><small>
                <?php if(osc_item_user_id() <> 0) { ?>
                  
                    <?php $user = User::newInstance()->findByPrimaryKey( osc_item_user_id() ); ?>
                    <?php if($user['b_company'] == 1) { ?>
                      <span><?php _e('Number of items', 'dreamfree'); ?>
<?php $conn1 = getConnection();$result3 = $conn1->osc_dbFetchResult("SELECT COUNT(*) as count FROM %st_item i WHERE i.fk_i_user_id = '%d' AND i.b_active = 1 AND i.b_enabled = 1", DB_TABLE_PREFIX, osc_user_id());echo $result3['count'];?>
</span>	
                    <?php } else { ?>					
                      <span><i class="far fa-check-circle"></i><?php _e('Number of items', 'dreamfree'); ?>			
					  <?php $conn1 = getConnection();$result3 = $conn1->osc_dbFetchResult("SELECT COUNT(*) as count FROM %st_item i WHERE i.fk_i_user_id = '%d' AND i.b_active = 1 AND i.b_enabled = 1", DB_TABLE_PREFIX, osc_user_id());echo $result3['count'];?></span>
					  </span>                  				  
                    <?php } ?>
                </i></small></h6>
				
				<h6><i><small>
				 <?php if(osc_item_user_id() <> 0) { ?>

                    <?php } else { ?>
                      <i class="far fa-times-circle" style="color:#d00"></i><?php echo __('Unknown registration date', 'dreamfree'); ?>
                    <?php } ?>
                  <?php } else { ?>
                    <i class="far fa-times-circle"></i><?php echo __('Unregistered user', 'dreamfree'); ?>
					                 <?php } ?>
</i></small></h6>
		<?php if(osc_item_address() <> '') { ?>
          <?php 
            $WhatsApp = '';
            if($WhatsApp == '') { $WhatsApp = osc_item_address(); }      
            if($WhatsApp == '' && osc_item_user_id() <> 0) { $WhatsApp = $item_user['s_WhatsApp']; }         
    if($WhatsApp == '') { $WhatsApp = __('Advertiser does not allow correspondence WhatsApp', 'dreamfree'); }    
          ?> 
<!-- <a class="whatsappa" target="_blank" atl="<?php echo osc_esc_html(__('Click to email the advertiser WhatsApp', 'dreamfree')); ?>" href="https://wa.me/<?php echo $WhatsApp; ?>"><img class="tr1" src="<?php echo osc_current_web_theme_url('images/whatsapp-chaton.png'); ?>" title="<?php echo osc_esc_html(__('Click to email the advertiser WhatsApp', 'dreamfree')); ?>"/></a> -->
<?php } else { ?>
<!-- <DIV class="whatsappa"><img class="tr1" src="<?php echo osc_current_web_theme_url('images/whatsapp-chatoff.png'); ?>" title="<?php echo osc_esc_html(__('Advertiser does not allow correspondence WhatsApp', 'dreamfree')); ?>"/></div> -->
<?php } ?> 
              
               	
<h6><i><small>
<?php if(osc_user_phone_mobile() <> '') { ?>
          <a class="mobile_text-show tr1" href="#" rel="<?php echo osc_user_phone_mobile(); ?>" title="<?php echo osc_esc_html(__(' ', 'dreamfree')); ?>"><i class="fa fa-mobile" style="font-size:16px;"></i> :
<span class="top-a tr1" rel="  <?php _e(' ', 'dreamfree'); ?> "> <?php echo osc_user_phone_mobile() == __('No phone number', 'dreamfree') ? ' ' : __(' ', 'dreamfree'); ?></span>
              <span class="bottom tr1">
                <?php 
                  if(strlen(osc_user_phone_mobile()) > 3 and $mobile <> __('No phone number', 'dreamfree')) {
                    echo substr(osc_user_phone_mobile(), 0, strlen(osc_user_phone_mobile()) - 5) . 'XXXXX'; 
                  } else {
                    echo osc_user_phone_mobile();
                  }
                ?>
              </span>
                 </a>
				 </i></small></h6>
				 <?php } else { ?>
<?php if(osc_item_city_area() <> '') { ?>
<h6><i><small>
				 
          <?php 
            $mobile = '';
            if($mobile == '') { $mobile = osc_item_city_area(); }      
            if($mobile == '' && osc_item_user_id() <> 0) { $mobile = $item_user['s_phone_mobile']; }      
            if($mobile == '' && osc_item_user_id() <> 0) { $mobile = $item_user['s_phone_land']; }      
            if($mobile == '') { $mobile = __('No phone number', 'dreamfree'); }      
          ?> 
  
          <a class="phone-show tr1" href="#" rel="<?php echo $mobile; ?>" title="<?php echo osc_esc_html(__(' ', 'dreamfree')); ?>"><i class="fa fa-mobile" style="font-size:16px;"></i> :
<span class="top-a tr1" rel="  <?php _e(' ', 'dreamfree'); ?> "> <?php echo $mobile == __('No phone number', 'dreamfree') ? ' ' : __(' ', 'dreamfree'); ?></span>
              <span class="bottom tr1">
                <?php 
                  if(strlen($mobile) > 3 and $mobile <> __('No phone number', 'dreamfree')) {
                    echo substr($mobile, 0, strlen($mobile) - 5) . 'XXXXX'; 
                  } else {
                    echo $mobile;
                  }
                ?>
              </span>
                 </a>	
 <?php } ?> <?php } ?> 
	  </i></small></h6>
		  
<h6><i><small>
<?php if( osc_item_show_email() ) { ?>
<i class="fa fa-envelope-o" style="    margin: 0 -2px 0 0px;"></i>&nbsp;:&nbsp;<?php echo osc_item_contact_email () ; ?>
 <?php } ?> 
</i></small></h6>
<div class="container">
  <div id="accordion">
<?php if( osc_item_user_id() != null ) { ?>
<h6><i><small>
<i class="far fa-address-card"></i>&nbsp;<a class="collapsed card-link" data-toggle="collapse" href="">
<a href="<?php echo osc_user_public_profile_url( osc_item_user_id() ); ?>" ><?php _e('Profile personly', 'dreamfree'); ?></a>
</a></span>
</i></small></h6>
<?php } ?>


      <div id="collapseThree" class="collapse" data-parent="#accordion">
	  	  	  <div class="card-body -mael">               
</div>
					   <h6><i><small>     <a class="collapsed card-link user-public-profile-item" href="#collapseThree">
          <span><i class="fa fa-address-card-o"></i>&nbsp;<a href="#" ><?php _e('Profile personly', 'dreamfree'); ?><?php echo osc_item_contact_name(); ?>
        	              <?php if( osc_item_user_id() != null ) { ?>
                
            <?php } ?></a></a></span></i></small></h6>
      </div>
    </div>
  </div>
    </div>
   <!-- USER IS NOT OWNER OF LISTING -->
                <?php if(function_exists('profile_picture_show')) { ?>
                  <?php if(osc_item_user_id() <> 0 and osc_item_user_id() <> '') { ?>
				  
                    <a style="width: 48px;height: 48px;" href="<?php echo osc_user_public_profile_url(osc_item_user_id()); ?>" title="<?php echo osc_esc_html(__('Check profile of this user', 'dreamfree')); ?>">
                      <?php profile_picture_show(null, 'item', 100); ?>
                    </a>					
                  <?php } else { ?>
                    <div class="side-prof">
                      <?php profile_picture_show(null, 'item', 100); ?>
                    </div>
                  <?php } ?>
                <?php } ?>
  </div>
        <?php if( osc_item_is_expired () ) { ?>
            <p>
                <?php _e("The listing is expired. You can't contact the publisher.", 'dreamfree'); ?>
            </p>
        <?php } else if( ( osc_logged_user_id() == osc_item_user_id() ) && osc_logged_user_id() != 0 ) { ?>
		<div class="faslh"></div>
 <!-- <div class="alert alert-warning">
    <?php _e("It's your own listing, you can't contact the publisher.", 'dreamfree'); ?>
  </div> -->
          <?php if(osc_is_web_user_logged_in() && osc_logged_user_id()==osc_item_user_id()) { ?>
		  <?php if(function_exists('tis_show')) { tis_show(osc_item_id(), osc_item_user_id()); } ?>
                    <span class="admin-options">
                        <a href="<?php echo osc_item_edit_url(); ?>" rel="nofollow"><?php _e('Edit item', 'dreamfree'); ?></a>
                        <span>|</span>
                        <a class="delete" onclick="javascript:return confirm('<?php echo osc_esc_js(__('This action can not be undone. Are you sure you want to continue?', 'dreamfree')); ?>')" href="<?php echo osc_item_delete_url();?>" ><?php _e('Delete', 'dreamfree'); ?></a>
                        <?php if(osc_item_is_inactive()) {?>
                        <span>|</span>
                        <a href="<?php echo osc_item_activate_url();?>" ><?php _e('Activate', 'dreamfree'); ?></a>
                        <?php } ?>
                    </span>
           
        <?php } ?>
                

        <?php } else if( osc_reg_user_can_contact() && !osc_is_web_user_logged_in() ) { ?>
            <h6>
                <?php _e("You must log in or register a new account in order to contact the advertiser", 'dreamfree'); ?>
            </h6>
            <p class="contact_button">
                <h6><a href="<?php echo osc_user_login_url(); ?>"><?php _e('Login', 'dreamfree'); ?></a></h6>
                <h6><a href="<?php echo osc_register_account_url(); ?>"><?php _e('Register', 'dreamfree'); ?></a></h6>
            </p>
        <?php } else { ?>
<!-- Button trigger modal -->
<!-- <center><button type="button" class="btn btn-danger for-item-comment" data-toggle="modal" data-target="#exampleModalCenter"> -->
<!-- <?php _e('Contact seller', 'dreamfree'); ?>&nbsp;<i class="fa fa-envelope-o" aria-hidden="true"></i> -->
<!-- </button></center> -->
<div class="clear"></div>
<!-- Email -->
<br>
<center>
<!-- <a href="#"data-toggle="modal" data-target="#exampleModalScrollablefriend" target="_blank" class="sss-share-btn"><img src="oc-content/themes/dreamfree/images/email.png" alt="<?php _e('Send to friend', 'dreamfree'); ?>" title="<?php _e('Send to friend', 'dreamfree'); ?>" /></a> -->
<!-- Facebook -->
<!-- <a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo rawurlencode(osc_item_url()); ?>&t=<?php echo osc_item_title(); ?>" target="_blank" class="sss-share-btn"><img src="oc-content/themes/dreamfree/images/facebook.png" alt="<?php _e('Share us on Facebook', 'dreamfree'); ?>" title="<?php _e('Share us on Facebook', 'dreamfree'); ?>" /></a> -->
<!-- Twitter -->
<!-- <a href="https://twitter.com/share?url=<?php echo rawurlencode(osc_item_url()); ?>&text=<?php echo osc_item_title(); ?>" target="_blank" class="sss-share-btn"><img src="oc-content/themes/dreamfree/images/twitter.png" alt="<?php _e('Tweet us', 'dreamfree'); ?>" title="<?php _e('Tweet us', 'dreamfree'); ?>" /></a> -->
<!-- Linkedin -->
<!-- <a href="https://www.linkedin.com/shareArticle?mini=true&url=<?php echo rawurlencode(osc_item_url()); ?>&title=<?php echo osc_item_title(); ?>" target="_blank" class="sss-share-btn"><img src="oc-content/themes/dreamfree/images/linkedin.png" alt="<?php _e('Share us on LinkedIn', 'dreamfree'); ?>" title="<?php _e('Share us on LinkedIn', 'dreamfree'); ?>" /></a> -->
<!-- Pinterest -->
<!-- <a href="https://pinterest.com/pin/create/button/?url=<?php echo rawurlencode(osc_item_url()); ?>" target="_blank" class="sss-share-btn"><img src="oc-content/themes/dreamfree/images/pinterest.png" alt="<?php _e('Share us on Pinterest', 'dreamfree'); ?>" title="<?php _e('Share us on Pinterest', 'dreamfree'); ?>" /></a> -->
<!-- SIMPLE SOCIAL SHARE BUTTONS END -->
</center>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="title-widget-search"><?php _e('Contact seller', 'dreamfree'); ?></h4>
      </div>
      <div class="modal-body">
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

                <div class="control-group">
                    <div class="controls">
                        <div class="recaptcha-show">
<?php osc_show_recaptcha(); ?>
                        </div>
                        <button type="submit" class="btn btn-danger"><?php _e("Send", 'dreamfree');?></button>
                    </div>
                </div>
            </form>
            <?php ContactForm::js_validation(); ?>
        
      </div>
    </div>
  </div>
</div>
<?php } ?>
</div></div><!-- /sidebar -->
        
          <?php osc_reset_resources(); ?>

<!-- start Modal friend -->
<div class="modal fade" id="exampleModalScrollablefriend" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="title-widget-search" id="exampleModalScrollableTitle"><?php _e('Send to a friend', 'dreamfree'); ?></h4>
      </div>
      <div class="modal-body">

<div class="form-container form-horizontal form-container-box">
    <div class="resp-wrapper">
        
        <form name="sendfriend" action="<?php echo osc_base_url(true); ?>" method="post" >
		<ul id="error_list"></ul>
            <input type="hidden" name="action" value="send_friend_post" />
            <input type="hidden" name="page" value="item" />
            <input type="hidden" name="id" value="<?php echo osc_item_id(); ?>" />
            <?php if(osc_is_web_user_logged_in()) { ?>
                            <input type="hidden" name="yourName" value="<?php echo osc_esc_html( osc_logged_user_name() ); ?>" />
                            <input type="hidden" name="yourEmail" value="<?php echo osc_logged_user_email();?>" />
            <?php } else { ?>
			

                <label class="con0trol-label" for="yourName"><?php _e("Your name",'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i><?php SendFriendForm::your_name(); ?>
 </span></div></div>
 

                <label class="control-label" for="yourEmail"><?php _e("Your e-mail",'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-at"></i><?php SendFriendForm::your_email(); ?>
 </span></div></div>
 
            <?php } ?>

                <label class="control-label" for="friendName"><?php _e("Your friend's name",'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-handshake-o"></i><?php SendFriendForm::friend_name(); ?>
 </span></div></div>
 

                <label for="friendEmail"><?php _e("Your friend's e-mail address", 'dreamfree'); ?></label> </label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-at"></i><?php SendFriendForm::friend_email(); ?>
 </span></div></div>
 

                <label class="control-label" for="subject">
                    <?php _e('Subject (optional)', 'dreamfree'); ?>
                </label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-pencil"></i><?php ContactForm::the_subject(); ?>
 </span></div></div>
 

                <label class="control-label" for="message">
                    <?php _e('Message', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-pencil"></i><?php SendFriendForm::your_message(); ?>
 </span></div></div>
 
            <div class="control-group">
                <div class="controls">
                    <?php osc_run_hook('contact_form'); ?>
                    <?php osc_show_recaptcha(); ?>
                    <button type="submit" class="btn btn-danger for-item-comment"><?php _e("Send", 'dreamfree');?></button>
                    <?php osc_run_hook('admin_contact_form'); ?>
                </div>
            </div>
        </form>
        <?php SendFriendForm::js_validation(); ?>
    </div>
</div>
      
      </div>
    </div>
  </div>
</div>



<div class="sidebar2">
    <?php if( osc_comments_enabled() ) { ?>
        <?php if( osc_reg_user_post_comments () && osc_is_web_user_logged_in() || !osc_reg_user_post_comments() ) { ?>
        <div id="comments">

            <div class="container mt-3 comments-home">
  <div class="media border p-3 Commentsup">
    <div class="media-body">
<?php _e('Comments', 'dreamfree'); ?>    
    </div>
<?php echo osc_item_total_comments (); ?>&nbsp;&nbsp;<i class="fa fa-comments-o"></i>
  </div>
</div>

            <?php CommentForm::js_validation(); ?>
            <?php if( osc_count_item_comments() >= 1 ) { ?>
                <div class="comments_list">
                  <?php $class = 'even'; ?>
                  <?php $i = 1; ?>
                  <?php while ( osc_has_item_comments() ) { ?>
  <div class="comment-wrap <?php echo $class; ?>">
    <div class="ins">
      <div class="comment-image">
        <!-- الصورة دايمًا ثابتة -->
        <img src="<?php echo osc_current_web_theme_url(); ?>images/profile-default.png" alt="Profile"/>
      </div>

      <div class="comment">
        <h4>
          <span class="bold">
            <?php if(osc_comment_title() == '') { _e('Review', 'dreamfree'); } else { echo osc_comment_title(); } ?> 
            <?php _e('by', 'dreamfree'); ?> 
            <?php if(osc_comment_author_name() == '') { _e('Anonymous', 'dreamfree'); } else { echo osc_comment_author_name(); } ?>:
          </span>
        </h4>
        <span class="bolda"><?php echo osc_comment_body(); ?></span> 

        <?php if ( osc_comment_user_id() && (osc_comment_user_id() == osc_logged_user_id()) ) { ?>
          <a rel="nofollow" class="remove" href="<?php echo osc_delete_comment_url(); ?>" title="<?php echo osc_esc_html(__('Delete your comment', 'dreamfree')); ?>">
            <span class="not767"><?php _e('Delete', 'dreamfree'); ?></span>
            <span class="is767"><i class="fa fa-trash-o"></i></span>
          </a>
        <?php } ?>
      </div>
    </div>
  </div>

  <?php $class = ($class == 'even') ? 'odd' : 'even'; ?>
  <?php
    $i++;
    $i = $i % 3 + 1;
  ?>
<?php } ?>


                  <div class="paginate"><?php echo osc_comments_pagination(); ?></div>
				  

                </div>
            <?php } ?>
	<button type="button" class="btn btn-danger for-item-comment" data-toggle="modal" data-target="#exampleModalCentercomments">
<?php _e('Add new comment', 'dreamfree'); ?>&nbsp;<i class="fa fa-commenting-o"></i>
</button>		
		<!-- Modal -->
<div class="modal fade" id="exampleModalCentercomments" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="title-widget-search"><?php _e('Comments', 'dreamfree'); ?></h4>
      </div>
      <div class="modal-body">
<div class="form-container form-horizontal">
                <div class="header">
				<div class="alert alert-success">
  <strong><?php _e('Leave your comment (spam and offensive messages will be removed)', 'dreamfree'); ?></strong>
</div>
                    
                </div>
                <div class="resp-wrapper">
				<ul style="border-radius: 5px;background: #f8d7da;color: #B94A48;"id="comment_error_list"></ul>
                    <form action="<?php echo osc_base_url(true); ?>" method="post" name="comment_form" id="comment_form">
                        <fieldset>

                            <input type="hidden" name="action" value="add_comment" />
                            <input type="hidden" name="page" value="item" />
                            <input type="hidden" name="id" value="<?php echo osc_item_id(); ?>" />
                            <?php if(osc_is_web_user_logged_in()) { ?>
                                <input type="hidden" name="authorName" value="<?php echo osc_esc_html( osc_logged_user_name() ); ?>" />
                                <input type="hidden" name="authorEmail" value="<?php echo osc_logged_user_email();?>" />
                            <?php } else { ?>
                                
                                    <label class="control-labىel" for="authorName"><?php _e('Your name', 'dreamfree'); ?></label>

<div class="input-group mb-3">
<div class="input-group-prepend item-Comment-input">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i><?php CommentForm::author_input_text(); ?>
                                     </span></div></div>
									 
                               
                                    <label class="control-label" for="authorEmail"><?php _e('Your e-mail', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend item-Comment-input">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-at"></i><?php CommentForm::email_input_text(); ?>
 </span></div></div>
 
                            <?php }; ?>
                     
                                <label class="control-label" for="title"><?php _e('Title', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend item-Comment-input">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-pencil"></i><?php CommentForm::title_input_text(); ?>
 </span></div></div>
 
                          
                                <label class="control-label" for="body"><?php _e('Comment', 'dreamfree'); ?></label>
<div class="input-group mb-3">
<div class="input-group-prepend">
<span class="input-group-text" id="basic-addon1"><i class="fa fa-pencil-square-o"></i><div class="textarea item-Comment"><?php CommentForm::body_input_textarea(); ?></div>
 </span></div></div>
 
                            <div class="actions">
                                <button type="submit" class="btn btn-danger"><?php _e('Send', 'dreamfree'); ?></button>
                            </div>

                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>	
</div>            
        <?php } ?>
    <?php } ?>
	<br>
<!-- <div class="sidebar1">
<?php
if (osc_item_user_id() != '') {
    $aItems = Item::newInstance()->findByUserID(osc_item_user_id(), 0, 6);
    View::newInstance()->_exportVariableToView('items', $aItems);
    ?>
    <div class="box user-products">
        <div class="products-from"><?php printf(__('Other products from %s', 'dreamfree'), osc_user_name()); ?></div>
        <?php
        while (osc_has_items()) {
            if (osc_count_item_resources()) {
                osc_get_item_resources();
                ?>
                <a href="<?php echo osc_item_url(); ?>" title="<?php echo osc_esc_html(osc_item_title()); ?>">
                    <img class="user-img-item"src="<?php echo osc_resource_thumbnail_url(); ?>" alt="<?php echo osc_item_title(); ?>"  title="<?php echo osc_item_title(); ?>" />
                </a>
        <?php } else { ?>
                <a href="<?php echo osc_item_url(); ?>" title="<?php echo osc_esc_html(osc_item_title()); ?>">
                    <img class="user-img-item"src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" alt="<?php echo osc_item_title(); ?>"title="<?php echo osc_item_title(); ?>" />
                </a>
        <?php } ?>
    <?php } ?>
    </div>
<?php } ?> -->
</div>
<div class="sidebar3">
    <?php if( osc_get_preference('sidebara-300x250', 'dreamfree') != '') {?>
    <!-- sidebara ad 350x250 -->
    <div class="alert alert-success ads_item-sidebar alert-for-item" role="alert">
        <?php echo osc_get_preference('sidebara-300x250', 'dreamfree'); ?>
		
    </div>
    <!-- /sidebara ad 350x250 -->
    <?php } ?>
	</div>
<script type="text/javascript">
      $(document).ready(function(){
        // WRAP TEXT IN H2 & H3 IN ATTRIBUTES PLUGIN INTO SPAN
        $('#plugin-details h2, #plugin-details h3').each(function(){
          $(this).html('<span>' + $(this).html() + '</span>');
        });

        // SHOW PHONE NUMBER ON CLICK
        <?php if($mobile <> __('No phone number', 'dreamfree')) { ?>  
          $('.phone-show').click(function(){
            if($(this).attr('href') == '#') {
              $('.phone-show span.bottom').text($('.phone-show').attr('rel')).css('font-weight', 'bold');
              $('.phone-show span.top').text($('.phone-show span.top').attr('rel'));
              $('.phone-show').attr('href', 'tel:' + $('.phone-show').attr('rel'));
              return false;
            }
          });
        <?php } else { ?>
          $('.phone-show').click(function(){
            return false;
          });
        <?php } ?>
		
		        // SHOW WhatsApp NUMBER ON CLICK
        <?php if($WhatsApp <> __('No WhatsApp', 'dreamfree')) { ?>  
          $('.WhatsApp-show').click(function(){
            if($(this).attr('href') == '#') {
              $('.WhatsApp-show span.bottom').text($('.WhatsApp-show').attr('rel')).css('font-weight', 'bold');
              $('.WhatsApp-show span.top').text($('.WhatsApp-show span.top').attr('rel'));
              $('.WhatsApp-show').attr('href', 'https://wa.me/' + $('.WhatsApp-show').attr('rel'));
              return false;
            }
          });
        <?php } else { ?>
          $('.WhatsApp-show').click(function(){
            return false;
          });
        <?php } ?>

				        // SHOW mobile_text NUMBER ON CLICK
        <?php if($mobile_text <> __('No WhatsApp', 'dreamfree')) { ?>  
          $('.mobile_text-show').click(function(){
            if($(this).attr('href') == '#') {
              $('.mobile_text-show span.bottom').text($('.mobile_text-show').attr('rel')).css('font-weight', 'bold');
              $('.mobile_text-show span.top').text($('.mobile_text-show span.top').attr('rel'));
              $('.mobile_text-show').attr('href', 'tel:' + $('.mobile_text-show').attr('rel'));
              return false;
            }
          });
        <?php } else { ?>
          $('.WhatsApp-show').click(function(){
            return false;
          });
        <?php } ?>

        // PLACEHOLDERS FOR CONTACT SELLER FORM
		$('#contact_form #phoneNumber').attr('placeholder', '<?php echo osc_esc_js(__('Contact WhatsApp', 'dreamfree')); ?>');
        $('#contact_form #phoneNumber').attr('placeholder', '<?php echo osc_esc_js(__('Contact mobile/phone', 'dreamfree')); ?>');
        $('#contact_form #message').attr('placeholder', '<?php echo osc_esc_js(__('I would like to ask you...', 'dreamfree')); ?>');

      });
    </script>	
