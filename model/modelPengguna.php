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
        level     = '$data[level]',
        lokasi    = '$data[lokasi]',
        ruangan   = '$data[ruangan]'
        WHERE id_pengguna  = '$data[id]'
      ";
      $result = $this->query($query);
      return $result;
    }

    public function addPeserta($data) {
      $query      = "INSERT INTO master_peserta SET
        no_peserta = '$data[noujian]',
        id_lokasi  = '$data[lokasi]',
        id_ruangan = '$data[ruang]',
        nama       = '$data[nama]',
        pkt        = '$data[pangkat]',
        kesatuan   = '$data[kesatuan]',
        nrp        = '$data[nrp]'
      ";
      $result = $this->query($query);
      return $result;
    }

    public function editPeserta($data) {
      $query       = "UPDATE master_peserta SET
        no_peserta = '$data[noujian]',
        id_lokasi  = '$data[lokasi]',
        id_ruangan = '$data[ruang]',
        nama       = '$data[nama]',
        pkt        = '$data[pangkat]',
        kesatuan   = '$data[kesatuan]',
        nrp        = '$data[nrp]'
        WHERE id_peserta = '$data[id]'
      ";
      $result = $this->query($query);
      return $result;
    }

    public function deletePengguna($id) {
      $query = "delete from pengguna where id_pengguna='$id'";
      $result = $this->query($query);
      return $result;
    }
    public function activatePengguna($id) {
      $query = "update pengguna set status = 1 where id_pengguna='$id'";
      $result = $this->query($query);
      return $result;
    }
    public function suspendPengguna($data) {
      $query = "UPDATE generated_soal SET
                status            = 4,
                tambahan_waktu    = '$data[newdurasi]'
                WHERE id          = '$data[id]'";
      $result = $this->query($query);
      return $result;
    }
    public function revisiPengguna($data) {
      // $query = "UPDATE generated_soal SET
      //           status    = 5,
      //           durasi_pengerjaan = '$data[durasibaru]',
      //           tambahan_waktu = tambahan_waktu + '$data[newtambahwaktu]'
      //           WHERE id  = '$data[id]'";
      $query = "UPDATE generated_soal SET
                status    = 5,
                durasi_pengerjaan = '$data[durasibaru]',
                tambahan_waktu = tambahan_waktu + '$data[newtambahwaktu]'
                WHERE id  = '$data[id]'";
      $result = $this->query($query);
      $query  = "SELECT * from generated_soal WHERE id  = '$data[id]' limit 1 ";
      $result = $this->query($query);
      $fetch  = $this->fetch_object($result);
      //hasil
      $id_ujian=$fetch->id_ujian;
      $id_paket=$fetch->id_paket;
      $id_peserta=$fetch->id_peserta;
      $id_kategori=$fetch->id_kategori;
      $waktu_mulai=$fetch->waktu_mulai;
      $durasi_pengerjaan=$fetch->durasi_pengerjaan;
      $tambahan_waktu=$fetch->tambahan_waktu;
      $status=$fetch->status;
      $alasan=$fetch->alasan;
      $query_insert="INSERT INTO `log_penambahan_waktu`(`id_ujian`, `id_paket`, `id_peserta`, `id_kategori`, "
              . "`waktu_mulai`, `durasi_pengerjaan`, `tambahan_waktu`, `status`, `alasan`) values"
              . "($id_ujian, $id_paket, $id_peserta, $id_kategori, "
              . "'$waktu_mulai', $durasi_pengerjaan, $tambahan_waktu, $status, '$data[alasan]')";
      $result = $this->query($query_insert);
      
      return $result;
    }
    public function deactivatePengguna($id) {
      $query = "update pengguna set status = 0 where id_pengguna='$id'";
      $result = $this->query($query);
      return $result;
    }
    public function getLokasi() {
      $query  = "SELECT * from lokasi";
      $result = $this->query($query);
      foreach ($result as $item) {
        $array[] = $item["nama_lokasi"];
      }
      return $array;
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
      $query  = "SELECT nama
                 FROM lokasi INNER JOIN ruangan ON lokasi.id_lokasi = ruangan.id_lokasi $where";
      $result = $this->query($query);
      echo '<option value="" disabled selected>-- Pilih Ruangan --</option>';
      print_r($query);
      while($fetch = $this->fetch_array($result)) {
        echo '<option value="'.$fetch["nama"].'">'.$fetch["nama"].'</option>';
      }
    }
    public function readTimePeserta($data) {
      $where  = "where id = $data";
      $query  = "SELECT * from generated_soal $where";
      $result = $this->query($query);
      $fetch  = $this->fetch_object($result);
      return $fetch;
    }
  }

?>
