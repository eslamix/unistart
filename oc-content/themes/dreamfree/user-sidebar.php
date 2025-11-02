<div id="sidebar">
 <div class="list-group-item list-group-item-action user-pro"><?php _e('Display menu','dreamfree'); ?></div>

<?php echo osc_private_user_menu( get_user_menu() ); ?>
<div id="dialog-delete-account" title="<?php echo osc_esc_html(__('Delete account', 'dreamfree')); ?>">
<?php _e('Are you sure you want to delete your account?', 'dreamfree'); ?>
</div></div>