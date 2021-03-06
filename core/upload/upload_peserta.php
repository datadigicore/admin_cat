<?php
require_once __DIR__ . '/../../utility/PHPExcel/IOFactory.php';
require_once __DIR__ . '/../../utility/ExcelReader.php';
// require_once __DIR__ . '/../../config/config.php';

switch ($process) {
  case 'import':
      if(isset($_POST) && !empty($_FILES['fileimport']['name'])) {
        // $nama_file = 
        
        $nama_file = $_FILES['fileimport']['name'];
        $name = explode('.', $nama_file);
        //print_r($name[0]);exit;
        //$tgl_upload via mysql now()
        //print_r($path_upload);
        $rs=$utility->upload_gambar_hash("fileimport",$path_upload,2,$name[0],$sha_key);
        //print_r($rs);exit;
        $hash= $rs['hash'];
        $filename= $rs['filename'];
        $status_log_peserta=0;
        $id_user=$_SESSION['id'];
        // $penulis=$_POST['penulis'];
        // $kisi = $_POST['kategori'];
        // $rsqry = $mdl_masKategori->getMasterKategori($kisi);
        // $rs = $db->fetch_object($rsqry);
        //print_r($db->fetch_object($rs));exit;
        // if($rs->id_parent!=0){
        //   $id_kategori = $rs->id_parent; 
        // } else {
        //   $id_kategori = $kisi;
        //   $kisi=0;
        // }
        // 

        //print_r($_SESSION);exit;
        //$ext = pathinfo($name, PATHINFO_EXTENSION);
        // if($ext != 'xls' && $ext != 'xlsx') {
        //   $utility->load("content/rkakl","danger","Jenis file soal yang di upload tidak sesuai");
        // }
        // else {
        //   $time = time();
        //   $target_dir = $path_upload;
        //   $target_name = basename(date("Ymd-His-\R\K\A\K\L.",$time).$ext);
        //   $target_file = $target_dir . $target_name;
        //   $response = move_uploaded_file($_FILES['fileimport']['tmp_name'],$target_file);
          
        // }
        $data = array(
          "nama_file"   => $filename,
          "hash"        => $hash,
          "status_log_peserta" => $status_log_peserta,
          "id_user"     => $id_user,
          );
        
        $mdl_upPeserta->setLogUploadPeserta($data);
        $utility->load("content/upload-peserta","success","Data peserta telah berhasil diunggah");

      }
      else {
        $utility->load("content/upload-peserta","warning","Belum ada file peserta yang di lampirkan");
      }
    
    die();
  break;
  case 'import-database':
    $id=$_POST["id-log"];

    $rs=$mdl_upPeserta->getLogUploadPeserta($id);
    // print_r($rs);exit;
     $result = $db->fetch_object($rs);
    // // print_r($result);exit;
    // $id_kategori = $result->id_kategori;
    // $kisi = $result->kisi;
    // $penulis = $result->penulis;
    $filename = $result->nama_file;
    $mdl_upPeserta->updateStatusLogUploadPeserta($id,1);

    // echo "php -f ".$base_path."core/upload/import_excel_peserta.php '$filename' '$id' &";
    

    exec("php -f ".$base_path."core/upload/import_excel_peserta.php '$filename' '$id' >log/peserta.txt &",$op,$rt);
    // print_r($op);
    // print_r($rt);
    $utility->load("content/upload-peserta","success","Sedang memproses peserta");
  break;
  case 'table-peserta':
    $table = "master_peserta";
    $key   = "id_peserta";
    $columns = array(
      array( 'db' => 'id_peserta',   'dt' => 0 ),
      array( 'db' => 'no_peserta',   'dt' => 1 ),
      array( 'db' => 'id_lokasi',    'dt' => 2),
      array( 'db' => 'id_ruangan',   'dt' => 3),
      array( 'db' => 'nama',         'dt' => 4 ),
      array( 'db' => 'pkt',          'dt' => 5 ),
      array( 'db' => 'kesatuan',     'dt' => 6 ),
      array( 'db' => 'nrp',          'dt' => 7 ),
    );
    // $join = "FROM {$table} LEFT JOIN lokasi ON lokasi.id_lokasi = master_peserta.id_lokasi LEFt JOIN ruangan ON ruangan.id_ruangan = master_peserta.id_ruangan";
    $datatable->get_table($table, $key, $columns, $where);
  break;
  case 'table-log-peserta':
    $table = array("log_upload_peserta","pengguna");
    $joinKey = array("id_user","id_pengguna");
    $key   = "id";
    $column = array(
      array( 'db' => 'id',      'dt' => 0 ),
      array( 'db' => 'nama_file',  'dt' => 2),
      array( 'db' => 'tgl_upload',  'dt' => 1, 'formatter' => function( $d, $row ) {
            return date( 'j-M-Y \&\n\b\s\p\&\n\b\s\p\&\n\b\s\p H:i:s', strtotime($d));
          }
      ),
      array( 'db' => 'hash',  'dt' => 3, 'formatter' => function($d,$row){
        return '<div class="text-center">'.
                '<button class="btn btn-primary btn-sm" id="btn-hash" value="'.$d.'"> Hash</button>'.
                '</div>';
      }
      ),
      array( 'db' => 'username',  'dt' => 4 ),
      array( 'db' => 'status_log_peserta', 'dt' => 5, 'formatter' => function($d,$row){ 
        if($d==0){
          return  '<form method="POST" action="'.$url_rewrite.'../process/upload_peserta/import-database">'.
                  '<div class="text-center">'.
                    '<i>Siap diproses</i><br>'.
                    '<input type="hidden" name="id-log" value="'.$row[0].'">'.
                    '<button style="margin:0 2px;" class="btn btn-flat btn-primary btn-sm" type="submit"><i class="fa fa-file-text-o"></i> Proses Peserta</button>'.
                  '</div>'.
                  '</form>';
        } else if($d==1){
          return '<i>Sedang Memproses</i>';
        } else if($d==2) {
          return '<i>Selesai Diproses</i>';
        }
      })
      
      // array( 'db' => 'status_soal', 'dt' => 7, 'formatter' => function($d,$row){ 
      //   if($d==0){
      //     return  '<form method="POST" action="'.$url_rewrite.'../process/upload/import-database">'.
      //             '<div class="text-center">'.
      //               '<i>Siap diproses</i><br>'.
      //               '<input type="hidden" name="id-soal" value="'.$row[0].'">'.
      //               '<button style="margin:0 2px;" class="btn btn-flat btn-primary btn-sm" type="submit"><i class="fa fa-file-text-o"></i> Proses Soal</button>'.
      //             '</div>'.
      //             '</form>';
      //   } else if($d==1){
      //     return '<i>Sedang Memproses</i>';
      //   } else if($d==2) {
      //     return '<i>Selesai Diproses</i>';
      //   }
      // })
    );
    $datatable->get_log_peserta_view($table,$joinKey, $key, $column);
  break;
  case 'view':
    ini_set('memory_limit', '-1');
    $filesave = $purifier->purify($_POST['filename']);
    $data = new Spreadsheet_Excel_Reader($path_upload.$filesave);
    echo '<html>
    <head>
    <title>Sistem Informasi Pelaporan | Ristek Dikti</title>
    <link rel="shortcut icon" type="image/png" href="'.$url_rewrite."static/dist/img/risetdikti.png".'"/>
    <style>
    table.excel {border-style:ridge;border-width:1;border-collapse:collapse;font-family:sans-serif;font-size:12px;}
    table.excel thead th, table.excel tbody th {background:#CCCCCC;border-style:ridge;border-width:1;text-align: center;vertical-align:bottom;}
    table.excel tbody th {text-align:center;width:20px;}
    table.excel tbody td {vertical-align:bottom;}
    table.excel tbody td {padding: 0 3px;border: 1px solid #EEEEEE;}
    </style>
    </head>
    <body>'.$data->dump(true,true,1).'</body>
    </html>';
  break;
  default:
    $utility->location_goto(".");
  break;
}
?>
