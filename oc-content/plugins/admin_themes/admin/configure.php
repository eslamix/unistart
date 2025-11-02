<?php
  // Create menu
  $title = __('Configure', 'admin_themes');
  adt_menu($title);


  // GET & UPDATE PARAMETERS
  // $variable = mb_param_update( 'param_name', 'form_name', 'input_type', 'plugin_var_name' );
  // input_type: check or value

  //$locale = mb_param_update('locale', 'plugin_action', 'value', 'plugin-admin_themes');
 

  if(Params::getParam('update_theme') <> '') {
    $info = adt_get_info(osc_base_path() . 'oc-admin/themes/' . Params::getParam('admin_theme') . '/index.php');
    $path = osc_base_path() . 'oc-admin/themes/' . Params::getParam('admin_theme') . '/appearance/add.php';

    if($info['theme_type'] == 'oc-admin' || (file_exists($path) && Params::getParam('admin_theme') == 'modern')) {
      osc_set_preference('admin_theme', Params::getParam('admin_theme'), 'osclass');
      header('Location: ' . osc_admin_base_url(true) . '?page=plugins&action=renderplugin&file=admin_themes/admin/configure.php&refresh=1');
    } else {
      message_error( __('This theme could not be activated, it is probably not oc-admin theme', 'admin_themes') );
    }
  }


  if(Params::getParam('refresh') == 1) {
    message_ok( __('Settings were successfully saved', 'admin_themes') );
  }


  if(Params::getParam('remove_theme') <> '') {
    if(Params::getParam('admin_theme') <> osc_get_preference('admin_theme', 'osclass')) {
      $dir = osc_base_path() . 'oc-admin/themes/' . Params::getParam('admin_theme');
      adt_remove_dir($dir);

      message_ok( __('Theme successfully removed', 'admin_themes') );
    }     
  }


  // UPLOAD & EXTRACT ZIP
  if(Params::getParam('file_upload') == 'done') {
    $message = '';
    $error = -1;

    if(isset($_FILES['theme']) && $_FILES['theme']['name'] <> ''){

      $upload_dir = osc_content_path() . 'downloads/oc-temp/';
      @mkdir($upload_dir);
      @chmod($upload_dir, 0755);


      $file_ext = pathinfo($_FILES['theme']['name'])['extension'];
      $file_name  = $_FILES['theme']['name'];
      $file_tmp   = $_FILES['theme']['tmp_name'];
      $file_type  = $_FILES['theme']['type'];   
      $extensions = array('zip');

      if(in_array($file_ext, $extensions) === false) {
        $message = __('extension not allowed, only allowed extension is .zip!', 'admin_themes');
        $error = 5;
      } else {
 
        $res = osc_unzip_file($file_tmp, osc_content_path() . 'downloads/oc-temp/');

        $flscheck = scandir(osc_content_path() . 'downloads/oc-temp/', GLOB_ONLYDIR);
        $cdir_name = $flscheck[0];

        if($cdir_name == '.' || $cdir_name == '..') {
          $cdir_name = $flscheck[1];
        }

        if($cdir_name == '.' || $cdir_name == '..') {
          $cdir_name = $flscheck[2];
        }

        $cinfo = adt_get_info(osc_content_path() . 'downloads/oc-temp/' . $cdir_name . '/index.php');
        $cpath = osc_content_path() . 'downloads/oc-temp/' . $cdir_name . '/appearance/add.php';


       
        if($cinfo['theme_type'] == 'oc-admin' || (file_exists($cpath) && $cdir_name == 'modern')) { 
        } else {
          $message = __('This is not valid oc-admin theme!', 'admin_themes');
          $error = 6;

          if($cinfo['theme_type'] <> 'oc-admin') {
            $message .= ' ' . __('Theme is missing theme type attribute: oc-admin in index.php', 'admin_themes');
          } else {
            $message .= ' ' . __('Theme is missing some core files, it is probably not theme for oc-admin.', 'admin_themes');
          }
        }


        if ($res == 1 && $error == -1) { // Everything is OK, continue
          /**********************
           ***** COPY FILES *****
           **********************/
          $fail = -1;
          if ($handle = opendir(osc_content_path() . 'downloads/oc-temp')) {
            $folder_dest  = ABS_PATH . 'oc-admin/themes/';

            if(function_exists('posix_getpwuid')) {
              $current_user = posix_getpwuid(posix_geteuid());
              $ownerFolder = posix_getpwuid(fileowner($folder_dest));
            }

            $fail = 0;
            while (false !== ($_file = readdir($handle))) {
              if ($_file != '.' && $_file != '..') {
                $copyprocess = osc_copy(osc_content_path() . "downloads/oc-temp/" . $_file, $folder_dest . $_file);
                if ($copyprocess == false) {
                  $fail = 1;
                };
              }
            }
            closedir($handle);

            // Additional actions is not important for the rest of the proccess
            // We will inform the user of the problems but the upgrade could continue
            // Also remove the zip package
            /****************************
             ** REMOVE TEMPORARY FILES **
             ****************************/
            @unlink(osc_content_path() . 'downloads/' . $file_name);
            $path = osc_content_path() . 'downloads/oc-temp';
            $rm_errors = 0;
            $dir = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($path), RecursiveIteratorIterator::CHILD_FIRST);
            for ($dir->rewind(); $dir->valid(); $dir->next()) {
              if ($dir->isDir()) {
                if ($dir->getFilename() != '.' && $dir->getFilename() != '..') {
                  if (!rmdir($dir->getPathname())) {
                    $rm_errors++;
                  }
                }
              } else {
                if (!unlink($dir->getPathname())) {
                  $rm_errors++;
                }
              }
            }

            if (!rmdir($path)) {
              $rm_errors++;
            }

            if ($fail == 0) { // Everything is OK, continue
              if ($rm_errors == 0) {
                $message = __('Everything looks good!', 'admin_themes');
                $error = 0;
              } else {
                $message = __('Nearly everything looks good! but there were some errors removing temporary files. Please manually remove the \"oc-content/downloads/oc-temp\" folder', 'admin_themes');
                $error = 6; // Some errors removing files
              }
            } else {
              $message = __('Problems when copying files. Please check your permissions. ', 'admin_themes');

              if($current_user['uid'] != $ownerFolder['uid']) {
                if(function_exists('posix_getgrgid') ) {
                  $current_group  = posix_getgrgid( $current_user['gid']);
                  $message .= '<p><strong>' . sprintf(__('NOTE: Web user and destination folder user is not the same, you might have an issue there. <br/>Do this in your console:<br/>chown -R %s:%s %s', 'admin_themes'), $current_user['name'], $current_group['name'], $folder_dest).'</strong></p>';
                }
              }
              $error = 4;  // Problems copying files. Maybe permissions are not correct
            }
          } else {
            $message = __('Nothing to copy', 'admin_themes'); // Should never happen
            $error = 99; 
          }
        } else if($error == -1) {
          $message = __('Unzip failed', 'admin_themes');
          $error = 3; 
        }
      }
    }

    if($error <= 0) {
      message_ok( __('Theme successfully uploaded', 'admin_themes') );
    } else {
      message_error(sprintf(__('There was problem: %s', 'admin_themes'), $message));
    }
  }

