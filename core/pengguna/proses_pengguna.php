<?php
include 'config/application.php';

$sess_id    = $_SESSION['user_id'];
$name       = $purifier->purify($_POST[name]);
$username   = $purifier->purify($_POST[username]);
$password   = $utility->sha512($_POST[password]);
$email      = $purifier->purify($_POST[email]);
$level      = $purifier->purify($_POST[level]);
$status     = $purifier->purify($_POST[status]);

$data_pengguna = array(
  "name"       => $name,
  "username"   => $username,
  "password"   => $password,
  "email"      => $email,
  "level"      => $level,
  "status"     => $status
);

switch ($process) {
  case 'table':
    $table = "pengguna";
    $key   = "id_pengguna";
    $column = array(
      array( 'db' => 'id_pengguna',      'dt' => 0 ),
      array( 'db' => 'username',  'dt' => 1 ),
      array( 'db' => 'status',  'dt' => 2, 'formatter' => function($d,$row,$url_rewrite){ 
        if($d==1){
          return "<button id='aktif' class='btn btn-flat btn-success btn-xs'><i class='fa fa-check-circle'></i>$url_rewrite Aktif</button>";
        }
        else{
          return '<button id="nonaktif" class="btn btn-flat btn-danger btn-xs"><i class="fa fa-warning"></i> Belum Aktif</button>';
        }
      }),
      array( 'db' => 'lokasi',  'dt' => 3 ),
      array( 'db' => 'ruangan',   'dt' => 4 ),
      array( 'db' => 'level', 'dt' => 5, 'formatter' => function($d,$row){ 
        if($d==1){
          return 'Super Admin';
        }
        else if ($d==2){
          return 'Admin Lokasi';
        }
        else if ($d==3){
          return 'Admin Ruangan';
        }
      }),
      array( 'db' => 'level',   'dt' => 7 ),
      array( 'db' => 'status',  'dt' => 8 )
    );
    // $where = "level != 1";
    $datatable->get_table($table, $key, $column, $where);
  break;
  case 'activate':
    $id = $_POST['key'];
    $pengguna->activatePengguna($id);
  break;
  case 'deactivate':
    $id = $_POST['key'];
    $pengguna->deactivatePengguna($id);
  break;
  case 'add':
    $pengguna->insertPengguna($data_pengguna);
    $utility->load("content/adduser","success","Data berhasil ditambahkan");
  break;
  case 'edt':
    $pengguna->updatePengguna($data_pengguna);
    $utility->location_goto("content/setting");
  break;
  case 'del':
    $pengguna->deletePengguna($hapuspengguna);
    $utility->location_goto("content/setting");
  break;
  case 'kuitansi':
    $report->kuitansi($data_pengguna);
  break;
  default:
    $utility->location_goto(".");
  break;
}
?>
