<?php
//require_once __DIR__ . '/../../utility/PHPExcel/IOFactory.php';
//require_once __DIR__ . '/../../utility/ExcelReader.php';
require_once __DIR__ . '/../../utility/simple_html_dom.php';
require_once __DIR__ . '/../../config/application.php';


      global $CONFIG;
      $pdftk_file="";
      $command_pdflatex="";
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
        foreach ($peserta as $key => $value) {
            if($time == 50){
                $time = 0;
                sleep(3);
            }
            unset($soalSort);
            $getSoal = $ujian->getData('master_soal',1,"id_soal IN ({$value['soal']})");
            $user = $ujian->getData('master_peserta',0,"id_peserta = {$value['id_peserta']}");

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
                $jml_soal++;
                $opt = explode(",", $opts[$k]);

                foreach ($opt as $j => $vals) {
                   $soalSort[$k]['pilihan'][$j]['full'] = $letters[$j].". ".$val[$vals];
                   $soalSort[$k]['pilihan'][$j]['opt'] = $letters[$j];
                }
            }

            foreach ($soalSort as $k => $val) {
                $kisi = $ujian->getData('master_kategori',0,"id_master = {$val['kisi']}");
                $soalSort[$k]['kisi'] = $kisi['nama_master'];

                $jwb = $ujian->getData('jawaban',0,"id_kategori = {$val['id_kategori']} AND id_soal = {$val['id_soal']} AND id_peserta = {$value['id_peserta']}");
                $soalSort[$k]['jawaban'] = $jwb['jawaban'];
                $soalSort[$k]['opt'] = $jwb['opt'];
                $soalSort[$k]['fulljwb'] = $jwb['opt'].". ".$jwb['jawaban'];

            }

            $save_path="/srv/www/htdocs/siip/cat.polda/logs/hasil/";

            $ruangan = str_replace("/", "_", $user['id_ruangan']);
            $now = strtoupper($ujian->changeDate($value['waktu_mulai']));
            $filename = $base_path."core/upload/template/hasil_ujian.tex";
            $handle = fopen($filename, "r");
            $contents = fread($handle, filesize($filename));
            fclose($handle);

            $content2=$contents;
            $content2=str_replace("a.nopeserta", $user['no_peserta'], $content2);
            $content2=str_replace("a.nama", $user['nama'], $content2);
            $content2=str_replace("a.jeniskelamin", $user['jenkel'], $content2);
            $content2=str_replace("a.skor", $user['skor'], $content2);
            $content2=str_replace("a.mataujian", $kategori['nama_master'], $content2);
            // $content2=str_replace("a.paket", $kategori['nama_master'], $content2);

            for($no=99; $no>=0; $no--){
                $nomor = $no+1;
                $content2=str_replace("no".$nomor, $soalSort[$no]['opt'], $content2);
            }
            $nama_lengkap = str_replace(" ", "", $user['nama']);
            
            $fp = fopen($save_path."tex/".$ruangan."_".$nama_lengkap."_".$nama_master.'.tex', 'w');
            fwrite($fp, $content2);
            fclose($fp);

            $pdftk_file=$save_path.$ruangan."*.pdf";
            if($command_pdflatex==""){
                $command_pdflatex.= "pdflatex -output-directory ".$save_path." core/upload/tex/".$ruangan."_".$nama_lengkap."_".$nama_master.".tex";
            }
            else{
                $command_pdflatex.= " && pdflatex -output-directory ".$save_path." core/upload/tex/".$ruangan."_".$nama_lengkap."_".$nama_master.".tex";
            }
            // exec("pdflatex -output-directory ".$save_path." core/upload/tex/".$ruangan."_".$nama_lengkap."_".$nama_master.".tex");

            // echo "pdflatex -output-directory core/upload/pdf core/upload/tex/".$ruangan."_".$nama_lengkap."_".$nama_master.".tex";

            $time++;

        }
            exec(' cd '.$save_path.'tex; for i in *.tex; do pdflatex -output-directory '.$save_path.' $i;done');
            echo(' cd '.$save_path.'tex; for i in *.tex; do pdflatex -output-directory '.$save_path.' $i;done');

            $filename = $save_path."all/"."{$ruangan}-NilaiAkademik-{$nama_master}.pdf";
            $log_txt="/srv/www/htdocs/siip/cat.polda/logs/hasil2.txt";

            $status= system("/usr/bin/pdftk {$pdftk_file} cat output ".$filename." > ".$log_txt." &");
            echo $status;
            // echo "/usr/bin/pdftk {$pdftk_file} cat output ".$filename." > ".$log_txt." &";
            $ujian->update_data(" status_pdf=2 "," ujian "," id_ujian='$id' ");
?> 
