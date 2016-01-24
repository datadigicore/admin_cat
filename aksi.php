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
      case 'ujian':
        $process = $data[2]; 
        include "./core/pengguna/proses_ujian.php";
      break;
      case 'rkakl':
        $process = $data[2]; 
        include "./core/rkakl/proses_rkakl.php";
      break;
      default:
        header('HTTP/1.1 404 Not Found');
        include "view/404.php";
      break;
    }
  }
?>
