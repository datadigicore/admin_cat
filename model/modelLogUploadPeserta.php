<?php
  require_once __DIR__ . "/../utility/database/mysql_db.php";

  class modelLogUploadPeserta extends mysql_db {

    public function getLogUploadPeserta($id=null){
      $query="select * from log_upload_peserta ";
      if($id!=null){
        $query .= "where id = $id";
      }
      $result = $this->query($query);
      return $result;
    }

    public function setLogUploadPeserta($data){
      $nama_file        = $data['nama_file'];
      // $tgl_upload    = $data['tgl_upload'];
      $hash             = $data['hash'];
      $status_log_peserta      = $data['status_log_peserta'];
      $id_user          = $data['id_user'];

      $query      = "INSERT INTO log_upload_peserta SET
        nama_file   = '$nama_file',
        tgl_upload  = now(),
        hash        = '$hash',
        status_log_peserta = '$status_log_peserta',
        id_user     = '$id_user'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function updateLogUploadPeserta($data){
      $id                 = $data['id'];
      $nama_file       = $data['nama_file'];
      // $tgl_upload   = $data['tgl_upload'];
      $hash   = $data['hash'];
      $status_log_peserta      = $data['status_log_peserta'];
      $id_user      = $data['id_user'];

      $query      = "UPDATE log_upload_peserta SET
        nama_file      = '$nama_file',
        tgl_upload  = now(),
        hash  = '$hash',
        status_log_peserta     = '$status_log_peserta',
        id_user     = '$id_user'
        WHERE id = '$id'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function updateStatusLogUploadPeserta($id,$status){

      $query      = "UPDATE log_upload_peserta SET
        status_log_peserta     = '$status'
        WHERE id = '$id'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function deleteLogUploadPeserta($id) {
      $query = "delete from log_upload_peserta where id='$id'";
      $result = $this->query($query);
      return $result;
    }  
    public function importPeserta($data) {
      $arrayCount = count($data);
      $string = "INSERT INTO `master_peserta`(`id_peserta`, `id_ujian`, `id_lokasi`, `id_ruangan`, `no_peserta`, `nama`, `nrp`, `jenkel`, `pkt`, `jabatan` ,`kesatuan`, `tempat_lahir`, `tgl_lahir`, `status_ujian`, `waktu_mulai`, `durasi_pengerjaan`, `tambahan_waktu`, `waktu_selesai`, `skor_total`, `keterangan`) VALUES";
      // $urut=1;
      for ($i=3; $i <=$arrayCount; $i++) { 
        $id_peserta   ='';
        $id_ujian            = '';//trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        $id_lokasi            = trim($data[$i]["C"]," \t\n\r\0\x0B\xA0");//trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        $id_ruangan            = trim($data[$i]["D"]," \t\n\r\0\x0B\xA0");//trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        // $no_peserta            = '';//trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        $status_ujian            = '';//trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        $waktu_mulai            = '';//trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        $waktu_selesai            = '';//trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        $durasi_pengerjaan            = '';//trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        $tambahan_waktu            = '';//trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        $skor_total            = '';//trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        
        $jabatan                 = trim($data[$i]["I"]," \t\n\r\0\x0B\xA0");
        $no_ujian                 = trim($data[$i]["B"]," \t\n\r\0\x0B\xA0");
        $nama                = addslashes(trim($data[$i]["E"]," \t\n\r\0\x0B\xA0"));

        $jenkel              = trim($data[$i]["F"]," \t\n\r\0\x0B\xA0");
        if($jenkel)
        $pkt              = trim($data[$i]["G"]," \t\n\r\0\x0B\xA0");
        $nrp              = trim($data[$i]["H"]," \t\n\r\0\x0B\xA0");
        $kesatuan              = trim($data[$i]["J"]," \t\n\r\0\x0B\xA0");
        $tempat_lahir              = trim($data[$i]["K"]," \t\n\r\0\x0B\xA0");
        $tgl_lahir              = trim($data[$i]["L"]," \t\n\r\0\x0B\xA0");
        $keterangan              = trim($data[$i]["M"]," \t\n\r\0\x0B\xA0");
        
        $string .= "('$id_peserta','$id_ujian','$id_lokasi', '$id_ruangan', '$no_ujian', '$nama', '$nrp', '$jenkel', '$pkt', '$jabatan' ,'$kesatuan', '$tempat_lahir', '$tgl_lahir', '$status_ujian', '$waktu_mulai', '$durasi_pengerjaan','$tambahan_waktu','$waktu_selesai','$skor_total', '$keterangan'),";
       // $urut++;
      }

      $query = substr($string,0,-1);
      echo $query;
      $result = $this->query($query);
      return $result;
    }

  }

?>
