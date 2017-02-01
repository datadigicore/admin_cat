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
        
        $hash= $rs['hash'];
        $filename= $rs['filename'];
        $status_soal=0;
        $id_user=$_SESSION['id'];
        $penulis=$_POST['penulis'];
        $kisi = $_POST['kategori'];
        $rsqry = $mdl_masKategori->getMasterKategori($kisi);
        $rs = $db->fetch_object($rsqry);
        //print_r($db->fetch_object($rs));exit;
        if($rs->id_parent!=0){
          $id_kategori = $rs->id_parent; 
        } else {
          $id_kategori = $kisi;
          $kisi=0;
        }
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
          "status_soal" => $status_soal,
          "id_user"     => $id_user,
          "penulis"     => $penulis,
          "kisi"        => $kisi,
          "id_kategori" => $id_kategori
          );
        
        $mdl_upSoal->setLogUploadSoal($data);
        $utility->load("content/upload-soal","success","Data soal telah berhasil diunggah");

      }
      else {
        $utility->load("content/upload-soal","warning","Belum ada file soal yang di lampirkan");
      }
    
    die();
  break;
  case 'import-database':
    $id=$_POST["id-soal"];
    $rs=$mdl_upSoal->getLogUploadSoal($id);
    $result = $db->fetch_object($rs);
    // print_r($result);exit;
    $id_kategori = $result->id_kategori;
    $kisi = $result->kisi;
    $penulis = $result->penulis;
    $filename = $result->nama_file;
    $mdl_upSoal->updateStatusLogUploadSoal($id,1);

     //echo "php -f ".$base_path."core/upload/import_excel.php '$filename' '$id' '$id_kategori' '$kisi' '$penulis' > log/soal.txt &";
    //exit();

    echo exec("php -f ".$base_path."core/upload/import_excel.php '$filename' '$id' '$id_kategori' '$kisi' '$penulis' > log/soal.txt &",$op,$rt);
    // print_r($op);
    // print_r($rt);
   
    $utility->load("content/upload-soal","success","Sedang memproses soal");
  break;
  case 'table-soal':
    $table = array("log_upload_soal","pengguna","master_kategori");
    $joinKey = array("id_user","id_kategori","id_pengguna","id_master");
    $key   = "id";
    $column = array(
      array( 'db' => 'id',      'dt' => 0 ),
      array( 'db' => 'tgl_upload',  'dt' => 1, 'formatter' => function( $d, $row ) {
            return date( 'j-M-Y \&\n\b\s\p\&\n\b\s\p\&\n\b\s\p H:i:s', strtotime($d));
          }
      ),
      array( 'db' => 'nama_file',  'dt' => 2),
      array( 'db' => 'nama_master',  'dt' => 3),
      array( 'db' => 'penulis',  'dt' => 4),
      array( 'db' => 'hash',  'dt' => 5, 'formatter' => function($d,$row){
        return '<div class="text-center">'.
                '<button class="btn btn-primary btn-sm" id="btn-hash" value="'.$d.'"> Hash</button>'.
                '</div>';
      }
      ),
      array( 'db' => 'username',  'dt' => 6 ),
      array( 'db' => 'status_soal', 'dt' => 7, 'formatter' => function($d,$row){ 
        if($d==0){
          return  '<form method="POST" action="'.$url_rewrite.'../process/upload/import-database">'.
                  '<div class="text-center">'.
                    '<i>Siap diproses</i><br>'.
                    '<input type="hidden" name="id-soal" value="'.$row[0].'">'.
                    '<button style="margin:0 2px;" class="btn btn-flat btn-primary btn-sm" type="submit"><i class="fa fa-file-text-o"></i> Proses Soal</button>'.
                  '</div>'.
                  '</form>';
        } else if($d==1){
          return '<i>Sedang Memproses</i>';
        } else if($d==2) {
          return '<i>Selesai Diproses</i>';
        }
      })
    );
    $datatable->get_soal_view($table,$table2,$joinKey, $key, $column);
  break;
  case 'table-datasoal':
    $table = array("log_upload_soal","pengguna","master_kategori");
    $joinKey = array("id_user","id_kategori","id_pengguna","id_master");
    $key   = "id";
    $column = array(
      array( 'db' => 'id_master',   'dt' => 0 ),
      array( 'db' => 'tgl_upload',  'dt' => 1, 'formatter' => function( $d, $row ) {
            return date( 'j-M-Y \&\n\b\s\p\&\n\b\s\p\&\n\b\s\p H:i:s', strtotime($d));
          }
      ),
      array( 'db' => 'nama_master', 'dt' => 2),
      array( 'db' => 'penulis',     'dt' => 3),
      array( 'db' => 'id_master',   'dt' => 4, 'formatter' => function($d,$row){ 
        return  '<form method="POST" action="../content/viewsoal/">'.
                '<div class="text-center">'.
                  '<input type="hidden" name="idsoal" value="'.$d.'">'.
                  '<button style="margin:0 2px;" class="btn btn-flat btn-primary btn-sm" type="submit"><i class="fa fa-file-text-o"></i> View Soal</button>'.
                '</div>'.
                '</form>';
      })
    );
    $datatable->get_soal_view($table,$table2,$joinKey, $key, $column);
  break;
  case 'table-soalsoal':
    $id = $purifier->purify($_POST['idsoal']);
    $table = "master_soal";
    $primaryKey   = "id_soal";
    $columns = array(
      array( 'db' => 'id_soal', 'dt' => 0 ),
      array( 'db' => 'soal',    'dt' => 1 , 'formatter' => function($d,$row){ 
        //return  substr(html_entity_decode(htmlspecialchars_decode($d,ENT_NOQUOTES)),0,40)."...";
        return  html_entity_decode(htmlspecialchars_decode($d,ENT_NOQUOTES))."...";
      }),
      array( 'db' => '1',       'dt' => 2 , 'formatter' => function($d,$row){ 
        return  substr(html_entity_decode(htmlspecialchars_decode($d,ENT_NOQUOTES)),0,15)."...";
      }),
      array( 'db' => '2',       'dt' => 3 , 'formatter' => function($d,$row){ 
        return  substr(html_entity_decode(htmlspecialchars_decode($d,ENT_NOQUOTES)),0,15)."...";
      }),
      array( 'db' => '3',       'dt' => 4 , 'formatter' => function($d,$row){ 
        return  substr(html_entity_decode(htmlspecialchars_decode($d,ENT_NOQUOTES)),0,15)."...";
      }),
      array( 'db' => '4',       'dt' => 5 , 'formatter' => function($d,$row){ 
        return  substr(html_entity_decode(htmlspecialchars_decode($d,ENT_NOQUOTES)),0,15)."...";
      })
    );
    $where = "id_kategori = $id";
    $datatable->get_table($table, $primaryKey, $columns, $where);
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
