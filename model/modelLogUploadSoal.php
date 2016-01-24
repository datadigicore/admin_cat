<?php
  require_once __DIR__ . "/../utility/database/mysql_db.php";

  class modelLogUploadSoal extends mysql_db {

    public function getLogUploadSoal($id=null){
      $query="select * from log_upload_soal ";
      if($id!=null){
        $query .= "where id = $id";
      }
      $result = $this->query($query);
      return $result;
    }

    public function setLogUploadSoal($data){
      $nama_file        = $data['nama_file'];
      // $tgl_upload    = $data['tgl_upload'];
      $hash             = $data['hash'];
      $status_soal      = $data['status_soal'];
      $id_user          = $data['id_user'];
      $penulis          = $data['penulis'];
      $kisi             = $data['kisi'];
      $id_kategori      = $data['id_kategori'];

      $query      = "INSERT INTO log_upload_soal SET
        nama_file   = '$nama_file',
        tgl_upload  = now(),
        hash        = '$hash',
        status_soal = '$status_soal',
        id_user     = '$id_user',
        penulis     = '$penulis',
        kisi        = '$kisi',
        id_kategori = '$id_kategori'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function updateLogUploadSoal($data){
      $id                 = $data['id'];
      $nama_file       = $data['nama_file'];
      // $tgl_upload   = $data['tgl_upload'];
      $hash   = $data['hash'];
      $status_soal      = $data['status_soal'];
      $id_user      = $data['id_user'];

      $query      = "UPDATE log_upload_soal SET
        nama_file      = '$nama_file',
        tgl_upload  = now(),
        hash  = '$hash',
        status_soal     = '$status_soal',
        id_user     = '$id_user'
        WHERE id = '$id'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function updateStatusLogUploadSoal($id,$status){

      $query      = "UPDATE log_upload_soal SET
        status_soal     = '$status'
        WHERE id = '$id'
      ";

      $result = $this->query($query);
      return $result;
    }

    public function deleteLogUploadSoal($id) {
      $query = "delete from log_upload_soal where id='$id'";
      $result = $this->query($query);
      return $result;
    }  
    public function importSoal($data,$info) {
      $arrayCount = count($data);
      $string = "INSERT INTO master_soal (`no_urut`,`tipe_soal`, `penulis`, `id_kategori`, `kisi`, `waktu`, `tingkatan`, `prosedur_penilaian`, `soal`, `1`, `2`, `3`, `4`, `5`) VALUES ";
      $urut=1;
      for ($i=2; $i < $arrayCount; $i++) { 
        $tipe_soal            = '';//trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        $penulis              = trim($info['penulis']," \t\n\r\0\x0B\xA0");//trim($data[$i]["B"]," \t\n\r\0\x0B\xA0");
        $id_kategori          = trim($info['id_kategori']," \t\n\r\0\x0B\xA0");//trim($data[$i]["C"]," \t\n\r\0\x0B\xA0");
        $kisi                 = trim($info['kisi']," \t\n\r\0\x0B\xA0");//trim($data[$i]["D"]," \t\n\r\0\x0B\xA0");
        $waktu                = '';//trim($data[$i]["E"]," \t\n\r\0\x0B\xA0");
        $tingkatan            = '';//trim($data[$i]["F"]," \t\n\r\0\x0B\xA0");
        $prosedur_penilaian   = '';//trim($data[$i]["G"]," \t\n\r\0\x0B\xA0");
        $soal                 = trim($data[$i]["A"]," \t\n\r\0\x0B\xA0");
        $kunci                = trim($data[$i]["F"]," \t\n\r\0\x0B\xA0");

        $jawab_1              = trim($data[$i]["B"]," \t\n\r\0\x0B\xA0");
        $jawab_2              = trim($data[$i]["C"]," \t\n\r\0\x0B\xA0");
        $jawab_3              = trim($data[$i]["D"]," \t\n\r\0\x0B\xA0");
        $jawab_4              = trim($data[$i]["E"]," \t\n\r\0\x0B\xA0");
        switch ($kunci){
          case 'A':
            $jawaban=$jawab_1;
            break;
          case 'B':
            $jawaban=$jawab_2;
            break;
          case 'C':
            $jawaban=$jawab_3;
            break;
          case 'D':
            $jawaban=$jawab_4;
            break;
          default:
            $jawaban="";
            break;
        }
        $string .= "('".$urut."','".$tipe_soal."','".$penulis."','".$id_kategori."','".$kisi."','".$waktu."','".$tingkatan."','".$prosedur_penilaian."','".$soal."','".$jawaban."','".$jawab_1."','".$jawab_2."','".$jawab_3."','".$jawab_4."'),";
        $urut++;
      }

      $query = substr($string,0,-1);
      echo $query;
      $result = $this->query($query);
      return $result;
    }

  }

?>
