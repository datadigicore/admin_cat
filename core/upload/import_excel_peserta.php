<?php
require_once __DIR__ . '/../../utility/PHPExcel/IOFactory.php';
require_once __DIR__ . '/../../utility/ExcelReader.php';
require_once __DIR__ . '/../../config/application.php';

$filename = $argv[1];
$id = $argv[2];
$target_file = $path_upload.$filename;
  echo $target_file;
  try {
    $objPHPExcel = PHPExcel_IOFactory::load($target_file);
  }
  catch(Exception $e) {
    die('Kesalahan! Gagal dalam mengupload file : "'.pathinfo($filename,PATHINFO_BASENAME).'": '.$e->getMessage());
  }

  $allDataInSheet = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
  echo "<pre>";
  print_r($allDataInSheet);
  // $data_insert = array(
  //   "tanggal"    => date("Y-m-d H:i:s",$time),
  //   "filename"   => $path,
  //   "filesave"   => $target_name,
  //   "keterangan" => $purifier->purify($_POST['keterangan']),
  //   "tahun"      => $purifier->purify($_POST['thang'])
  // );
  if ($thang == date("Y")+1) {
    $data_insert["status"] = 2;
  }
  else {
    $data_insert["status"] = 1;
  }
  // $rkakl->clearRkakl($thang);
  // $rkakl->insertRkakl($data_insert);
  $rs=$mdl_upPeserta->importPeserta($allDataInSheet);
  echo "rs : ".$rs."; id : ".$id;
  if ($rs==1){
    $mdl_upPeserta->updateStatusLogUploadPeserta($id,2);
  }
  //$utility->load("content/rkakl","success","Data soal berhasil di import ke dalam database");
?>