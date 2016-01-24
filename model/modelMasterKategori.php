<?php
  require_once __DIR__ . "/../utility/database/mysql_db.php";

  class modelMasterKategori extends mysql_db {

    //jika tidak ada parameter maka akan mengambil semua kategori
    public function getMasterKategori($id=null){
      $query="select * from master_kategori ";
      if($id!=null){
        $query .= "where id_master = '$id'";
      }
      
      $result = $this->query($query);
      return $result;
    }

    public function setMasterKategori($data){
      $id_parent   = $data['id_parent'];
      $nama_master   = $data['nama_master'];

      $query      = "INSERT INTO master_kategori SET
        id_parent  = '$id_parent',
        nama_master  = '$nama_master'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function updateMasterKategori($data){
      $id_master          = $data['id_master'];
      $id_parent          = $data['id_parent'];
      $nama_master        = $data['nama_master'];

      $query      = "UPDATE master_kategori SET
        id_parent      = '$id_parent',
        nama_master  = '$nama_master',
        WHERE id_master = '$id_master'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function deleteMasterKategori($id) {
      $query = "delete from master_kategori where id_master='$id'";
      $result = $this->query($query);
      return $result;
    }  


  }

?>
