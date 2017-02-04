<?php
  require_once __DIR__ . "/../utility/database/mysql_db.php";

  class modelUjian extends mysql_db {

    public function get_countdown($id_ujian){
        $sql = "SELECT id_ujian, TIME_TO_SEC(waktu_ujian)+(lama_ujian*60)-time_to_sec(NOW())  selisih FROM ujian where id_ujian='$id_ujian' and status_ujian=2 ";
        $result = $this->query($sql);
        $data = $this->fetch_array($result);
        return $data['selisih'];
    }

    public function penjelasan($data){
      $get_id_peserta = $this->getData('master_peserta',0,"no_peserta='$data' ");
      // print_r($get_id_peserta);

      $id_peserta = $get_id_peserta['id_peserta'];
      $ujian = $this->getData('ujian',0,"status_ujian = 3");

      // print_r($ujian);

        if($ujian['id_ujian']){
            $detailujian = $this->getData('master_kategori',0,"id_master = {$ujian['id_kategori']}");

            $paket = $this->getData('paket_soal',0,"id_kategori = {$ujian['id_kategori']} AND status = 1");
            // print_r($paket);
            $tmp_soal = $this->getData('generated_soal',0,"id_paket = {$paket['id_paket']} AND id_peserta = {$id_peserta} AND id_ujian = {$ujian['id_ujian']}");
            // print_r($tmp_soal);
            // exit;
            $getSoal = $this->getData('master_soal',1,"id_soal IN ({$tmp_soal['soal']})");

            foreach ($getSoal as $key => $value) {
                $getSoal[$key]['soal'] = html_entity_decode(htmlspecialchars_decode($value['soal'],ENT_NOQUOTES));
                $getSoal[$key]['1'] = html_entity_decode(htmlspecialchars_decode($value['1'],ENT_NOQUOTES));
                $getSoal[$key]['2'] = html_entity_decode(htmlspecialchars_decode($value['2'],ENT_NOQUOTES));
                $getSoal[$key]['3'] = html_entity_decode(htmlspecialchars_decode($value['3'],ENT_NOQUOTES));
                $getSoal[$key]['4'] = html_entity_decode(htmlspecialchars_decode($value['4'],ENT_NOQUOTES));

                if(1==$getSoal[$key]['kisi']) $getSoal[$key]['kunci'] = $value['1'];
                if(2==$getSoal[$key]['kisi']) $getSoal[$key]['kunci'] = $value['2'];
                if(3==$getSoal[$key]['kisi']) $getSoal[$key]['kunci'] = $value['3'];
                if(4==$getSoal[$key]['kisi']) $getSoal[$key]['kunci'] = $value['4'];
                  
            }

            $opts = unserialize($tmp_soal['opt']);
            
            $exp = explode(",", $tmp_soal['soal']);
            $opt = explode(",", $tmp_soal['opt']);
            foreach ($exp as $key => $value) {
                foreach ($getSoal as $k => $val) {
                    if($value == $val['id_soal']){
                        $soalSort[$key] = $val;
                    }
                }
            }
            
            $letters = range('A', 'Z');
            foreach ($soalSort as $key => $value) {
                $opt = explode(",", $opts[$key]);
                foreach ($opt as $j => $vals) {
                   $soalSort[$key]['pilihan'][$j]['full'] = $letters[$j].". ".$value[$vals];
                   $soalSort[$key]['pilihan'][$j]['opt'] = $letters[$j];
                   $soalSort[$key]['pilihan'][$j]['ajax'] = $letters[$j]."|".$value[$vals];
                }
            }
            // print_r($soalSort);
            foreach ($soalSort as $key => $value) {
                $kisi = $this->getData('master_kategori',0,"id_master = {$value['kisi']}");
                $soalSort[$key]['kisi'] = $kisi['nama_master'];

                $jwb = $this->getData('jawaban',0,"id_kategori = {$value['id_kategori']} AND id_soal = {$value['id_soal']} AND id_peserta = {$id_peserta} AND id_ujian = {$ujian['id_ujian']}");
                $soalSort[$key]['jawaban'] = $jwb['jawaban'];
                $soalSort[$key]['opt'] = $jwb['opt'];
                $soalSort[$key]['fulljwb'] = $jwb['opt'].". ".$jwb['jawaban'];

            }
            return $soalSort;

    }
  }

    public function update_data($data,$table,$cond)
    {
      $sql = "UPDATE {$table} SET {$data} WHERE {$cond}";
      $this->query($sql);

      return true;
    }

    public function changeDate($date=false)
    {
      if (!$date) return false;
      $changeFormat = date("j F Y",strtotime($date));
      
      return $changeFormat;
    }

    function load_Mpdf($html, $output=null, $path=null)
    {
        $hslpath = "/opt/lampp/htdocs/siip/cat.polda/logs/";
        $mpdf=new mPDF('c','A4','','',32,25,27,25,16,13); 
        $mpdf->SetDisplayMode('fullpage');
            
      // $stylesheet = file_get_contents($CONFIG['default']['root_path'].'assets/css/mpdfstyleA4.css');
      //       $mpdf->WriteHTML($stylesheet,1);
        $mpdf->WriteHTML($html);
        $mpdf->Output($hslpath . $output . ".pdf",'F');
        return true;
        exit;
    }

    public function make_pdf($id, $id_ruangan){
      echo "<pre>";
      global $CONFIG;
        $id = $id;
        $id_ruangan = $id_ruangan;
        $ruang = str_replace("/", "_", $id_ruangan);
        $ruang= str_replace("*", "", $ruang);
        $ujian = $this->getData('ujian',0,"id_ujian = {$id}");
        // $peserta = $this->getData('generated_soal',1,"id_ujian = {$id}");
        $peserta = $this->query("select * from generated_soal where id_ujian = {$id} ");
        $kategori = $this->getData('master_kategori',0,"id_master = {$ujian['id_kategori']}");
        $time = 0;
        print_r($peserta);
        foreach ($peserta as $key => $value) {
            if($time == 50){
                $time = 0;
                sleep(2);
            }
            unset($soalSort);
            $getSoal = $this->getData('master_soal',1,"id_soal IN ({$value['soal']})");
            $user = $this->getData('master_peserta',0,"id_peserta = {$value['id_peserta']}");

            foreach ($getSoal as $k => $val) {
                $getSoal[$k]['soal'] = html_entity_decode(htmlspecialchars_decode($val['soal'],ENT_NOQUOTES));
                $getSoal[$k]['1'] = html_entity_decode(htmlspecialchars_decode($val['1'],ENT_NOQUOTES));
                $getSoal[$k]['2'] = html_entity_decode(htmlspecialchars_decode($val['2'],ENT_NOQUOTES));
                $getSoal[$k]['3'] = html_entity_decode(htmlspecialchars_decode($val['3'],ENT_NOQUOTES));
                $getSoal[$k]['4'] = html_entity_decode(htmlspecialchars_decode($val['4'],ENT_NOQUOTES));
            }
            $opts = unserialize($value['opt']);
            
            $exp = explode(",", $value['soal']);
            $opt = explode(",", $value['opt']);
            foreach ($exp as $k => $vals) {
                foreach ($getSoal as $j => $val) {
                    if($vals == $val['id_soal']){
                        $soalSort[$k] = $val;
                    }
                }
            }
            
            $letters = range('A', 'Z');
            foreach ($soalSort as $k => $val) {
                $opt = explode(",", $opts[$k]);

                foreach ($opt as $j => $vals) {
                   $soalSort[$k]['pilihan'][$j]['full'] = $letters[$j].". ".$val[$vals];
                   $soalSort[$k]['pilihan'][$j]['opt'] = $letters[$j];
                }
            }

            foreach ($soalSort as $k => $val) {
                $kisi = $this->getData('master_kategori',0,"id_master = {$val['kisi']}");
                $soalSort[$k]['kisi'] = $kisi['nama_master'];

                $jwb = $this->getData('jawaban',0,"id_kategori = {$val['id_kategori']} AND id_soal = {$val['id_soal']} AND id_peserta = {$value['id_peserta']}");
                $soalSort[$k]['jawaban'] = $jwb['jawaban'];
                $soalSort[$k]['opt'] = $jwb['opt'];
                $soalSort[$k]['fulljwb'] = $jwb['opt'].". ".$jwb['jawaban'];

            }
            
            // print_r($ujian);
            // print_r($peserta);
            // print_r($kategori);
            // print_r($user);
            // print_r($soalSort);

            
            $now = strtoupper($this->changeDate($value['waktu_mulai']));


            // $this->reportHelper =$this->loadModel('reportHelper');

        }

    }


 public function loadMpdf($html, $output=null, $path=null)
  {
    // echo "masuk";
    // echo $output;
    // exit;
        global $CONFIG;
        $hslpath = "/opt/lampp/htdocs/siip/cat.polda/logs/hasil/";
        $pdf_ext = '.pdf';
        $mpdfEngine = __DIR__ . "/../../libs/mpdf/mpdf.php";

        if (is_file($mpdfEngine)){
            
            require_once ($mpdfEngine);
            $mpdf=new mPDF('c','A4','','',32,25,27,25,16,13); 
      $mpdf->SetDisplayMode('fullpage');
            
      /*$mpdf=new mPDF('','','','',15,15,16,16,9,9,'P');
            $mpdf->AddPage('L','','','','',15,15,16,16,9,9);
            $mpdf->setFooter('{PAGENO}') ;*/
      $stylesheet = file_get_contents(__DIR__ . "/../../".'assets/css/mpdfstyleA4.css');
            $mpdf->WriteHTML($stylesheet,1);
      $mpdf->WriteHTML($html);
      $mpdf->Output($hslpath . $output . $pdf_ext,'F');
            
            logFile('load excel success');
            return true;
        }else{
            logFile('excel lib not found');
        }

        exit;
  }

  public function getData($table,$all,$id=false)
    {
        $dataArray =  array();
        if ($id) $cond = "WHERE {$id}"; else $cond = "";
        $sql = "SELECT * FROM {$table} {$cond}";
        // print_r($sql);
        $result = $this->query($sql);
        if($all==1){
          while($data_arr = mysqli_fetch_assoc($result)){
            $dataArray[]=$data_arr;
          }
          return $dataArray;
        }
        else{
          return mysqli_fetch_assoc($result);
        }
    }

    public function insertUjian($data) {
      $query           = "INSERT INTO ujian SET
        id_kategori    = '$data[kategori]',
        lama_ujian     = '$data[lamaujian]',
        jumlah_soal    = '$data[jmlsoal]',
        pilihan_paket  = '$data[jmlpaket]',
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

    public function activatePaketUjian($data) {
      $query  = "UPDATE paket_soal SET status = 1 WHERE id_ujian='$data[id]' AND paket='$data[paket]'";
      $result = $this->query($query);
      return $result;
    }

    public function truncateUjian($data) {
      $query  = "UPDATE paket_soal SET status = 1 WHERE id_ujian='$data[id]' AND paket='$data[paket]'";
      $result = $this->query($query);
      return $result;
    }

    public function verifikasiUjian($id) {
      $query  = "UPDATE ujian SET status_ujian = 1 WHERE id_ujian='$id'";
      $result = $this->query($query);
      return $result;
    }

    public function updateTime($id) {
      $timenow = date("Y-m-d H:i:s", time());
      $query  = "UPDATE ujian SET waktu_ujian = '$timenow' WHERE id_ujian='$id'";
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

    public function getJmlPaket($id) {
      $query  = "SELECT * from ujian WHERE id_ujian = $id";
      $result = $this->query($query);
      $fetch = $this->fetch_object($result);
      return $fetch;
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