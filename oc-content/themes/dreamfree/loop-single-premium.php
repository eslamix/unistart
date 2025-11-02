<?php $size = explode('x', osc_thumbnail_dimensions()); ?>
<li class="listing-card <?php echo $class; ?> premium">
    <?php if( osc_images_enabled_at_items() ) { ?>
        <?php if(osc_count_premium_resources()) { ?>
            <a class="listing-thumb sarechsmall" href="<?php echo osc_premium_url() ; ?>" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>"><span class="category"><img src="<?php echo osc_resource_thumbnail_url(); ?>" title="" alt="<?php echo osc_esc_html(osc_premium_title()) ; ?>" width="<?php echo $size[0]; ?>" height="<?php echo $size[1]; ?>"></a><div class="ster-5"><i class="fa fa-star-o"></i><?php _e('Premium listing', 'dreamfree'); ?></div></span>
        <?php } else { ?>
            <a class="listing-thumb sarechsmall" href="<?php echo osc_premium_url() ; ?>" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>"><img src="<?php echo osc_current_web_theme_url('images/no_photo.gif'); ?>" title="" alt="<?php echo osc_esc_html(osc_premium_title()) ; ?>" width="<?php echo $size[0]; ?>" height="<?php echo $size[1]; ?>"></a>
        <?php } ?>
    <?php } ?>
    <div class="listing-detail">
        <div class="listing-cell">
            <div class="listing-data">
                <div class="listing-basicinfo">
                    <a href="<?php echo osc_premium_url() ; ?>" class="title" title="<?php echo osc_esc_html(osc_premium_title()) ; ?>"><?php echo osc_premium_title() ; ?></a>
                    <div class="listing-attributes">
                        <h5><span class="badge badge-success price-pblck"><?php if( osc_price_enabled_at_items() ) { ?><span class=""><?php echo osc_format_price(osc_premium_price(),osc_premium_currency_symbol()); ?></span><?php } ?></span></h5>
                        <div class="make-favorite"><?php if(function_exists('fi_make_favorite')) { echo fi_make_favorite(); } ?></div>
						<span class="location"><?php echo osc_premium_city(); ?> <?php if(osc_premium_region()!='') { ?>(<?php echo osc_premium_region(); ?>)<?php } ?></span> <span class="g-hide">-</span>
                        
                    </div>
                    <p><?php echo osc_highlight( osc_premium_description(), 250 ); ?></p>
                </div>
                <?php if($admin){ ?>
                    <span class="admin-options">
                        <a href="<?php echo osc_premium_edit_url(); ?>" rel="nofollow"><?php _e('Edit item', 'dreamfree'); ?></a>
                        <span>|</span>
                        <a class="delete" onclick="javascript:return confirm('<?php echo osc_esc_js(__('This action can not be undone. Are you sure you want to continue?', 'dreamfree')); ?>')" href="<?php echo osc_premium_delete_url();?>" ><?php _e('Delete', 'dreamfree'); ?></a>
                        <?php if(osc_premium_is_inactive()) {?>
                        <span>|</span>
                        <a href="<?php echo osc_premium_activate_url();?>" ><?php _e('Activate', 'dreamfree'); ?></a>
                        <?php } ?>
                    </span>
                <?php } ?>
            </div>
        </div>
    </div>
</li>
