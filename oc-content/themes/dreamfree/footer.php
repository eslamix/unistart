</div><!-- content -->
<?php osc_run_hook('after-main'); ?>
</div>
<div class="clear"></div>
 <?php if( osc_get_preference('link-footer-230x90', 'dreamfree') != '') { ?>	

<?php }; ?>
<div id="responsive-trigger"></div>
<!-- footer -->

<?php osc_show_widgets('footer');?>
<!------ new footer ---------->
<div class="mt-5 pt-5 pb-5 footer">
<div class="container for-footer">
  <div class="row">
    <div class="col-lg-5 col-xs-12 about-company">      
	  <div class="faslh13"></div>    
<nav class="nav flex-column">
<ul class="scroll-country">   
<div class="country">
  <?php if( osc_count_list_countries() > 0 ) { ?>                       
    <p><?php _e("Location", 'dreamfree'); ?></p> 
    <ul class="list-group country-footer">
      <?php while( osc_has_list_countries() ) { ?>
        <li class="list-group-item country-footera">
          <a alt="<?php echo osc_list_country_name(); ?>" title="<?php echo osc_list_country_name(); ?>" 
             class="country" href="<?php echo osc_search_url( array( 'sCountry' => osc_list_country_name() ) ); ?>">
            <?php echo osc_list_country_name(); ?>
            <!-- <img class="country-icon" src="<?php echo osc_current_web_theme_url('images/country_flags/') . osc_list_country_code() .'.png' ?>"> -->
          </a>
          <span class="badge-footer"><?php echo osc_list_country_items(); ?></span>
        </li>
      <?php } ?>
    </ul>
  <?php } ?>
</div>

</ul>
</nav></div>
<div class="col-lg-3 col-xs-12 links">
<p><?php _e("Category", 'dreamfree') ; ?></p>       
<nav class="nav flex-column">

<?php osc_goto_first_category() ; ?>
<?php while ( osc_has_categories() ) { ?>
  <a  href="<?php echo osc_search_category_url() ; ?>"><i class="fa fa-angle-left" aria-hidden="true"></i> <?php echo osc_category_name() ; ?></a>
<?php } ?>
</nav>
    </div>
    <div class="col-lg-3 col-xs-12 links">
      <p><?php _e("Pages", 'dreamfree') ; ?></p>
<nav class="nav flex-column">
  <?php osc_reset_static_pages();while( osc_has_static_pages() ) { ?>           
   <a href="<?php echo osc_static_page_url(); ?>"><i class="fa fa-angle-left" aria-hidden="true"></i>&nbsp;<?php echo osc_static_page_title(); ?></a>            
        <?php
        }
        ?>
</nav>
</div>
<div class="col-lg-3 col-xs-12 links-foteer">
<p><?php _e("Information", 'dreamfree') ; ?></p>
<nav class="nav flex-column ">
<?php if( osc_users_enabled() ) { ?>
<?php if( osc_is_web_user_logged_in() ) { ?>                                  
<nav class="nav flex-column"><a  class="text-footer"href="<?php echo osc_user_dashboard_url(); ?>"><i class="fa fa-angle-left" aria-hidden="true"></i>&nbsp;<?php _e('My account', 'dreamfree'); ?></a></nav>
<nav class="nav flex-column"><a  class="text-footer"href="<?php echo osc_user_logout_url(); ?>"><i class="fa fa-angle-left" aria-hidden="true"></i>&nbsp;<?php _e('Logout', 'dreamfree'); ?></a></nav>               
<?php } else { ?>
<nav class="nav flex-column"><a  class="text-footer"href="<?php echo osc_user_login_url(); ?>"><i class="fa fa-angle-left" aria-hidden="true"></i>&nbsp;<?php _e('Login', 'dreamfree'); ?></a></nav>
<?php if(osc_user_registration_enabled()) { ?>
<nav class="nav flex-column">
<a  class="text-footer"href="<?php echo osc_register_account_url(); ?>"><i class="fa fa-angle-left" aria-hidden="true"></i>&nbsp;<?php _e('Register', 'dreamfree'); ?></a>
</nav>
<?php } ?>
<?php } ?>
<?php } ?>
<?php if( osc_users_enabled() || ( !osc_users_enabled() && !osc_reg_user_post() )) { ?>
<nav class="nav flex-column">
<a  class="text-footer"href="<?php echo osc_item_post_url_in_category(); ?>"><i class="fa fa-angle-left" aria-hidden="true"></i>&nbsp;<?php _e("Publish your ad for free", 'dreamfree');?></a>
</nav>
<?php } ?>
			          <nav class="nav flex-column">
                <a href="<?php echo osc_contact_url(); ?>"><i class="fa fa-angle-left" aria-hidden="true"></i>&nbsp;<?php _e('Contact', 'dreamfree'); ?></a>
           </nav>
        </ul>
    </div>
  </div>                
