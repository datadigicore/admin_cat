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
        case 'pdf_perorang':
        $id_peserta = $data[2];
        $ruang = str_replace("_", "/", $data[3]);
        // echo $ruangan; 
        exec("php -f ".$base_path."core/upload/make_pdf_perorang.php '$id_peserta' >$base_path"."log/pdf_perorang$id_peserta.txt &");
        echo("php -f ".$base_path."core/upload/make_pdf_perorang.php '$id_peserta' >$base_path"."log/pdf_perorangid_peserta.txt &");
        //exit();
        $_POST['ruang']=$ruang;
        $utility->load("content/file-perorangan","success","File Ujian Sedang Diproses");
       
        break;
        case 'countdown':
          $id_ujian = $data[2];
          $detil_ujian = explode("+", $data[3]);
          $mata_ujian = str_replace("%20", " ",$detil_ujian[0]);
          $tanggal_ujian = str_replace("%20", " ",$detil_ujian[1]);
          $durasi_ujian = str_replace("%20", " ",$detil_ujian[2]);
          // print_r($tanggal_ujian);
          // exit;
          $count = $ujian->get_countdown($id_ujian);
          include ('view/content/admin_countdown.php');
        break;
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
          // $pengguna->activity_log($_SESSION['username'], "Membuka Halaman Ujian");
          include ('view/content/ujian.php');
        break;
        case 'penjelasan':
        // echo "<pre>"; 
          $peserta = $data[2]."/".$data[3]."/".$data[4];
          // echo $peserta;
          $hasil = $ujian->penjelasan(trim($peserta));
          // print_r($hasil);
          include ('view/content/penjelasan.php');
        break;
        case 'hasil_ujian':
          // echo "<pre>";
          $id = $data[2];
          $id_ruangan = "D436/LePKom*";
          
          exec("php -f ".$base_path."core/upload/make_pdf.php '$id' '$id_ruangan' >$base_path"."log/pdf.txt &"); 
          
          $utility->load("content/ujian","success","File Ujian Sedang Diproses");
          // include ('view/content/ujian.php');
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
