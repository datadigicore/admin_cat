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
        case 'log':
          include ('view/content/log.php');
        break;
        case 'user':
          include ('view/content/pengguna.php');
        break;
        case 'adduser':
          include ('view/content/pengguna-add.php');
        break;
        case 'addpeserta':
          include ('view/content/peserta-add.php');
        break;
        case 'ujian':
          include ('view/content/ujian.php');
        break;
        case 'upload-soal':
          include ('view/content/upload_soal.php');
        break;
        case 'soal':
          include ('view/content/soal.php');
        break;
        case 'viewsoal':
          if (isset($_POST['idsoal'])) {
            $id_soal = $_POST['idsoal'];
            include ('view/content/soal-revisi.php');
          }
          else{
            include ('view/content/home.php');
          }
        break;
        case 'acaksoal':
          if ($_POST['message'] == "load") {
            $paket = $ujian->getJmlPaket($data[2]);
            include ('view/content/randomise-soal.php');
          }
          else{
            include ('view/content/home.php');
          }
        break;
        case 'file-ruang':
          if (isset($_POST['id_lokasi'])) {
            $lokasi = $_POST['id_lokasi'];
            include ('view/content/monitor-file-ruang.php');
          }
          else{
            include ('view/content/monitor-file-ruang.php');
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
        case 'monitor-nilai':
          if (isset($_POST['kategori'])) {
            $kategori = $_POST['kategori'];
            include ('view/content/monitor-nilai-revisi.php');
          }
          else{
            include ('view/content/home.php');
          }
        break;
        case 'file-ruangan':

          include ('view/content/file-ruangan.php');
        break;
        case 'file-perorangan':
        if(isset($_POST['postdata'])){
          $ruang=$_POST['postdata'];
        } else {
          $ruang=$_POST['ruang'];
        }
        include ('view/content/file-perorangan.php');
        break;
        case 'monitor-file':
          include ('view/content/monitor-file.php');
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
          include ('view/content/monitor.php');
        break;
        case 'file-ruangan':
          include ('view/content/file-ruangan.php');
        break;
        case 'file-perorangan':
        if(isset($_POST['postdata'])){
          $ruang=$_POST['postdata'];
        } else {
          $ruang=$_POST['ruang'];
        }
          include ('view/content/file-perorangan.php');
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
        case 'monitor':
          include ('view/content/monitor.php');
        break;
        case 'file-ruangan':
          include ('view/content/file-ruangan.php');
        break;
        case 'file-perorangan':
          if(isset($_POST['postdata'])){
          $ruang=$_POST['postdata'];
        } else {
          $ruang=$_POST['ruang'];
        }
          include ('view/content/file-perorangan.php');
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