</li>

</ul>

<br>

<div class="osclass-ar">

       <div class="share">
	     <div class="first-locale">
  <!-- /start dropdown language -->
        <!-- <?php if ( osc_count_web_enabled_locales() > 1) { ?>
            <?php osc_goto_first_locale(); ?>
            <strong><?php _e('Language:', 'dreamfree'); ?></strong>
            <?php $i = 0;  ?>
            <?php while ( osc_has_web_enabled_locales() ) { ?>
            <span><a id="<?php echo osc_locale_code(); ?>" href="<?php echo osc_change_language_url ( osc_locale_code() ); ?>"><?php echo osc_locale_name(); ?></a></span><?php if( $i == 0 ) { echo " "; } ?>
                <?php $i++; ?>
            <?php } ?>
        <?php } ?> -->
<!-- /end dropdown language -->
 </div>
 <th><a href="<?php echo osc_get_preference('facebook', 'dreamfree'); ?>"><i class="fab fa-facebook-square"></i></a></th>
        <th><a href="<?php echo osc_get_preference('pinterest', 'dreamfree'); ?>"><i class="fab fa-pinterest-square"></i></a></th>
        <th><a href="<?php echo osc_get_preference('twitter', 'dreamfree'); ?>"><i class="fab fa-twitter-square"></i></a></th>
        <th><a href="<?php echo osc_get_preference('linkedin', 'dreamfree'); ?>"><i class="fab fa-linkedin-in"></i></a></th>
</div>
<?php _e('All rights reserved', 'dreamfree'); ?><i class="fa fa-copyright"></i><a href="<?php echo osc_get_preference('link-site', 'dreamfree'); ?>">&nbsp;<?php echo osc_get_preference('name-site', 'dreamfree'); ?></a></div>
<div class=" "><?php _e('  <a title=" " href="#">  </a> <strong>   </strong>', ' '); ?></div>
</div>
</div>
	  <!------ new footer ---------->  
<?php osc_run_hook('footer'); ?>
<div class="mobail-foteer">   
<div class="mobail-Language"> 
  <!-- /start dropdown language -->
        <?php if ( osc_count_web_enabled_locales() > 1) { ?>
            <?php osc_goto_first_locale(); ?>
            <strong><?php _e('Language:', 'dreamfree'); ?></strong>
            <?php $i = 0;  ?>
            <?php while ( osc_has_web_enabled_locales() ) { ?>
            <span><a id="<?php echo osc_locale_code(); ?>" style="color:#fff;" href="<?php echo osc_change_language_url ( osc_locale_code() ); ?>"><?php echo osc_locale_name(); ?></a></span><?php if( $i == 0 ) { echo " "; } ?>
                <?php $i++; ?>
            <?php } ?>
        <?php } ?>
		</div>
<!-- /end dropdown language -->
       <th><a href="<?php echo osc_get_preference('facebook', 'dreamfree'); ?>"><i class="fab fa-facebook-square" style="color:#fff"></i></a></th>
        <th><a href="<?php echo osc_get_preference('pinterest', 'dreamfree'); ?>"><i class="fab fa-pinterest-square"style="color:#fff"></i></a></th>
        <th><a href="<?php echo osc_get_preference('twitter', 'dreamfree'); ?>"><i class="fab fa-twitter-square"style="color:#fff"></i></a></th>
        <th><a href="<?php echo osc_get_preference('linkedin', 'dreamfree'); ?>"><i class="fab fa-linkedin-in"style="color:#fff"></i></a></th>
	  </div>
<button onclick="topFunction()" id="myBtn" title="Go to top"></button>
<?php osc_run_hook( "simple_infinite_scroll"); ?>
	  </body></html>
<script>
//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 500) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>