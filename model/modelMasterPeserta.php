<?php
  require_once __DIR__ . "/../utility/database/mysql_db.php";

  class modelMasterPeserta extends mysql_db {

    //jika tidak ada parameter maka akan mengambil semua kategori
    public function getMasterPeserta($id=null){
      $query="select * from master_peserta";
      if($id!=null){
        $query .= "where id_peserta='$id'";
      }
      $result = $this->query($query);
      return $result;
    }

    public function setMasterPeserta($data){
      $id_ujian   = $data['id_ujian'];
      $id_lokasi   = $data['id_lockasi'];
      $id_ruangan   = $data['id_ruangan'];
      $no_peserta   = $data['no_peserta'];
      $nama   = $data['nama'];
      $nrp   = $data['nrp'];
      $tgl_lahir   = $data['tgl_lahir'];
      $status_ujian   = $data['status_ujian'];
      $waktu_mulai   = $data['waktu_mulai'];
      $durasi_pengerjaan   = $data['durasi_pengerjaan'];
      $tambahan_waktu   = $data['tambahan_waktu'];
      $waktu_selesai   = $data['waktu_selesai'];
      $skor_total   = $data['skor_total'];
      $keterangan   = $data['keterangan'];

      $query      = "INSERT INTO master_peserta SET
          id_ujian   = '$id_ujian',
          id_lokasi   = '$id_lockasi',
          id_ruangan   = '$id_ruangan',
          no_peserta   = '$no_peserta',
          nama   = '$nama',
          nrp   = '$nrp',
          tgl_lahir   = '$tgl_lahir',
          status_ujian   = '$status_ujian',
          waktu_mulai   = '$waktu_mulai',
          durasi_pengerjaan   = '$durasi_pengerjaan',
          tambahan_waktu   = '$tambahan_waktu',
          waktu_selesai   = '$waktu_selesai',
          skor_total   = '$skor_total',
          keterangan   = '$keterangan'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function updateMasterPeserta($data){
      $id_peserta   = $data['id_peserta'];
      $id_ujian   = $data['id_ujian'];
      $id_lokasi   = $data['id_lockasi'];
      $id_ruangan   = $data['id_ruangan'];
      $no_peserta   = $data['no_peserta'];
      $nama   = $data['nama'];
      $nrp   = $data['nrp'];
      $tgl_lahir   = $data['tgl_lahir'];
      $status_ujian   = $data['status_ujian'];
      $waktu_mulai   = $data['waktu_mulai'];
      $durasi_pengerjaan   = $data['durasi_pengerjaan'];
      $tambahan_waktu   = $data['tambahan_waktu'];
      $waktu_selesai   = $data['waktu_selesai'];
      $skor_total   = $data['skor_total'];
      $keterangan   = $data['keterangan'];

      $query      = "INSERT INTO master_peserta SET
          id_ujian   = '$id_ujian',
          id_lokasi   = '$id_lockasi',
          id_ruangan   = '$id_ruangan',
          no_peserta   = '$no_peserta',
          nama   = '$nama',
          nrp   = '$nrp',
          tgl_lahir   = '$tgl_lahir',
          status_ujian   = '$status_ujian',
          waktu_mulai   = '$waktu_mulai',
          durasi_pengerjaan   = '$durasi_pengerjaan',
          tambahan_waktu   = '$tambahan_waktu',
          waktu_selesai   = '$waktu_selesai',
          skor_total   = '$skor_total',
          keterangan   = '$keterangan'
          WHERE id_peserta   = '$id_peserta'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function deleteMasterPeserta($id) {
      $query = "delete from master_peserta where id_peserta='$id'";
      $result = $this->query($query);
      return $result;
    }  


  }

?>