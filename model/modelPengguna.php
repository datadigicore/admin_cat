<?php
  require_once __DIR__ . "/../utility/database/mysql_db.php";

  class modelPengguna extends mysql_db {
    public function insertPengguna($data) {
      $query      = "INSERT INTO pengguna SET
        username  = '$data[username]',
        password  = '$data[password]',
        level     = '$data[level]',
        lokasi    = '$data[lokasi]',
        ruangan   = '$data[ruangan]',
        status    = '$data[status]'
      ";
      $result = $this->query($query);
      return $result;
    }

    public function updatePengguna($data) {
      $query       = "UPDATE pengguna SET
        username  = '$data[username]',
        password  = '$data[password]',
        level     = '$data[level]',
        lokasi    = '$data[lokasi]',
        ruangan   = '$data[ruangan]',
        status    = '$data[status]'
        WHERE id   = '$id'
      ";
      $result = $this->query($query);
      return $result;
    }

    public function deletePengguna($id) {
      $query = "delete from pengguna where id='$id'";
      $result = $this->query($query);
      return $result;
    }
    public function activatePengguna($id) {
      $query = "update pengguna set status = 1 where id_pengguna='$id'";
      $result = $this->query($query);
      return $result;
    }
    public function deactivatePengguna($id) {
      $query = "update pengguna set status = 0 where id_pengguna='$id'";
      $result = $this->query($query);
      return $result;
    }
    public function lokasi($sessLok="") {
      $query  = "SELECT * from lokasi";
      $result = $this->query($query);
      echo '<option value="" disabled selected>-- Pilih Lokasi --</option>';
      while($fetch = $this->fetch_array($result)) {

        if($sessLok==$fetch["nama_lokasi"]){
          echo '<option value="'.$fetch["nama_lokasi"].'" selected>'.$fetch["nama_lokasi"].'</option>';
        } else {
          if($sessLok==""){
            echo '<option value="'.$fetch["nama_lokasi"].'">'.$fetch["nama_lokasi"].'</option>';
          }
          
        }
        
      }
    }
    public function ruangan($data) {
      $where  = $this->where($data);
      $query  = "SELECT nama_ruangan
                 FROM lokasi INNER JOIN ruangan ON lokasi.id_lokasi = ruangan.id_lokasi $where";
      $result = $this->query($query);
      echo '<option value="" disabled selected>-- Pilih Ruangan --</option>';
      print_r($query);
      while($fetch = $this->fetch_array($result)) {
        echo '<option value="'.$fetch["nama_ruangan"].'">'.$fetch["nama_ruangan"].'</option>';
      }
    }
    public function readPengguna($data) {
      $where  = $this->where($data);
      $query  = "SELECT * from pengguna $where";
      $result = $this->query($query);
      $fetch  = $this->fetch_object($result);
      return $fetch;
    }
  }

?>