?>


<div class="mb-body">

  <div class="mb-notes">
    <div class="mb-line"><?php _e('Please note that plugin does not contain any backoffice theme itself, it is just manager for oc-admin themes. You may find oc-admin themes here:', 'admin_themes'); ?></div>
    <div class="mb-line"><a href="https://osclasspoint.com/osclass-themes/oc-admin">https://osclasspoint.com/osclass-themes/oc-admin</a></div>
  </div>

  <!-- CONFIGURE SECTION -->
  <div class="mb-box">
    <div class="mb-head"><i class="fa fa-wrench"></i> <?php _e('Available oc-admin themes', 'admin_themes'); ?></div>

    <div class="mb-inside mb-minify">
      <div class="mb-row mb-admin-themes">
        <?php foreach(adt_get_list() as $l) { ?>
          <?php 
            $info = adt_get_info(osc_base_path() . 'oc-admin/themes/' . $l . '/index.php');
            $path = osc_base_path() . 'oc-admin/themes/' . $l . '/';
            $url = osc_base_url() . 'oc-admin/themes/' . $l . '/';
          ?>

          <div class="mb-one">
            <div class="mb-img-wrap">
              <?php if(file_exists($path . 'preview.png')) { ?>
                <img src="<?php echo $url . 'preview.png'; ?>" />
              <?php } else { ?>
                <img src="<?php echo osc_base_url() . 'oc-content/plugins/admin_themes/img/preview_default.png'; ?>" />
              <?php } ?>

              <?php if($l == osc_get_preference('admin_theme', 'osclass')) { ?>
                <span class="mb-lab"><?php _e('Active theme', 'admin_themes'); ?></span>
              <?php } ?>
            </div>
              
            <div class="mb-theme-data">
              <strong class="mb-theme-title"><?php echo ucfirst($info['theme_name'] <> '' ? $info['theme_name'] : $l); ?><?php echo ($info['version'] <> '' ? ' ' . $info['version'] : ''); ?> <?php _e('by', 'admin_themes'); ?> <?php echo ($info['author'] <> '' ? $info['author'] : 'Osclass'); ?></strong>
              <div class="mb-theme-desc"><?php echo ($info['description'] <> '' ? $info['description'] : __('Default osclass oc-admin theme', 'admin_themes')); ?></div>
            </div>

            
            <div class="mb-theme-action<?php if($l == osc_get_preference('admin_theme', 'osclass') || adt_is_demo()) { ?> disabled<?php } ?>">
              <?php if($l == osc_get_preference('admin_theme', 'osclass') || adt_is_demo()) { ?>
                <a class="activate" href="#" onclick="return false" title="<?php echo osc_esc_html(__('This theme is already active', 'admin_themes')); ?>"><?php _e('Activate', 'admin_themes'); ?></a>

                <?php if($l != 'modern') { ?>
                  <a class="remove" style="float:right;" href="#" onclick="return false" title="<?php echo osc_esc_html(__('Theme cannot be active in order to remove it', 'admin_themes')); ?>"><?php _e('Remove', 'admin_themes'); ?></a>
                <?php } ?>
              <?php } else { ?>
                <a class="activate" href="<?php echo osc_admin_base_url(true) . '?page=plugins&action=renderplugin&file=admin_themes/admin/configure.php&update_theme=1&admin_theme=' . $l; ?>"><?php _e('Activate', 'admin_themes'); ?></a>

                <?php if($l != 'modern') { ?>
                  <a class="remove" onclick="return confirm('<?php echo osc_esc_js(__('Are you sure you want to remove this theme? Action cannot be undone!', 'admin_themes')); ?>');" style="float:right;" href="<?php echo osc_admin_base_url(true) . '?page=plugins&action=renderplugin&file=admin_themes/admin/configure.php&remove_theme=1&admin_theme=' . $l; ?>"><?php _e('Remove', 'admin_themes'); ?></a>
                <?php } ?>
              <?php } ?>
            </div>
          </div>
        <?php } ?>
      </div>
    </div>
  </div>


  <!-- UPLOAD SECTION -->
  <div class="mb-box">
    <div class="mb-head"><i class="fa fa-upload"></i> <?php _e('Upload new oc-admin theme', 'admin_themes'); ?></div>

    <div class="mb-inside mb-minify">
      <form name="promo_form" action="<?php echo osc_admin_base_url(true); ?>" method="POST" enctype="multipart/form-data" >
        <?php if(!adt_is_demo()) { ?>
        <input type="hidden" name="page" value="plugins" />
        <input type="hidden" name="action" value="renderplugin" />
        <input type="hidden" name="file" value="<?php echo osc_plugin_folder(__FILE__); ?>configure.php" />
        <input type="hidden" name="file_upload" value="done" />
        <?php } ?>

        <div class="mb-row">
          <label for="theme" class="h1"><span><?php _e('Upload theme', 'admin_themes'); ?></span></label> 

          <div class="mb-file">
            <label class="file-label">
              <span class="wrap"><i class="fa fa-paperclip"></i> <span><?php _e('Select theme archive', 'admin_themes'); ?></span></span>
              <input type="file" id="theme" name="theme" required />
            </label>

            <div class="file-text"><?php _e('Only .zip files are allowed!', 'admin_themes'); ?></div>
          </div>
        </div>
        

        <div class="mb-row">&nbsp;</div>

        <div class="mb-foot">
          <?php if(adt_is_demo()) { ?>
            <a class="mb-button mb-has-tooltip disabled" onclick="return false;" style="cursor:not-allowed;opacity:0.5;" title="<?php echo osc_esc_html(__('This is demo site', 'admin_themes')); ?>"><?php _e('Upload', 'admin_themes');?></a>
          <?php } else { ?>
            <button type="submit" class="mb-button"><?php _e('Upload', 'admin_themes');?></button>
          <?php } ?>
        </div>
      </form>
    </div>
  </div>
</div>

<?php echo adt_footer(); ?>