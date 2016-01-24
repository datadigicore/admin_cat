<?php
  require_once __DIR__ . "/../utility/database/mysql_db.php";

  class modelMasterSoal extends mysql_db {

    public function getMasterSoal($id){
      $query="select * from master_soal where id='$id'";
      $result = $this->query($query);
      return $result;
    }

    public function setMasterSoal($data){
      $tipe_soal       = $data['tipe_soal'];
      $penulis   = $data['penulis'];
      $id_kategori   = $data['id_kategori'];
      $kisi      = $data['kisi'];
      $waktu      = $data['waktu'];
      $tingkatan     = $data['tingkatan'];
      $prosedur_penilaian     = $data['prosedur_penilaian'];
      $soal     = $data['soal'];
      $kunci     = $data['kunci'];
      $soal_1     = $data['soal_1'];
      $soal_2     = $data['soal_2'];
      $soal_3     = $data['soal_3'];
      $soal_4     = $data['soal_4'];

      $query      = "INSERT INTO master_soal SET
        tipe_soal      = '$tipe_soal',
        penulis  = '$penulis',
        id_kategori  = '$id_kategori',
        kisi     = '$kisi',
        waktu     = '$waktu',
        tingkatan = '$tingkatan',
        prosedur_penilaian    = '$prosedur_penilaian',
        1    = '$kunci',
        2    = '$soal_1',
        3    = '$soal_2',
        4    = '$soal_3',
        5    = '$soal_4'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function updateMasterSoal($data){
      $id                 = $data['id'];
      $tipe_soal          = $data['tipe_soal'];
      $penulis            = $data['penulis'];
      $id_kategori        = $data['id_kategori'];
      $kisi               = $data['kisi'];
      $waktu              = $data['waktu'];
      $tingkatan          = $data['tingkatan'];
      $prosedur_penilaian = $data['prosedur_penilaian'];
      $soal               = $data['soal'];
      $kunci              = $data['kunci'];
      $soal_1             = $data['soal_1'];
      $soal_2             = $data['soal_2'];
      $soal_3             = $data['soal_3'];
      $soal_4             = $data['soal_4'];

      $query      = "UPDATE master_soal SET
        tipe_soal      = '$tipe_soal',
        penulis  = '$penulis',
        id_kategori  = '$id_kategori',
        kisi     = '$kisi',
        waktu     = '$waktu',
        tingkatan = '$tingkatan',
        prosedur_penilaian    = '$prosedur_penilaian',
        1    = '$kunci',
        2    = '$soal_1',
        3    = '$soal_2',
        4    = '$soal_3',
        5    = '$soal_4',
        WHERE id_soal = '$id'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function deleteMasterSoal($id) {
      $query = "delete from master_soal where id_soal='$id'";
      $result = $this->query($query);
      return $result;
    }  


  }

?>
