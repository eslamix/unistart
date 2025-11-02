<?php

// REMOVE DIRE
function adt_remove_dir($dir) {
  if (is_dir($dir)) {
    $objects = scandir($dir);
    foreach ($objects as $object) {
      if ($object != "." && $object != "..") {
        if (filetype($dir."/".$object) == "dir") 
           adt_remove_dir($dir."/".$object); 
        else unlink   ($dir."/".$object);
      }
    }
    reset($objects);
    rmdir($dir);
  }
}


// GET PRODUCT INFO
function adt_get_info($path) {
  $info = array();
  @$s_info = file_get_contents($path);
  
  $url_var = explode('/' , $path);
  $plg = @$array[count($url_var)-2];
  

  if( preg_match('|Plugin Name:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['plugin_name'] = trim($match[1]);
  } else {
    $info['plugin_name'] = $plg;
  }

  if( preg_match('|Plugin URI:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['plugin_uri'] = trim($match[1]);
  } else {
    $info['plugin_uri'] = "";
  }

  if( preg_match('|Theme Name:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['theme_name'] = trim($match[1]);
  } else {
    $info['theme_name'] = $plg;
  }

  if( preg_match('|Theme Type:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['theme_type'] = trim($match[1]);
  } else {
    $info['theme_type'] = "";
  }

  if( preg_match('|Theme update URI:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['theme_update_uri'] = trim($match[1]);
  } else {
      $info['theme_update_uri'] = "";
  }

  if( preg_match('|Plugin update URI:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['plugin_update_uri'] = trim($match[1]);
  } else {
      $info['plugin_update_uri'] = "";
  }

  if( preg_match('|Support URI:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['support_uri'] = trim($match[1]);
  } else {
      $info['support_uri'] = "";
  }

  if( preg_match('|Description:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['description'] = trim($match[1]);
  } else {
    $info['description'] = "";
  }

  if( preg_match('|Version:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['version'] = trim($match[1]);
  } else {
    $info['version'] = "";
  }

  if( preg_match('|Author:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['author'] = trim($match[1]);
  } else {
    $info['author'] = "";
  }

  if( preg_match('|Author URI:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['author_uri'] = trim($match[1]);
  } else {
    $info['author_uri'] = "";
  }

  if( preg_match('|Short Name:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['short_name'] = trim($match[1]);
  } else {
    $info['short_name'] = $info['plugin_name'];
  }

  if( preg_match('|Product Key:([^\\r\\t\\n]*)|i', $s_info, $match) ) {
    $info['product_key'] = trim($match[1]);
  } else {
    $info['product_key'] = "";
  }

  $info['filename'] = $plg;

  return $info;
}


// GET LIST OF OC-ADMIN THEMES
function adt_get_list() {
  $directories = glob(osc_base_path() . 'oc-admin/themes/*' , GLOB_ONLYDIR);

  $output = array();
  foreach($directories as $d) {
    $output[] = basename($d);
  }

  return $output;
}



// CORE FUNCTIONS
function adt_param($name) {
  return osc_get_preference($name, 'plugin-admin_themes');
}


if(!function_exists('mb_param_update')) {
  function mb_param_update( $param_name, $update_param_name, $type = NULL, $plugin_var_name = NULL ) {
  
    $val = '';
    if( $type == 'check') {

      // Checkbox input
      if( Params::getParam( $param_name ) == 'on' ) {
        $val = 1;
      } else {
        if( Params::getParam( $update_param_name ) == 'done' ) {
          $val = 0;
        } else {
          $val = ( osc_get_preference( $param_name, $plugin_var_name ) != '' ) ? osc_get_preference( $param_name, $plugin_var_name ) : '';
        }
      }
    } else {

      // Other inputs (text, password, ...)
      if( Params::getParam( $update_param_name ) == 'done' && Params::existParam($param_name)) {
        $val = Params::getParam( $param_name );
      } else {
        $val = ( osc_get_preference( $param_name, $plugin_var_name) != '' ) ? osc_get_preference( $param_name, $plugin_var_name ) : '';
      }
    }


    // If save button was pressed, update param
    if( Params::getParam( $update_param_name ) == 'done' ) {

      if(osc_get_preference( $param_name, $plugin_var_name ) == '') {
        osc_set_preference( $param_name, $val, $plugin_var_name, 'STRING');  
      } else {
        $dao_preference = new Preference();
        $dao_preference->update( array( "s_value" => $val ), array( "s_section" => $plugin_var_name, "s_name" => $param_name ));
        osc_reset_preferences();
        unset($dao_preference);
      }
    }

    return $val;
  }
}


// CHECK IF RUNNING ON DEMO
function adt_is_demo() {
  if(osc_logged_admin_username() == 'admin') {
    return false;
  } else if(isset($_SERVER['HTTP_HOST']) && (strpos($_SERVER['HTTP_HOST'],'mb-themes') !== false || strpos($_SERVER['HTTP_HOST'],'abprofitrade') !== false)) {
    return true;
  } else {
    return false;
  }
}


if(!function_exists('message_ok')) {
  function message_ok( $text ) {
    $final  = '<div class="flashmessage flashmessage-ok flashmessage-inline">';
    $final .= $text;
    $final .= '</div>';
    echo $final;
  }
}


if(!function_exists('message_error')) {
  function message_error( $text ) {
    $final  = '<div class="flashmessage flashmessage-error flashmessage-inline">';
    $final .= $text;
    $final .= '</div>';
    echo $final;
  }
}



// COOKIES WORK
if(!function_exists('mb_set_cookie')) {
  function mb_set_cookie($name, $val) {
    Cookie::newInstance()->set_expires( 86400 * 30 );
    Cookie::newInstance()->push($name, $val);
    Cookie::newInstance()->set();
  }
}


if(!function_exists('mb_get_cookie')) {
  function mb_get_cookie($name) {
    return Cookie::newInstance()->get_value($name);
  }
}

if(!function_exists('mb_drop_cookie')) {
  function mb_drop_cookie($name) {
    Cookie::newInstance()->pop($name);
  }
}


if(!function_exists('mb_generate_rand_string')) {
  function mb_generate_rand_string($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';

    for ($i = 0; $i < $length; $i++) {
      $randomString .= $characters[rand(0, $charactersLength - 1)];
    }

    return $randomString;
  }
}


?>