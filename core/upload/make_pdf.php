<?php
//require_once __DIR__ . '/../../utility/PHPExcel/IOFactory.php';
//require_once __DIR__ . '/../../utility/ExcelReader.php';
require_once __DIR__ . '/../../utility/simple_html_dom.php';
require_once __DIR__ . '/../../config/application.php';


      global $CONFIG;
      $ruang_data = array();
      $pdftk_file="";
      $command_pdflatex="";
      $master_name="";
      $kd_paket;
      $peserta = array();
        $id = $argv[1];
        $id_ruangan = $argv[2];
        $ujian->update_data(" status_pdf=1 "," ujian "," id_ujian='$id' ");
        $ruang = str_replace("/", "_", $id_ruangan);
        $ruang= str_replace("*", "", $ruang);
        $ujian_data = $ujian->getData('ujian',0,"id_ujian = {$id}");
        $peserta = $ujian->getData('generated_soal',1,"id_ujian = {$id}");
        $kategori = $ujian->getData('master_kategori',0,"id_master = {$ujian_data['id_kategori']}");
        $jml_soal=0;
        // print_r($ujian_data);
        $nama_master= str_replace(" ", "", $kategori['nama_master']);
        $master_name=$nama_master;
        foreach ($peserta as $key => $value) {
            if($time == 50){
                $time = 0;
                sleep(3);
            }
            unset($soalSort);
            $user = $ujian->getData('master_peserta',0,"id_peserta = {$value['id_peserta']}");
            $now = strtoupper($ujian->changeDate($value['waktu_mulai']));
            $jwb = $ujian->getDataCustom('jawaban',1,"id_kategori = {$ujian_data['id_kategori']}  AND id_peserta = {$value['id_peserta']}","opt");
             // print_r($jwb);
            $jwban = array();
            $msg_jwb='';
            foreach ($jwb as $key => $val_jwb) {
              $jwban[] = $val_jwb['opt'];
              // if($msg_jwb==''){
              //   $msg_jwb.='"'.$val_jwb['opt'].'"';
              // }
              // else{
                $msg_jwb.=',"'.$val_jwb['opt'].'"';
              // }
            }
            // $msg = '["'.'cetak_1lbr'.'","'.$user['id_ruangan'].'","'.$user['nrp'].'","'.$kategori['nama_master'].'","'.$value['paket'].'","'.$now.'","'.$user['no_peserta'].'","'.$user['nama'].'","'.$user['jenkel'].'","'.$value['nilai'].'"'.$msg_jwb.']';
            $preMsg = array("cetak_1lbr",
                            "$user[id_ruangan]",
                            "$user[nrp]",
                            "$kategori[nama_master]",
                            "$value[paket]",
                            "$now",
                            "$user[no_peserta]",
                            "$user[nama]",
                            "$user[jenkel]",
                            "$value[nilai]",
                             $msg_jwb
                            );
            $msg = json_encode($preMsg);
            echo $msg;

            // $sock=socket_create(AF_INET,SOCK_STREAM,0) or die("Cannot create a socket");
            // socket_connect($sock,$address,$port) or die("Could not connect to the socket");
            // socket_write($sock,$msg);
            // socket_close($sock);

            $kd_paket = $value['paket'];
            //$save_path="/srv/www/htdocs/siip/cat.polda/logs/hasil/";
             $save_path="$ujian_path"."logs/hasil/";
            $ruangan = str_replace("/", "_", $user['id_ruangan']);
            $ruang_data[$ruangan] = $ruangan;
            $now = strtoupper($ujian->changeDate($value['waktu_mulai']));
            $filename = $base_path."core/upload/template/hasil_ujian.tex";
            $handle = fopen($filename, "r");
            $contents = fread($handle, filesize($filename));
            fclose($handle);

            $content2=$contents;
            $content2=str_replace("a.nopeserta", $user['no_peserta'], $content2);
            $content2=str_replace("a.nama", $user['nama'], $content2);
            $content2=str_replace("a.jeniskelamin", $user['jenkel'], $content2);
            $content2=str_replace("a.skor", $value['nilai'], $content2);
            $content2=str_replace("a.paket", $kd_paket, $content2);
            $content2=str_replace("a.tglujian", $now, $content2);
            $content2=str_replace("a.mataujian", $kategori['nama_master'], $content2);

            for($no=99; $no>=0; $no--){
                $nomor = $no+1;
                $content2=str_replace("no".$nomor, $jwban[$no], $content2);
            }
            $nama_lengkap = str_replace(" ", "_", $user['nrp']);
            
            $fp = fopen($save_path."tex/".$ruangan."-".$nama_lengkap."_".$nama_master.'.tex', 'w');
            fwrite($fp, $content2);
            fclose($fp);

            $pdftk_file=$save_path.$ruangan."*.pdf";
            if($command_pdflatex==""){
                $command_pdflatex.= "pdflatex -output-directory ".$save_path." core/upload/tex/".$ruangan."-".$nama_lengkap."_".$nama_master.".tex";
            }
            else{
                $command_pdflatex.= " && pdflatex -output-directory ".$save_path." core/upload/tex/".$ruangan."_".$nama_lengkap."_".$nama_master.".tex";
            }
            exec("pdflatex -output-directory ".$save_path." core/upload/tex/".$ruangan."_".$nama_lengkap."_".$nama_master.".tex");

            echo "pdflatex -output-directory core/upload/pdf core/upload/tex/".$ruangan."_".$nama_lengkap."_".$nama_master.".tex";

            $time++;

        }
            exec(' cd '.$save_path.'tex; for i in *.tex; do pdflatex -output-directory '.$save_path.' $i;done');
            echo(' cd '.$save_path.'tex; for i in *.tex; do pdflatex -output-directory '.$save_path.' $i;done');

            $filename = $save_path."all/"."{$ruangan}-NilaiAkademik-{$nama_master}.pdf";
            //$log_txt="/srv/www/htdocs/siip/cat.polda/logs/hasil2.txt";
            $log_txt="$ujian_path"."logs/hasil2.txt";
            foreach ($ruang_data as $value) {
                $pdftk_file=$save_path.$value."*.pdf";
                $filename = $save_path."all/"."{$value}-NilaiAkademik-{$master_name}.pdf";
                $status= system("/usr/bin/pdftk {$pdftk_file} cat output ".$filename." > ".$log_txt." &");
                echo "/usr/bin/pdftk {$pdftk_file} cat output ".$filename." > ".$log_txt." &";
            }
            $status= system("/usr/bin/pdftk {$pdftk_file} cat output ".$filename." > ".$log_txt." &");
            echo $status;
            echo "/usr/bin/pdftk {$pdftk_file} cat output ".$filename." > ".$log_txt." &";
            $ujian->update_data(" status_pdf=2 "," ujian "," id_ujian='$id' ");
?> 
