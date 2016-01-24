<?php
include 'config/application.php';

$sess_id    = $_SESSION['id'];

switch ($process) {
  case 'table':
    $table = "master_peserta";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'id_peserta',   'dt' => 0 ),
      array( 'db' => 'no_peserta',   'dt' => 1 ),
      array( 'db' => 'nama',         'dt' => 2 ),
      array( 'db' => 'nama_lokasi',  'dt' => 3 ),
      array( 'db' => 'nama_ruangan', 'dt' => 4 ),
      array( 'db' => 'nama_master',  'dt' => 5 ),
    );
    $join = "INNER JOIN lokasi ON lokasi.id_lokasi = master_peserta.id_lokasi INNER JOIN ruangan ON ruangan.id_ruangan = master_peserta.id_ruangan INNER JOIN ujian ON ujian.id_ujian = master_peserta.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
    $datatable->get_table_more_join($table, $key, $column, $join, $where);
  break;
  case 'score':
    $table = "master_peserta";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'id_peserta',   'dt' => 0 ),
      array( 'db' => 'no_peserta',   'dt' => 1 ),
      array( 'db' => 'nama',         'dt' => 2 ),
      array( 'db' => 'nama_lokasi',  'dt' => 3 ),
      array( 'db' => 'nama_ruangan', 'dt' => 4 ),
      array( 'db' => 'nama_master',  'dt' => 5 ),
      array( 'db' => 'status_ujian_peserta', 'dt' => 6, 'formatter' => function($d,$row){ 
        if($d==1){
          return "<i>Sudah Verifikasi</i>";
        }
        if($d==2){
          return "<i>Sedang Ujian</i>";
        }
        if($d==3){
          return "<i>Selesai Ujian</i>";
        }
        else{
          return '<i>Persiapan Ujian</i>';
        }
      }),
      array( 'db' => 'skor_total',   'dt' => 7 ),
    );
    $join = "INNER JOIN lokasi ON lokasi.id_lokasi = master_peserta.id_lokasi INNER JOIN ruangan ON ruangan.id_ruangan = master_peserta.id_ruangan INNER JOIN ujian ON ujian.id_ujian = master_peserta.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
    $datatable->get_table_more_join($table, $key, $column, $join, $where);
  break;
  default:
    $utility->location_goto(".");
  break;
}
?>
