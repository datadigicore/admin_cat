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
      array( 'db' => 'master_kategori.nama_master', 'dt' => 5, 'field' => 'nama_master' ),
    );
    $join = "FROM {$table} INNER JOIN ujian ON ujian.id_ujian = master_peserta.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
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
      array( 'db' => 'nama_master',               'dt' => 5, 'field' => 'nama_master' ),
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
      array( 'db' => 'skor_total',   'dt' => 7 ),
    );
    $join = "FROM {$table} INNER JOIN generated_soal ON generated_soal.id_peserta = master_peserta.id_peserta INNER JOIN ujian ON ujian.id_ujian = master_peserta.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  default:
    $utility->location_goto(".");
  break;
}
?>
