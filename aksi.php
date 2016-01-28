<?php
  require_once './config/application.php';
  $path = ltrim($_SERVER['REQUEST_URI'], '/');
  $temp_path = explode($PROSES_REQUEST,$path);
  $elements = explode('/', $temp_path[1]);
  $data = array_filter($elements);
  if (count($data) == 0){
    include "./index.php";
  }
  else {
    switch ($data[1]) {
      case 'user':
        $process = $data[2]; 
        include "./core/pengguna/proses_pengguna.php";
      break;
      case 'peserta':
        $process = $data[2]; 
        include "./core/peserta/proses_peserta.php";
      break;
      case 'ujian':
        $process = $data[2]; 
        include "./core/ujian/proses_ujian.php";
      break;
      case 'monitor':
        $process = $data[2]; 
        include "./core/monitor/proses_monitor.php";
      break;
      case 'monitor-file':
        exec("ls hasil/*.pdf",$output);
        $lokasi = $pengguna->getLokasi();
        for ($i=0; $i < count($lokasi) ; $i++) { 
          for ($j=0; $j < count($output); $j++) { 
            if (substr($lokasi[$i], 7, 1) == substr($output[$j], 6, 1)) {
              $output[$lokasi[$i]][$j] = str_replace('hasil/', '', $output[$j]); 
            }
          }
        }
        print_r('<pre>');
        print_r($output);
        // print_r($output['lokasi']);
        // echo json_encode();
      break;
      case 'dashboard':
        $process = $data[2]; 
        include "./core/dashboard/dashboard.php";
      break;
      case 'upload':
        $process = $data[2]; 
        include "./core/upload/upload.php";
      break;
      case 'upload_peserta':
        $process = $data[2]; 
        include "./core/upload/upload_peserta.php";
      break;
      default:
        header('HTTP/1.1 404 Not Found');
        include "view/404.php";
      break;
    }
  }
?>
