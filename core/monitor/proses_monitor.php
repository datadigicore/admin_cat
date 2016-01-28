<?php
include 'config/application.php';

$sess_id    = $_SESSION['id'];

switch ($process) {
  case 'table':
    $table = "generated_soal";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'generated_soal.id',           'dt' => 0, 'field' => 'id' ),
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
      $where = "id_lokasi = '$_SESSION[lokasi]' && ujian.status = 1";
    }
    elseif($_SESSION['level']==3){
      $where = "id_lokasi = '$_SESSION[lokasi]' && id_ruangan = '$_SESSION[ruangan]' && ujian.status = 1";
    }
    else{
      $where = "ujian.status = 1";
    }
    $join = "FROM {$table} INNER JOIN master_peserta ON generated_soal.id_peserta = master_peserta.id_peserta INNER JOIN ujian ON ujian.id_ujian = generated_soal.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'score':
    $table = "generated_soal";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'generated_soal.id',  'dt' => 0, 'field' => 'id' ),
      array( 'db' => 'no_peserta',         'dt' => 1, 'field' => 'no_peserta' ),
      array( 'db' => 'nama',               'dt' => 2, 'field' => 'nama' ),
      array( 'db' => 'id_lokasi',          'dt' => 3, 'field' => 'id_lokasi' ),
      array( 'db' => 'id_ruangan',         'dt' => 4, 'field' => 'id_ruangan' ),
      array( 'db' => 'nama_master',        'dt' => 5, 'field' => 'nama_master', 'formatter' => function($d,$row){ 
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
      array( 'db' => 'nilai',   'dt' => 7, 'field' => 'nilai' ),
    );
    if($_SESSION['level']==2){
      $where = "id_lokasi = '".$_SESSION['lokasi']."'";
    }
    elseif($_SESSION['level']==3){
      $where = "id_lokasi = '$_SESSION[lokasi]' && id_ruangan = '$_SESSION[ruangan]' && ujian.status = 1";
    }
    else{
      $where = "ujian.status = 1";
    }
    $join = "FROM {$table} INNER JOIN master_peserta ON generated_soal.id_peserta = master_peserta.id_peserta INNER JOIN ujian ON ujian.id_ujian = generated_soal.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'ruangan':
    $table = "master_peserta";
    $key   = "id_ruangan";
    $column = array(
      array( 'db' => 'id_ruangan',  'dt' => 0, 'field' => 'id_ruangan' ),
      array( 'db' => 'id_ruangan',       'dt' => 1, 'field' => 'id_ruangan', 'formatter' => function($d,$row){ 
      return '<div class="text-center"><table align="center"><tr class="text-center"><td><div class="btn-group" role="group" aria-label="Basic example"><button id="create" class="btn btn-primary" value="'.$d.'"> Buat PDF</button></td><td><form method="post" action="../process/hasil/download-ruangan"><button id="download" class="btn btn-primary" name="ruang" value="'.$d.'"> Download</button></form></td><td><form method="post" action="../content/file-perorangan"><button id="perorangan" name="ruang" class="btn btn-primary" value="'.$d.'"> File Perorang</button></div></form></td></tr></table></div>';
        
      })
    );
    if($_SESSION['level']==2){
      $where = "id_lokasi = '".$_SESSION['lokasi']."'";
    }
    $join = "FROM {$table} inner join generated_soal on master_peserta.id_peserta = generated_soal.id_peserta inner join ujian on generated_soal.id_ujian = ujian.id_ujian where ujian.status_ujian=3 group by id_ruangan";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'perorang':
    $ruang=$_POST['ruang'];
    $table = "master_peserta";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'nama',  'dt' => 0, 'field' => 'nama' ),
      array( 'db' => 'no_peserta',  'dt' => 1, 'field' => 'no_peserta' ),
      array( 'db' => 'id_ruangan',  'dt' => 2, 'field' => 'id_ruangan' ),
      array( 'db' => 'master_peserta.id_peserta',       'dt' => 3, 'field' => 'id_peserta', 'formatter' => function($d,$row){ 
      return '<div class="text-center"><div class="btn-group" role="group" aria-label="Basic example"><button id="create" class="btn btn-primary" value="'.$d.'" style="display:none"> Buat PDF</button><form method="post" action="../process/hasil/download-perorangan" id="download-perorangan-'.$row[1].'" name="download-perorangan"><input type="hidden" name="nama" value="'.$row[0].'"><button id="download" class="btn btn-primary" name="ruang" value="'.$row[2].'"> Download</button></form></div></div>';
        
      })
    );
    if($_SESSION['level']==2){
      $where = "id_lokasi = '".$_SESSION['lokasi']."'";
    }
    $join = "FROM {$table} inner join generated_soal on master_peserta.id_peserta = generated_soal.id_peserta inner join ujian on generated_soal.id_ujian = ujian.id_ujian";
    $where = "id_ruangan = '$ruang' and ujian.status_ujian=3";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'nilai-chart':
    $nilai = $_POST['nilai'];
    $table = "generated_soal";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'master_peserta.id_peserta', 'dt' => 0, 'field' => 'id_peserta' ),
      array( 'db' => 'no_peserta',                'dt' => 1, 'field' => 'no_peserta' ),
      array( 'db' => 'nama',                      'dt' => 2, 'field' => 'nama' ),
      array( 'db' => 'id_lokasi',                 'dt' => 3, 'field' => 'id_lokasi' ),
      array( 'db' => 'id_ruangan',                'dt' => 4, 'field' => 'id_ruangan' ),
      
    );
    if($_SESSION['level']==2){
      $where = "id_lokasi = '".$_SESSION['lokasi']."' and";
    }
    
    $join = "FROM {$table} INNER JOIN master_peserta ON generated_soal.id_peserta = master_peserta.id_peserta INNER JOIN ujian ON ujian.id_ujian = generated_soal.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
    $where = "skor_total = '$nilai'";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'kesatuan-chart':
    $kesatuan = $_POST['kesatuan'];
    $table = "generated_soal";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'master_peserta.id_peserta', 'dt' => 0, 'field' => 'id_peserta' ),
      array( 'db' => 'no_peserta',                'dt' => 1, 'field' => 'no_peserta' ),
      array( 'db' => 'nama',                      'dt' => 2, 'field' => 'nama' ),
      array( 'db' => 'id_lokasi',                 'dt' => 3, 'field' => 'id_lokasi' ),
      array( 'db' => 'id_ruangan',                'dt' => 4, 'field' => 'id_ruangan' ),
      
    );
    if($_SESSION['level']==2){
      $where = "id_lokasi = '".$_SESSION['lokasi']."' and";
    }
    
    $join = "FROM {$table} INNER JOIN master_peserta ON generated_soal.id_peserta = master_peserta.id_peserta INNER JOIN ujian ON ujian.id_ujian = generated_soal.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
    $where = "kesatuan = '$kesatuan'";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'status-chart':
    $status = $_POST['status'];
    $table = "generated_soal";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'master_peserta.id_peserta', 'dt' => 0, 'field' => 'id_peserta' ),
      array( 'db' => 'no_peserta',                'dt' => 1, 'field' => 'no_peserta' ),
      array( 'db' => 'nama',                      'dt' => 2, 'field' => 'nama' ),
      array( 'db' => 'id_lokasi',                 'dt' => 3, 'field' => 'id_lokasi' ),
      array( 'db' => 'id_ruangan',                'dt' => 4, 'field' => 'id_ruangan' ),
      
    );
    if($_SESSION['level']==2){
      $where = "id_lokasi = '".$_SESSION['lokasi']."' and";
    }
    
    $join = "FROM {$table} INNER JOIN master_peserta ON generated_soal.id_peserta = master_peserta.id_peserta INNER JOIN ujian ON ujian.id_ujian = generated_soal.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
    $where = "generated_soal.status = '$status'";
    if($status == 4){
      $where .= "or generated_soal.status = '5'";
    } else if($status == 5){
      $where .= "or generated_soal.status = '4'";
    }
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'gender-chart':
    $jenkel = $_POST['jenkel'];
    $table = "master_peserta";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'master_peserta.id_peserta', 'dt' => 0, 'field' => 'id_peserta' ),
      array( 'db' => 'no_peserta',                'dt' => 1, 'field' => 'no_peserta' ),
      array( 'db' => 'nama',                      'dt' => 2, 'field' => 'nama' ),
      array( 'db' => 'id_lokasi',                 'dt' => 3, 'field' => 'id_lokasi' ),
      array( 'db' => 'id_ruangan',                'dt' => 4, 'field' => 'id_ruangan' ),
      
    );
    if($_SESSION['level']==2){
      $where = "id_lokasi = '".$_SESSION['lokasi']."' and";
    }
    
    $join = "FROM {$table}";
    $where = "jenkel = '$jenkel'";
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
    $utility->load("content/monitor","success","Ujian Peserta Berhasil di Revisi");
  break;
  default:
    $utility->location_goto(".");
  break;
}
?>
