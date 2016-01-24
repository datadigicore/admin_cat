<?php
require_once './config/application.php';
$path = ltrim($_SERVER['REQUEST_URI'], '/');
$temp_path = explode($REQUEST, $path);
$elements = explode('/', $temp_path[1]);
$data = array_filter($elements);
if (count($data) == 0) {
  include "./index.php";
}
else {

  if (!isset($_SESSION['username'])) {
    $utility->location_goto(".");
  }
  else {
    include ('view/include/meta.php');
    include ('view/include/javascript.php');
    include ('view/include/header.php');
    include ('view/include/sidebar.php');
    if ($_SESSION['level'] == 1) {  
      switch ($data[1]) {
        case 'user':
          include ('view/content/pengguna.php');
        break;
        case 'adduser':
          include ('view/content/pengguna-add.php');
        break;
        
        case 'ujian':
          include ('view/content/ujian.php');
        break;
        case 'upload-soal':
          include ('view/content/upload_soal.php');
        break;
        case 'acaksoal':
          if ($_POST['message'] == "load") {
            include ('view/content/randomise-soal.php');
          }
          else{
            include ('view/content/home.php');
          }
        break;
        case 'upload-peserta':
          include ('view/content/upload_peserta.php');
        break;
        case 'data-peserta':
          include ('view/content/data_peserta.php');
        break;
        case 'monitor':
          include ('view/content/monitor.php');
        break;
        default:
          include ('view/content/home.php');
        break;
      }
    }
    else if($_SESSION['level'] == 2){
      switch ($data[1]) {
        case 'user':
          include ('view/content/pengguna-lokasi.php');
        break;
        case 'monitor':
          include ('view/content/monitor-lokasi.php');
        break;
      case 'adduser':
          include ('view/content/pengguna-add-lokasi.php');
        break;
        default:
          include ('view/content/home.php');
        break;
      }
    }
    else {
      switch ($data[1]) {
        case 'table':
          include ('view/content/table.php');
        break;
        case 'rab':
          if($data[2]=='add'){
            include ('view/content/rab-add.php');
          } else if($data[2]=='add-rincian'){
            include ('view/content/rab-add-rincian.php');
          } else {
            $direktorat = $_SESSION['direktorat'];
            $program = $mdl_rab->getProg();
            include ('view/content/rab.php');
          }
        break;
        case 'rabdetail':
          if($data[2]=='akun'){
            include ('view/content/rab-add.php');
          }else{
            $id_rab_view = $data[2];
            include ('view/content/rabdetail.php');
          }
          break;
        case 'rabakun':
          include ('view/content/rab-add.php');
          break;
        default:
          include ('view/content/home.php');
        break;
      }
    }
    include ('view/include/footer.php');
  }
}
?>
