<?php
include 'config/application.php';

$sess_id    = $_SESSION['id'];

switch ($process) {
  case 'table':
    $table = "master_peserta";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'master_peserta.id_peserta',   'dt' => 0, 'field' => 'id_peserta' ),
      array( 'db' => 'no_peserta',                  'dt' => 1, 'field' => 'no_peserta' ),
      array( 'db' => 'nama',                        'dt' => 2, 'field' => 'nama' ),
      array( 'db' => 'id_lokasi',                   'dt' => 3, 'field' => 'id_lokasi' ),
      array( 'db' => 'id_ruangan',                  'dt' => 4, 'field' => 'id_ruangan' ),
      array( 'db' => 'master_kategori.nama_master', 'dt' => 5, 'field' => 'nama_master', 'formatter' => function($d,$row){ 
          return "<small><i>{$d}</i></small>";
      }),
      array( 'db' => 'generated_soal.status',       'dt' => 6, 'field' => 'status', 'formatter' => function($d,$row){ 
        if ($d==4) {
          return '<div class="text-center"><button id="revisi" class="btn btn-flat btn-success btn-xs"><i class="fa fa-undo"></i> &nbsp;&nbsp;Revisi&nbsp;&nbsp;&nbsp;</button></div>';
        }
        if ($d==3) {
          return '<div class="text-center"><i>Ujian Selesai</i></div>';
        }
        if ($d==5) {
          return '<div class="text-center"><i>Telah Direvisi</i></div>';
        }
        else {
          return '<div class="text-center"><button id="suspend" class="btn btn-flat btn-danger btn-xs"><i class="fa fa-warning"></i> Suspend</button></div>';
        }
      })
    );
    if($_SESSION['level']==2){
      $where = "id_lokasi = '".$_SESSION['lokasi']."'";
    }
    
    $join = "FROM {$table} INNER JOIN generated_soal ON generated_soal.id_peserta = master_peserta.id_peserta INNER JOIN ujian ON ujian.id_ujian = master_peserta.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'score':
    $table = "master_peserta";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'master_peserta.id_peserta', 'dt' => 0, 'field' => 'id_peserta' ),
      array( 'db' => 'no_peserta',                'dt' => 1, 'field' => 'no_peserta' ),
      array( 'db' => 'nama',                      'dt' => 2, 'field' => 'nama' ),
      array( 'db' => 'id_lokasi',                 'dt' => 3, 'field' => 'id_lokasi' ),
      array( 'db' => 'id_ruangan',                'dt' => 4, 'field' => 'id_ruangan' ),
      array( 'db' => 'nama_master',               'dt' => 5, 'field' => 'nama_master', 'formatter' => function($d,$row){ 
          return "<small><i>{$d}</i></small>";
      }),
      array( 'db' => 'generated_soal.status',     'dt' => 6, 'field' => 'status', 'formatter' => function($d,$row){ 
        if($d==1){
          return "<i>Sudah Verifikasi</i>";
        }
        if($d==2){
          return "<i>Sedang Ujian</i>";
        }
        if($d==3){
          return "<i>Selesai Ujian</i>";
        }
        if($d==4){
          return "<i>Sedang Suspend</i>";
        }
        else{
          return '<i>Persiapan Ujian</i>';
        }
      }),
      array( 'db' => 'skor_total',   'dt' => 7, 'field' => 'skor_total' ),
    );
    if($_SESSION['level']==2){
      $where = "id_lokasi = '".$_SESSION['lokasi']."'";
    }
    
    $join = "FROM {$table} INNER JOIN generated_soal ON generated_soal.id_peserta = master_peserta.id_peserta INNER JOIN ujian ON ujian.id_ujian = master_peserta.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'suspend':
    $data['id'] = $purifier->purify($_POST['key']);
    $result = $pengguna->readTimePeserta($data['id']);
    $timeserver = strtotime($result->waktu_mulai);
    $timenow = strtotime(date("Y-m-d H:i:s", time()));
    $newtime = ($timenow - $timeserver)/60;
    $data['newdurasi'] = $result->durasi_pengerjaan - round($newtime);
    $pengguna->suspendPengguna($data);
  break;
  case 'revisi':
    $data['id'] = $purifier->purify($_POST['key']);
    $tambahwaktu = $purifier->purify($_POST['tambahwaktu']);
    $result = $pengguna->readTimePeserta($data['id']);
    $timeserver = strtotime($result->waktu_mulai);
    $timenow = strtotime(date("Y-m-d H:i:s", time()));
    $newtime = ($timenow - $timeserver)/60;
    $data['newtambahwaktu'] = $tambahwaktu + round($newtime);
    $pengguna->revisiPengguna($data);
  break;
  default:
    $utility->location_goto(".");
  break;
}
?>
