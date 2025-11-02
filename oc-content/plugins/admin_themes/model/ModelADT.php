<?php
class ModelADT extends DAO {
private static $instance;

public static function newInstance() {
  if( !self::$instance instanceof self ) {
    self::$instance = new self;
  }
  return self::$instance;
}

function __construct() {
  parent::__construct();
}


public function getTable_country() {
  return DB_TABLE_PREFIX.'t_country';
}


public function import($file) {
  $path = osc_plugin_resource($file);
  $sql = file_get_contents($path);

  if(!$this->dao->importSQL($sql) ){
    throw new Exception("Error importSQL::ModelOSM<br>" . $file . "<br>" . $this->dao->getErrorLevel() . " - " . $this->dao->getErrorDesc() );
  }
}


public function install($version = '') {
  if($version == '') {
    //$this->import('admin_themes/model/struct.sql');

    osc_set_preference('version', 100, 'plugin-admin_themes', 'INTEGER');
  }
}


public function uninstall() {
  // DELETE ALL TABLES
  //$this->dao->query(sprintf('DROP TABLE %s', $this->getTable_user_ggl()));


  // DELETE ALL PREFERENCES
  $db_prefix = DB_TABLE_PREFIX;
  $query = "DELETE FROM {$db_prefix}t_preference WHERE s_section = 'plugin-admin_themes'";
  $this->dao->query($query);
}

}
?>