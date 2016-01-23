<?php
error_reporting(E_ALL ^ (E_NOTICE | E_WARNING));
ob_clean();
date_default_timezone_set('Asia/Jakarta');
// ======== TAMBAHKAN UTILITY & LIBRARY DISINI ========
require_once __DIR__ .'/config.php';
require_once __DIR__ .'/../utility/database/mysql_db.php';
require_once __DIR__ .'/../utility/utilityCode.php';
require_once __DIR__ .'/../utility/datatable.php';
require_once __DIR__ .'/../library/security/HTMLPurifier.auto.php';
// ====================================================

// ============== TAMBAHKAN MODEL DISINI ==============
require_once __DIR__ .'/../model/modelPengguna.php';
require_once __DIR__ .'/../model/modelLogin.php';
require_once __DIR__ .'/../model/modelReport.php';
require_once __DIR__ .'/../model/modelRkakl.php';
require_once __DIR__ .'/../model/modelRab.php';
// ====================================================

// ============== TAMBAHKAN CLASS DISINI ==============
$config      = new config();
$db          = new mysql_db();
$utility     = new utilityCode();
$datatable   = new datatable();
$login       = new modelLogin();
$pengguna    = new modelPengguna();
$report      = new modelReport();
$rkakl 	     = new modelRkakl();
$mdl_rab     = new modelRab();
// ====================================================

$config_security = HTMLPurifier_Config::createDefault();
$config_security->set('URI.HostBlacklist', array('google.com'));
$purifier = new HTMLPurifier($config_security);

$cek  = $_SERVER['SCRIPT_NAME'];
$temp = explode('/', $cek);
$file = end($temp);
?>