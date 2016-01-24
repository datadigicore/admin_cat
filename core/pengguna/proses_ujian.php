<?php
include 'config/application.php';

$sess_id    = $_SESSION['user_id'];
$data['kategori']   = $purifier->purify($_POST['kategori']);
$data['paket']      = $purifier->purify($_POST['paket']);
$data['tanggal']    = $_POST['tanggal'];
$data['lamaujian']  = $purifier->purify($_POST['lamaujian']);
$data['jmlsoal']    = $purifier->purify($_POST['jmlsoal']);
$data['jmlpeserta'] = $purifier->purify($_POST['jmlpeserta']);

switch ($process) {
  case 'table':
    $table = "ujian";
    $key   = "id_ujian";
    $column = array(
      array( 'db' => 'id_ujian',       'dt' => 0 ),
      array( 'db' => 'nama_master',    'dt' => 1 ),
      array( 'db' => 'pilihan_paket',  'dt' => 2, 'formatter' => function($d,$row){ 
        if($d==1){
          return "<i>Paket A</i>";
        }
        if($d==2){
          return "<i>Paket B</i>";
        }
        if($d==3){
          return "<i>Paket C</i>";
        }
        else{
          return "<i>Paket D</i>";
        }
      }),
      array( 'db' => 'waktu_ujian',    'dt' => 3 ),
      array( 'db' => 'lama_ujian',     'dt' => 4 ),
      array( 'db' => 'jumlah_soal',    'dt' => 5 ),
      array( 'db' => 'jumlah_peserta', 'dt' => 6 ),
      array( 'db' => 'status_ujian',   'dt' => 7, 'formatter' => function($d,$row){ 
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
      array( 'db' => 'status',         'dt' => 8, 'formatter' => function($d,$row){ 
        if($d==0 && $row[status_ujian]==0){
          return "<button id='aktif' class='btn btn-flat btn-success btn-xs'><i class='fa fa-check-circle'></i> Aktifkan</button>";
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
  case 'add':
    // $ujian->clearStatus();
    $ujian->insertUjian($data);
    $utility->load("content/ujian","success","Data berhasil ditambahkan");
  break;
  case 'edt':
    $ujian->updateUjian($data);
    $utility->location_goto("content/setting");
  break;
  case 'del':
    $ujian->deleteUjian($hapus);
    $utility->location_goto("content/setting");
  break;
  case 'activate':
    $id = $_POST['key'];
    $ujian->activateUjian($id);
  break;
  case 'verification':
    $id = $_POST['key'];
    $ujian->verifikasiUjian($id);
  break;
  case 'start':
    $id = $_POST['key'];
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
