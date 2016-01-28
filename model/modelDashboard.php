<?php
  require_once __DIR__ . "/../utility/database/mysql_db.php";

  class modelDashboard extends mysql_db {

    public function getGeneratedSoal($id){
      $query="select * from generated_soal where id='$id'";
      $result = $this->query($query);
      return $result;
    }
    public function getGender(){
      $query="SELECT distinct
      (SELECT COUNT(id_peserta) FROM master_peserta WHERE jenkel='P') as pria,
      (SELECT COUNT(id_peserta) FROM master_peserta WHERE jenkel='W') as wanita
      FROM master_peserta";
      $result = $this->query($query);
      return $result;
    }

    public function getNilaiPeserta(){
      $query="SELECT nilai, count(nilai) FROM generated_soal INNER JOIN master_peserta ON generated_soal.id_peserta = master_peserta.id_peserta INNER JOIN ujian ON ujian.id_ujian = generated_soal.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori where ujian.status_ujian = 2 group by nilai order by nilai ASC ";
      $result = $this->query($query);

      return $result;
    }
    public function getKesatuan(){
      $query="SELECT kesatuan, count(kesatuan) FROM generated_soal INNER JOIN master_peserta ON generated_soal.id_peserta = master_peserta.id_peserta INNER JOIN ujian ON ujian.id_ujian = generated_soal.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori group by kesatuan order by kesatuan ASC ";
      $result = $this->query($query);

      return $result;
    }
    public function getStatus(){
      $query="SELECT generated_soal.status, count(generated_soal.status) FROM generated_soal INNER JOIN master_peserta ON generated_soal.id_peserta = master_peserta.id_peserta INNER JOIN ujian ON ujian.id_ujian = generated_soal.id_ujian INNER JOIN master_kategori ON master_kategori.id_master = ujian.id_kategori group by generated_soal.status order by generated_soal.status ASC ";
      $result = $this->query($query);

      return $result;
    }

    public function setGeneratedSoal($data){
      $id_paket       = $data['id_paket'];
      $id_peserta   = $data['id_peserta'];
      $id_kategori   = $data['id_kategori'];
      $soal      = $data['soal'];
      $opt      = $data['opt'];
      $paket     = $data['paket'];

      $query      = "INSERT INTO generated_soal SET
        id_paket      = '$id_paket',
        id_peserta  = '$id_peserta',
        id_kategori  = '$id_kategori',
        soal     = '$soal',
        opt     = '$opt',
        paket    = '$paket'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function updateGeneratedSoal($data){
      $id           = $data['id'];
      $id_paket     = $data['id_paket'];
      $id_peserta   = $data['id_peserta'];
      $id_kategori  = $data['id_kategori'];
      $soal         = $data['soal'];
      $opt          = $data['opt'];
      $paket        = $data['paket'];

      $query        = "UPDATE generated_soal SET
        id_paket    = '$id_paket',
        id_peserta  = '$id_peserta',
        id_kategori = '$id_kategori',
        soal        = '$soal',
        opt         = '$opt',
        paket       = '$paket'
        where id    = '$id'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function deleteGeneratedSoal($id) {
      $query = "delete from generated_soal where id='$id'";
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

    


  }

?>
