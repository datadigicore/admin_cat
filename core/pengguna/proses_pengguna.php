<?php
include 'config/application.php';

$sess_id    = $_SESSION['id'];
$data['username']  = $purifier->purify($_POST['username']);
$data['password']  = $utility->sha512($_POST['password']);
$data['level']     = $purifier->purify($_POST['level']);
$data['lokasi']    = $purifier->purify($_POST['lokasi']);
$data['ruangan']   = $purifier->purify($_POST['ruangan']);
$data['status']    = $purifier->purify($_POST['status']);

switch ($process) {
  case 'table':
    $table = "pengguna";
    $key   = "id_pengguna";
    $column = array(
      array( 'db' => 'id_pengguna',      'dt' => 0 ),
      array( 'db' => 'username',  'dt' => 1 ),
      array( 'db' => 'status',  'dt' => 2, 'formatter' => function($d,$row){ 
        if($d==1){
          return "<button id='aktif' class='btn btn-flat btn-success btn-xs'><i class='fa fa-check-circle'></i> Aktif</button>";
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
    if($_SESSION['level']==2){
      $where = "level != 1 and level != 2 and lokasi = '".$_SESSION['lokasi']."'";
    } else {
      $where = "level != 1";
    }
    
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
    $pengguna->insertPengguna($data);
    $utility->load("content/adduser","success","Data berhasil ditambahkan");
  break;
  case 'edt':
    $pengguna->updatePengguna($data);
    $utility->location_goto("content/setting");
  break;
  case 'del':
    $id = $_POST['iddel'];
    $pengguna->deletePengguna($id);
    $utility->load("content/user","success","Data Pengguna Berhasil Dihapus");
  break;
  case 'lokasi':
    if($_POST['sessLok']!=undefined){
      $pengguna->lokasi($_POST['sessLok']);
    } else {
      $pengguna->lokasi();
    }  
  break;
  case 'ruangan':
    $id = array('nama_lokasi' => $_POST['key']);
    $pengguna->ruangan($id);
  break;
  default:
    $utility->location_goto(".");
  break;
}
?>
