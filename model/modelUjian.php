<?php
  require_once __DIR__ . "/../utility/database/mysql_db.php";

  class modelUjian extends mysql_db {

    public function insertUjian($data) {
      $query           = "INSERT INTO ujian SET
        id_kategori    = '$data[kategori]',
        pilihan_paket  = '$data[paket]',
        lama_ujian     = '$data[lamaujian]',
        jumlah_soal    = '$data[jmlsoal]',
        waktu_ujian    = '$data[tanggal]',
        jumlah_peserta = '$data[jmlpeserta]'
      ";
      $result = $this->query($query);
      return $result;
    }

    public function updateUjian($data) {
      $query      = "UPDATE pengguna SET
        username  = '$data[username]',
        password  = '$data[password]',
        level     = '$data[level]',
        lokasi    = '$data[lokasi]',
        ruangan   = '$data[ruangan]',
        status    = '$data[status]'
        WHERE id  = '$id'
      ";
      $result = $this->query($query);
      return $result;
    }

    public function clearStatus() {
      $query  = "UPDATE ujian SET status = 0 WHERE status = 1";
      $result = $this->query($query);
      return $result;
    }

    public function deleteUjian($id) {
      $query  = "DELETE FROM ujian WHERE id_ujian='$id'";
      $result = $this->query($query);
      return $result;
    }

    public function activateUjian($id) {
      $query  = "UPDATE ujian SET status = 1 WHERE id_ujian='$id'";
      $result = $this->query($query);
      return $result;
    }

    public function verifikasiUjian($id) {
      $query  = "UPDATE ujian SET status_ujian = 1 WHERE id_ujian='$id'";
      $result = $this->query($query);
      return $result;
    }

    public function mulaiUjian($id) {
      $query  = "UPDATE ujian SET status_ujian = 2 WHERE id_ujian='$id'";
      $result = $this->query($query);
      return $result;
    }

    public function selesaiUjian($id) {
      $query  = "UPDATE ujian SET status_ujian = 3, status = 0 WHERE id_ujian='$id'";
      $result = $this->query($query);
      return $result;
    }

    public function kategori() {
      $query  = "SELECT * from master_kategori";
      $result = $this->query($query);
      echo '<option value="" disabled selected>-- Pilih Kategori --</option>';
      while($fetch = $this->fetch_array($result)) {
        echo '<option value="'.$fetch["id_master"].'">'.$fetch["nama_master"].'</option>';
      }
    }
  }

?>
