<?php
include 'config/application.php';

$sess_id    = $_SESSION['user_id'];
$data['id']   = $purifier->purify($_POST['id']);
$data['kategori']   = $purifier->purify($_POST['kategori']);
$data['tanggal']    = date("Y-m-d H:i:s", strtotime($_POST['tanggal']));
$data['lamaujian']  = $purifier->purify($_POST['lamaujian']);
$data['jmlsoal']    = $purifier->purify($_POST['jmlsoal']);
$data['jmlpaket']   = $purifier->purify($_POST['jmlpaket']);
$data['jmlpeserta'] = $purifier->purify($_POST['jmlpeserta']);

switch ($process) {
  case 'table':
    $table = "ujian";
    $key   = "id_ujian";
    $column = array(
      array( 'db' => 'id_ujian',       'dt' => 0 ),
      array( 'db' => 'nama_master',    'dt' => 1 ),
      array( 'db' => 'waktu_ujian',    'dt' => 2, 'formatter' => function( $d, $row ) {
        return date( 'd M Y', strtotime($d));
      }),
      array( 'db' => 'lama_ujian',     'dt' => 3, 'formatter' => function( $d, $row ) {
        return "$d &nbsp;Menit";
      }),
      array( 'db' => 'jumlah_soal',    'dt' => 4, 'formatter' => function( $d, $row ) {
        return "$d &nbsp;Soal";
      }),
      array( 'db' => 'jumlah_peserta', 'dt' => 5, 'formatter' => function( $d, $row ) {
        return "$d &nbsp;Peserta";
      }),
      array( 'db' => 'status_ujian',   'dt' => 6, 'formatter' => function($d,$row){ 
        if($d==0 && $row[status]==0){
          return "<small><i>Belum Aktif</i></small>";
        }
        if($d==0 && $row[status]==1){
          return "<button id='verifikasi' class='btn btn-flat btn-warning btn-xs'><i class='fa fa-check-circle'></i> Mulai Verifikasi</button>";
        }
        if($d==1 && $row[status]==1){
          return "<button id='mulai' class='btn btn-flat btn-success btn-xs'><i class='fa fa-check-circle'></i> Mulai Ujian</button>";
        }
        if($d==2 && $row[status]==1){
          return "<button id='selesai' class='btn btn-flat btn-danger btn-xs'><i class='fa fa-check-circle'></i> Selesaikan Ujian</button>";
        }
        else{
          return '<small><i>Telah Dilaksanakan</i></small>';
        }
      }),
      array( 'db' => 'status',         'dt' => 7, 'formatter' => function($d,$row){ 
        if($d==0 && $row[status_ujian]==0){
          return "<button id='acak' class='btn btn-flat btn-success btn-xs'><i class='fa fa-random'></i> Mulai Acak Soal</button>";
        }
        if($d==1 && $row[status_ujian]==0){
          return "<small><i>Berlangsung</i></small>";
        }
        if($d==1 && $row[status_ujian]==1){
          return "<small><i>Berlangsung</i></small>";
        }
        if($d==1 && $row[status_ujian]==2){
          return "<small><i>Berlangsung</i></small>";
        }
        else{
          return "<small><i>Selesai</i></small>";
        }
      })
    );
    $tableJoin = "master_kategori";
    $joinWhere = "ujian.id_kategori = master_kategori.id_master";
    $datatable->get_table_join($table, $key, $column, $tableJoin, $joinWhere, $where);
  break;
  case 'download-lantai':
    $ruangan=$_POST['ruang'];
  break;
  // case 'download-ruangan':
  //   $ruangan=$_POST['ruang'];
  //   $substr_ruangan = substr($ruangan,0,4);
  //   $op = shell_exec ( "ls ".$ujian_path."logs/hasil/all/ | grep '$substr_ruangan*'" );
  //   //echo $op;
  //   //echo "ls ".$ujian_path."logs/hasil/all/ | grep '$substr_ruangan*'";
  //   $file = $ujian_path."logs/hasil/all/".trim($op," \t\n\r\0\x0B");
  //   //echo "$op";
  //   //exit();
  //   if (file_exists($file) && is_file($file)) {

  //     $namafile_web="{$domain}/logs/hasil/all/$op";  
  //    // echo "$namafile_web";
  //    header("Location: $namafile_web");
  //    //echo "<script>window.location.href='$namafile_web';</script>";
  //   /*header('Content-Description: File Transfer');
  //   header('Content-Type: application/octet-stream');
  //   header('Content-Disposition: attachment; filename="'.basename($file).'"');
  //   header('Expires: 0');
  //   header('Cache-Control: must-revalidate');
  //   header('Pragma: public');
  //   header('Content-Length: ' . filesize($file));
  //   readfile($file);*/
  // //  exit;
  //   }else{
  //     $utility->load("content/file-ruangan","warning","File tidak tersedia");
  //   }
  //   echo file_get_contents($ujian_path."/logs/hasil/".$op);
  // break;

case 'download-ruangan':
    $ruangan=$_POST['ruang'];
    $nama=str_replace(" ", "_", $_POST['nama']);
    $substr_ruangan = str_replace("/","_",$ruangan);

    $op = shell_exec( "ls ".$ujian_path."logs/hasil/all/ | grep  '$substr_ruangan.*\.pdf$'" );
    // echo "ls ".$ujian_path."logs/hasil/ | grep '$substr_ruangan-$nama.*\.pdf$'";
    $file = $ujian_path."logs/hasil/all/".trim($op," \t\n\r\0\x0B");
    //echo $file;
    $nama_file=explode("/",$file);
    $file2=end($nama_file);
    if (file_exists($file) && is_file($file)) {
    /*header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="'.basename($file).'"');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($file));
    readfile($file);*/
    $namafile_web="$domain"."/logs/hasil/all/$file2";
    echo "<script>window.location.href='$namafile_web';</script>";
    exit;
    }else{
      $utility->load("content/file-perorangan","warning","File tidak tersedia",$ruangan);
    }
    echo file_get_contents($ujian_path."logs/hasil/".$op);
  break;


  case 'download-perorangan':
    $ruangan=$_POST['ruang'];
    $nrp=str_replace(" ", "_", $_POST['nrp']);
    $substr_ruangan = str_replace("/","_",$ruangan);
    $ruang_dan_nrp = $substr_ruangan."-".$nrp; 
    $op = shell_exec( "ls ".$ujian_path."logs/hasil/ | grep  '$ruang_dan_nrp.*\.pdf$'" );
    // echo "ls ".$ujian_path."logs/hasil/ | grep '$substr_ruangan-$nama.*\.pdf$'";
    $file = $ujian_path."logs/hasil/".trim($op," \t\n\r\0\x0B");
    // echo $file;
    // exit;
    $nama_file=explode("/",$file);
    $file2=end($nama_file);
    echo $file2;
    // exit;
    if (file_exists($file) && is_file($file)) {
     $namafile_web="$domain"."/logs/hasil/$file2";
      echo "<script>window.location.href='$namafile_web';</script>";
      exit;
    }else{
      $utility->load("content/file-perorangan","warning","File tidak tersedia",$ruangan);
    }
    echo file_get_contents($ujian_path."logs/hasil/".$op);
  break;

  case 'truncate':
    $ujian->truncateUjian($data);
    $utility->load("content/ujian","success","Data berhasil ditambahkan");
  break;
  case 'randomize':
    $utility->load("content/acaksoal/".$data['id'],"","load");
  break;
  case 'activate':
    $id = $_POST['key'];
    $ujian->activateUjian($id);
  break;
  case 'activatePaket':
    $data['id'] = $_POST['id'];
    $data['paket'] = $_POST['paket'];
    $ujian->activatePaketUjian($data);
  break;
  case 'verification':
    $id = $_POST['key'];
    $ujian->verifikasiUjian($id);
  break;
  case 'start':
    $id = $_POST['key'];
    $ujian->updateTime($id);
    $ujian->mulaiUjian($id);
  break;
  case 'finish':
    $id = $_POST['key'];
    $ujian->selesaiUjian($id);
  break;
  case 'kategori':
    $ujian->kategori();
  break;
  default:
    $utility->location_goto(".");
  break;
}
?>
