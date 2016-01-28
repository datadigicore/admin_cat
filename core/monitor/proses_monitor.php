<?php
include 'config/application.php';

$sess_id    = $_SESSION['id'];

switch ($process) {
    case 'log':
    $kategori = $_POST['kategori'];
    $table = "log_penambahan_waktu";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'log_penambahan_waktu.id_log', 'dt' => 0, 'field' => 'id_log' ),
      array( 'db' => 'no_peserta',                  'dt' => 1, 'field' => 'no_peserta' ),
      array( 'db' => 'nama',                        'dt' => 2, 'field' => 'nama' ),
      array( 'db' => 'id_lokasi',                   'dt' => 3, 'field' => 'id_lokasi' ),
      array( 'db' => 'id_ruangan',                  'dt' => 4, 'field' => 'id_ruangan' ),
      array( 'db' => 'log_penambahan_waktu.tambahan_waktu', 'dt' => 5, 'field' => 'tambahan_waktu', 'formatter' => function($d,$row){ 
          return "<small><i>{$d} Menit</i></small>";
      }),
      array( 'db' => 'log_penambahan_waktu.alasan', 'dt' => 6, 'field' => 'alasan' ),
      array( 'db' => 'master_kategori.nama_master', 'dt' => 7, 'field' => 'nama_master', 'formatter' => function($d,$row){ 
          return "<small><i>{$d}</i></small>";
      }),
      array( 'db' => 'log_penambahan_waktu.status',       'dt' => 8, 'field' => 'status', 'formatter' => function($d,$row){ 
        if ($d==5) {
          return '<i>Telah Direvisi</i>';
        }
      })
    );
    if($_SESSION['level']==2){
      $where = "id_lokasi = '$_SESSION[lokasi]' && master_kategori.nama_master = '$kategori'";
    }
    elseif($_SESSION['level']==3){
      $where = "id_lokasi = '$_SESSION[lokasi]' && id_ruangan = '$_SESSION[ruangan]' && master_kategori.nama_master = '$kategori'";
    }
    else{
      $where = "master_kategori.nama_master = '$kategori'";
    }
    $join = "FROM {$table} INNER JOIN master_peserta ON log_penambahan_waktu.id_peserta = master_peserta.id_peserta INNER JOIN ujian "
    . "ON ujian.id_ujian = log_penambahan_waktu.id_ujian "
            . "INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break; 
  
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
          if ($_SESSION['suspend'] == 1) {
            return '<div class="text-center"><button id="revisi" class="btn btn-flat btn-success btn-xs"><i class="fa fa-undo"></i> &nbsp;&nbsp;Revisi&nbsp;&nbsp;&nbsp;</button></div>';
          }
          else{
            return '<div class="text-center"><i>Aktif</i></div>';
          }
        }
        if ($d==3) {
          return '<div class="text-center"><i>Ujian Selesai</i></div>';
        }
        if ($d==5) {
          return '<div class="text-center"><i>Telah Direvisi</i></div>';
        }
        else {
          if ($_SESSION['suspend'] == 1) {
            return '<div class="text-center"><button id="suspend" class="btn btn-flat btn-danger btn-xs"><i class="fa fa-warning"></i> Suspend</button></div>';
          }
          else{
            return '<div class="text-center"><i>Aktif</i></div>';
          }
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
  case 'nilai':
    $kategori = $_POST['kategori'];
    $table = "generated_soal";
    $key   = "id_peserta";
    $column = array(
      array( 'db' => 'generated_soal.id',  'dt' => 0, 'field' => 'id' ),
      array( 'db' => 'no_peserta',         'dt' => 1, 'field' => 'no_peserta' ),
      array( 'db' => 'nama',               'dt' => 2, 'field' => 'nama' ),
      array( 'db' => 'pkt',                'dt' => 3, 'field' => 'pkt'),
      array( 'db' => 'kesatuan',           'dt' => 4, 'field' => 'kesatuan'),
      array( 'db' => 'id_lokasi',          'dt' => 5, 'field' => 'id_lokasi' ),
      array( 'db' => 'id_ruangan',         'dt' => 6, 'field' => 'id_ruangan' ),
      array( 'db' => 'nama_master',        'dt' => 7, 'field' => 'nama_master', 'formatter' => function($d,$row){ 
          return "<small><i>{$d}</i></small>";
      }),
      array( 'db' => 'nilai',   'dt' => 8, 'field' => 'nilai' ),
    );
    if($_SESSION['level']==2){
      $where = "id_lokasi = '".$_SESSION['lokasi']."' && master_kategori.nama_master = '$kategori'";
    }
    elseif($_SESSION['level']==3){
      $where = "id_lokasi = '$_SESSION[lokasi]' && id_ruangan = '$_SESSION[ruangan]' && master_kategori.nama_master = '$kategori'";
    }
    else{
      $where = "master_kategori.nama_master = '$kategori'";
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
    $join = "FROM {$table} inner join generated_soal on master_peserta.id_peserta = generated_soal.id_peserta inner join ujian on generated_soal.id_ujian = ujian.id_ujian where ujian.status_ujian=3 or ujian.status_ujian=2 group by id_ruangan";
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
    $join = "FROM {$table} inner join generated_soal on master_peserta.id_peserta = generated_soal.id_peserta inner join ujian on generated_soal.id_ujian = ujian.id_ujian";
    $where = "id_ruangan = '$ruang' and (ujian.status_ujian=3 or ujian.status_ujian=2)";
$datatable->get_table_exjoin($table, $key, $column, $join, $where);
break;
  case 'file':
    $table = "lokasi";
    $key   = "id_lokasi";
    $column = array(
      array( 'db' => 'id_lokasi',    'dt' => 0, 'field' => 'id' ),
      array( 'db' => 'nama_lokasi',  'dt' => 1, 'field' => 'nama_lokasi' ),
      array( 'db' => 'id_lokasi',    'dt' => 2, 'field' => 'id_lokasi', 'formatter' => function($d,$row){ 
        return  '<form method="POST" action="../content/file-ruang">'.
                  '<div class="text-center">'.
                    '<input type="hidden" name="id_lokasi" value="'.$d.'">'.
                    '<button style="margin:0 2px;" class="btn btn-flat btn-primary btn-sm" type="submit"><i class="fa fa-file-text-o"></i> Proses File</button>'.
                  '</div>'.
                  '</form>';
      })
    );
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'file-lokasi':
    $id = $_POST['lokasi'];
    $table = "ruangan";
    $key   = "id_ruangan";
    $column = array(
      array( 'db' => 'id_ruangan',    'dt' => 0, 'field' => 'id' ),
      array( 'db' => 'nama',  'dt' => 1, 'field' => 'nama' ),
      array( 'db' => 'id_ruangan',    'dt' => 2, 'field' => 'id_lokasi', 'formatter' => function($d,$row){ 
        return  '<form method="POST" action="../content/file-ruang">'.
                  '<div class="text-center">'.
                    '<input type="hidden" name="id_lokasi" value="'.$d.'">'.
                    '<a href="'.$domain.'/login/nilaitoPdf/?id=1&ruang='.$row[1].'" style="margin:0 2px;" class="btn btn-flat btn-primary btn-sm" type="submit"><i class="fa fa-file-text-o"></i> Proses File</a>'.
                  '</div>'.
                  '</form>';
      })
    );
    $where ="id_lokasi = '$id'";
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
    $where = "generated_soal.nilai = '$nilai'";
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
    $data['alasan'] = $purifier->purify($_POST['alasan']);
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
