<?php
include 'config/application.php';

$data['id']       = $purifier->purify($_POST['id']);
$data['noujian']  = $purifier->purify($_POST['noujian']);
$data['lokasi']   = $purifier->purify($_POST['lokasi']);
$data['ruang']    = $purifier->purify($_POST['ruang']);
$data['nama']     = $purifier->purify($_POST['nama']);
$data['pangkat']  = $purifier->purify($_POST['pangkat']);
$data['kesatuan'] = $purifier->purify($_POST['kesatuan']);
$data['nrp']      = $purifier->purify($_POST['nrp']);

switch ($process) {
  case 'add':
    $pengguna->addPeserta($data);
    $utility->load("content/addpeserta","success","Data Peserta Berhasil Ditambah");
  break;
  case 'edit':
    $pengguna->editPeserta($data);
    $utility->load("content/data-peserta","success","Data Peserta Berhasil Diupdate");
  break;
  case 'hapus':
    $pengguna->hapusPeserta($data);
  break;
  default:
    $utility->location_goto(".");
  break;
}
?>
