<?php
include 'config/application.php';

$sess_id    = $_SESSION['user_id'];
$data['id']   = $purifier->purify($_POST['id']);
$data['kategori']   = $purifier->purify($_POST['kategori']);
$data['mekanisme']   = $purifier->purify($_POST['mekanisme']);
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
          // if($row[mekanisme]==0){
          return "<button id='verifikasi' class='btn btn-flat btn-warning btn-xs'><i class='fa fa-check-circle'></i> Mulai Verifikasi</button>";
        // }
        //   else{
        //     return "<small>Tahap Verifikasi</small>";
        //   }
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

                 <div><a href="'.$url_rewrite.'countdown/'.$row[0].'/'.$row[1].'+'.$row[2].'+'.$row[3].'" class="btn btn-primary btn-xs btn-block" btn-block role="button">Live Countdown</a></div>';
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
        if($row[status_ujian]<2){
          return "";
        }
        else{
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
        }
      })
    );
    $tableJoin = "master_kategori";
    $joinWhere = "ujian.id_kategori = master_kategori.id_master";
    $datatable->get_table_join($table, $key, $column, $tableJoin, $joinWhere, $where);
  break;
  case 'tanda_soal_per_peserta':
    $nomor_soal = $_POST['nomor_soal'];
    $ujian->peserta_mengulang_soal($nomor_soal);
  break;
  case 'table_ujian_perruang':
    $ruangan = $_SESSION['ruangan'];
    $table = "ujian_per_ruang";
    $key   = "id_ujian";
    $column = array(
      array( 'db' => 'ujian.id_ujian',       'dt' => 0 ),
      array( 'db' => 'master_kategori.nama_master',    'dt' => 1, 'field' => 'nama_master' ),
      array( 'db' => 'ujian_per_ruang.waktu_ujian',    'dt' => 2, 'formatter' => function( $d, $row ) {
        return date( 'd M Y', strtotime($d));
      }),
      array( 'db' => 'ujian.lama_ujian',     'dt' => 3, 'formatter' => function( $d, $row ) {
        return "$d &nbsp;Menit";
      }),
      array( 'db' => 'ujian.jumlah_soal',    'dt' => 4, 'formatter' => function( $d, $row ) {
        return "$d &nbsp;Soal";
      }),
      array( 'db' => 'ujian_per_ruang.jumlah_peserta', 'dt' => 5, 'formatter' => function( $d, $row ) {
        return "$d &nbsp;Peserta";
      }),
      array( 'db' => 'ujian.status_ujian',   'dt' => 6, 'formatter' => function($d,$row){ 
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
      array( 'db' => 'ujian.status',         'dt' => 7, 'formatter' => function($d,$row){ 
        if($d==0 && $row[status_ujian]==0){
          return "Belum Acak Soal";
        }
        if($d==1 && $row[status_ujian]==0){
          return "<small><i>Berlangsung</i></small>";
        }
        if($d==1 && $row[status_ujian]==1){
          return "<small><i>Berlangsung</i></small>";
        }
        if($d==1 && $row[status_ujian]==2){
          return "<small><i>Berlangsung</i></small>".'

                 <div><a href="'.$url_rewrite.'countdown/'.$row[0].'/'.$row[1].'+'.$row[2].'+'.$row[3].'" class="btn btn-primary btn-xs btn-block" btn-block role="button">Live Countdown</a></div>';
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
      array( 'db' => 'ujian.status_pdf',         'dt' => 8, 'formatter' => function($d,$row){ 
        if($row[status_ujian]<2){
          return "";
        }
        else{
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
        }
      })
    );
    $join = "FROM {$table} 
              LEFT JOIN ujian ON ujian.id_ujian = ujian_per_ruang.id_ujian and  ujian.id_kategori = ujian_per_ruang.id_kategori
              LEFT JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori 
              and master_kategori.id_master = ujian_per_ruang.id_kategori
              where ujian_per_ruang.id_ruangan='$ruangan' ";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'table-pengulangan':
    $id_soal = $data[3];
    $table = "master_peserta";
    $key   = "id_peserta";
    $ruangan = $_SESSION['ruangan'];
    $column = array(
      array( 'db' => 'pengulangan.id_ulang',
             'dt' => 0,
             'field' => 'id_ulang' ),
      array( 'db' => 'master_peserta.id_peserta',
             'dt' => 1,
             'field' => 'id_peserta' ),
      array( 'db' => 'pengulangan.id_ujian',
             'dt' => 2,
             'field' => 'id_ujian' ),
      array( 'db' => 'master_peserta.no_peserta', 'dt' => 3,
             'field' => 'no_peserta' ),
      array( 'db' => 'pengulangan.id_soal',
             'dt' => 4,
             'field' => 'id_soal' ),
      array( 'db' => 'master_peserta.nama',
             'dt' => 5,
             'field' => 'nama' ),
      array( 'db' => 'pengulangan.id_ulang', 
              'dt' => 6, 
              'field' => 'aksi',
              'formatter' => function($d,$row){
                return "<button id='hapus' class='btn btn-flat btn-block btn-danger btn-xs'><i class='fa fa-window-close'></i>Hapus</button>";
              })              
      );
    $join = "FROM {$table} LEFT JOIN pengulangan ON pengulangan.id_peserta = master_peserta.id_peserta where pengulangan.id_soal={$id_soal} and master_peserta.id_ruangan='$ruangan' ";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'table-ujian-pengulangan':
  $sql = "SELECT master_kategori.nama_master, ujian.waktu_ujian FROM pengulangan left join ujian on pengulangan.id_ujian=ujian.id_ujian left join master_kategori on ujian.id_kategori = master_kategori.id_master group by pengulangan.id_ujian LIMIT 0, 30 ";
    $table = "pengulangan";
    $key   = "id_ulang";
    $ruangan = $_SESSION['ruangan'];
    $column = array(
      array( 'db' => 'pengulangan.id_ujian', 'dt' => 0, 'field' => 'id_ujian' ),
      array( 'db' => 'pengulangan.ruangan', 'dt' => 1, 'field' => 'ruangan' ),
      array( 'db' => 'master_kategori.nama_master', 'dt' => 2, 'field' => 'nama_master' ),
      array( 'db' => 'ujian.waktu_ujian', 'dt' => 3, 'field' => 'waktu_ujian' ),
      array( 'db' => 'pengulangan.status', 'dt' => 4, 'field' => 'status',  'formatter' => function($d,$row){
          if($d==0){
            return '<div class="text-center"><button id="revisi" class="btn btn-flat btn-success btn-xs"><i class="fa fa-undo"></i> &nbsp;&nbsp;Mulai Ujian Ulang&nbsp;&nbsp;&nbsp;</button></div>';
          }else{
            return 'Ujian Sedang Berlangsung';
          }

          }) );
    $join = "FROM {$table} left join ujian on pengulangan.id_ujian=ujian.id_ujian left join master_kategori on ujian.id_kategori = master_kategori.id_master 
      where pengulangan.ruangan= '$ruangan'
      group by pengulangan.id_ujian, pengulangan.ruangan ";
    $datatable->get_table_exjoin($table, $key, $column, $join, $where);
  break;
  case 'add_pengulangan':
    $ujian->add_pengulangan($_POST);
  break;
  case 'hapus_pengulangan':
    $ujian->hapus_pengulangan($_POST);
  break;
  case 'add':
    $ujian->insertUjian($data);
    $det_ujian=implode(", ", $data);
    $pengguna->activity_log($_SESSION['username'], "Berhasil Menambah ujian ".$det_ujian);
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
      $pengguna->activity_log($_SESSION['username'], "Berhasil Mengacak Soal pada id ujian ".$data['id']);
    }
    else {
    }
  break;
  case 'verification':
    $id = $_POST['key'];
    $ujian->verifikasiUjian($id);
    $pengguna->activity_log($_SESSION['username'], "Verifikasi Ujian Pada id ujian ".$id);
  break;
  case 'start':
    $id = $_POST['key'];
    $ujian->updateTime($id);
    $ujian->mulaiUjian($id);
    $pengguna->activity_log($_SESSION['username'], "Memulai Ujian Pada id ujian ".$id);

  break;
  case 'finish':
    $id = $_POST['key'];
    $ujian->selesaiUjian($id);
    $pengguna->activity_log($_SESSION['username'], "Menyelesaikan Ujian Pada id ujian ".$id);
  break;
  case 'kategori':
    $ujian->kategori();
  break;
  default:
    $utility->location_goto(".");
  break;
}
?>