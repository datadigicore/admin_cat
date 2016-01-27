<?php
//require_once __DIR__ . '/../../utility/PHPExcel/IOFactory.php';
//require_once __DIR__ . '/../../utility/ExcelReader.php';
require_once __DIR__ . '/../../utility/simple_html_dom.php';
require_once __DIR__ . '/../../config/application.php';

$filename = $argv[1];
$id = $argv[2];
$id_kategori = $argv[3];
$kisi = $argv[4];
$penulis = $argv[5];
$target_file = $path_upload.$filename;
  
//import data soal dari word
echo "wvHtml {$path_upload}$filename {$base_doc}$id_kategori.html ";

$hasil=  shell_exec("wvHtml {$path_upload}$filename {$base_doc}$id_kategori.html "); //proses conversi
//sleep(20);
//proses pengambilan data menggunakan dom html
echo "running migrasi soal {$base_doc}$id_kategori.html<br/>";
$html= file_get_html("{$base_doc}$id_kategori.html");
$row=1;
$data=array();
foreach($html->find('tr') as $element) {
    $kolom=0;
    
    foreach ($element->find('td') as $hasil){
        $strip_tags = "p|div|td";
        $hasil=preg_replace("#<\s*\/?(".$strip_tags.")\s*[^>]*?>#im", '', $hasil);
    $data[$row][$kolom]=$hasil;
        $kolom++;
        
    }
    $row++;
}
//akhir proses import data menjadi array $data

  $infoData['kisi'] = $kisi; 
  $infoData['id_kategori'] = $id_kategori; 
  $infoData['penulis'] = $penulis; 
  print_r($data);
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
  $rs=$mdl_upSoal->importSoal($data,$infoData);
  echo "rs : ".$rs."; id : ".$id;
  if ($rs==1){
    $mdl_upSoal->updateStatusLogUploadSoal($id,2);
  }
  //$utility->load("content/rkakl","success","Data soal berhasil di import ke dalam database");
?>