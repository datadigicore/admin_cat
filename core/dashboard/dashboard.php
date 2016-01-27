<?php
include 'config/application.php';

$sess_id    = $_SESSION['id'];

switch ($process) {
  case 'gender':
    $result = $mdl_dashboard->getGender();
    $r=$db->fetch_array($result);

    $array = array($r[0],$r[1]);

    echo json_encode($array);

  break;
  case 'nilai':
    $result = $mdl_dashboard->getNilaiPeserta();
    print_r($result);

  break;  
  case 'kesatuan':
    $result = $mdl_dashboard->getKesatuan();
    print_r($result);

  break;  
  default:
    $utility->location_goto(".");
  break;
}
?>
