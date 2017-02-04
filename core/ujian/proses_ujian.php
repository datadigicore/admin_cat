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
          return "<small><i>Berlangsung</i></small>".'
                 <div><a href="'.$url_rewrite.'countdown/'.$row[0].'" class="btn btn-primary btn-xs btn-block" btn-block role="button">Live Countdown</a></div>';
        }
        else{
          return  '<form method="POST" action="../content/monitor-nilai">'.
                  '<div class="text-center">'.
                    '<input type="hidden" name="kategori" value="'.$row[1].'">'.
                    '<button class="btn btn-flat btn-primary btn-xs" type="submit"><i class="fa fa-file-text-o"></i> &nbsp;Hasil Ujian</button>'.
                  '</div>'.
                  '</form>';
        }
      }),
      array( 'db' => 'status_pdf',         'dt' => 8, 'formatter' => function($d,$row){ 
        if($row[status_ujian]!=3){
          return "";
        }
        if($d==0){
          return '<a href="'.$url_rewrite.'hasil_ujian/'.$row[0].'" class="btn btn-primary btn-block btn-xs" role="button">Buat PDF</a>';
        }
        if($d==1){
          return "<small><i>Sedang Memproses</i></small>";
        }
        if($d==2){
          return '<a href="'.$url_rewrite.'file-ruangan" class="btn btn-success btn-block btn-xs">Download File</a>'.'<div><a href="'.$url_rewrite.'hasil_ujian/'.$row[0].'" class="btn btn-primary btn-block btn-xs" role="button">Buat Ulang</a>';
        }
        else{
          return  '';
        }
      })
    );
    $tableJoin = "master_kategori";
    $joinWhere = "ujian.id_kategori = master_kategori.id_master";
    $datatable->get_table_join($table, $key, $column, $tableJoin, $joinWhere, $where);
  break;
  case 'add':
    $ujian->insertUjian($data);
    $utility->load("content/ujian","success","Data berhasil ditambahkan");
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
  case 'activateRandom':
    $data['id'] = $_POST['id'];
    $data['paket'] = substr($_POST['paket'], -1);
    $ujian->activateUjian($data['id']);
    $ujian->activatePaketUjian($data);
    $url = $link_generate_soal.$data['id'];
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    $str = curl_exec($curl);
    curl_close($curl);
    if ($str == 1) {
      $utility->load("content/ujian","success","Soal berhasil diacak");
    }
    else {
    }
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