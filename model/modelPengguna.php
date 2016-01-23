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
      $id         = $data['id'];
      $nama       = $data['nama'];
      $username   = $data['username'];
      $password   = $data['password'];
      $email      = $data['email'];
      $keterangan = $data['keterangan'];

      $query       = "UPDATE pengguna SET
        nama       = '$nama',
        username   = '$username',
        password   = '$password',
        email      = '$email',
        keterangan = '$keterangan'
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
    public function lokasi() {
      $query  = "SELECT * from lokasi";
      $result = $this->query($query);
      echo '<option value="" disabled selected>-- Pilih Lokasi --</option>';
      while($fetch = $this->fetch_array($result)) {
        echo '<option value="'.$fetch["nama_lokasi"].'">'.$fetch["nama_lokasi"].'</option>';
      }
    }
    public function ruangan($data) {
      $where  = $this->where($data);
      $query  = "SELECT ruangan.nama as nama
                 FROM lokasi INNER JOIN ruangan ON lokasi.id_lokasi = ruangan.id_lokasi $where";
      $result = $this->query($query);
      echo '<option value="" disabled selected>-- Pilih Ruangan --</option>';
      while($fetch = $this->fetch_array($result)) {
        echo '<option value="'.$fetch["nama"].'">'.$fetch["nama"].'</option>';
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
