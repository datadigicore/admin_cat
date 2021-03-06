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
require_once __DIR__ .'/../model/modelUjian.php';
require_once __DIR__ .'/../model/modelLogin.php';
require_once __DIR__ .'/../model/modelReport.php';
require_once __DIR__ .'/../model/modelRkakl.php';
require_once __DIR__ .'/../model/modelRab.php';

require_once __DIR__ .'/../model/modelLogUploadSoal.php';
require_once __DIR__ .'/../model/modelLogUploadPeserta.php';
require_once __DIR__ .'/../model/modelGeneratedSoal.php';
require_once __DIR__ .'/../model/modelMasterKategori.php';
require_once __DIR__ .'/../model/modelMasterPeserta.php';
require_once __DIR__ .'/../model/modelMasterSoal.php';
require_once __DIR__ .'/../model/modelDashboard.php';
// ====================================================

// ============== TAMBAHKAN CLASS DISINI ==============
$config      = new config();
$db          = new mysql_db();
$utility     = new utilityCode();
$datatable   = new datatable();
$login       = new modelLogin();
$pengguna    = new modelPengguna();
$ujian    = new modelUjian();
$report      = new modelReport();
$rkakl 	     = new modelRkakl();
$mdl_rab     = new modelRab();

$mdl_genSoal = new modelGeneratedSoal();
$mdl_upSoal = new modelLogUploadSoal();
$mdl_upPeserta = new modelLogUploadPeserta();
$mdl_masSoal = new modelMasterSoal();
$mdl_masPeserta = new modelMasterPeserta();
$mdl_masKategori = new modelMasterKategori();
$mdl_dashboard = new modelDashboard();
// ====================================================

$config_security = HTMLPurifier_Config::createDefault();
$config_security->set('URI.HostBlacklist', array('google.com'));
$purifier = new HTMLPurifier($config_security);

$cek  = $_SERVER['SCRIPT_NAME'];
$temp = explode('/', $cek);
$file = end($temp);
?>