
<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Verifikasi
      <small>Verifikasi Soal</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-desktop"></i> Verifikasi Soal</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class=" col-xs-12">
        <div class="box">
          
          <div class="box-body">
           <table id="table" class="table">
            <thead>
              <th width="5%"></th>
              <th>Daftar Pertanyaan, Pilihan Jawaban, dan Kunci Jawaban</th>
            </thead>
            <tbody>
              <?php foreach ($hasil as $key => $value) { ?>
                <tr>
                <td><?php $key++; echo "<b>".$key."</b>"; ?></td>
                <td><?php echo "<b>".$value['soal']."</b><br><br>"; ?>
                  <div class="radio list">   
                <?php    foreach ($value['pilihan'] as $pilihan) {
                      echo '<p><label>'.$pilihan['full'].'</label></p>'; 
                    } ?>
                    </div>
                 <?php   echo "<p></p>Jawaban Terpilih : "."<b>".$value['fulljwb']."</b><br>";
                         echo "Jawaban Benar : "."<b>".$value['kunci']."</b><br>";
                ?></td>
                </tr>
         <?php   } ?>
         </tbody>
            </table>
          </div>
        </div>        
      </div>
    </div>
  </section>
</div>

<script>
  $(function () {
  $('#table').DataTable( {
    "responsive":true,
    "bLengthChange":false,
    "bFilter":false,
    "scrollY":        "350px",
    "scrollCollapse": true,
    "paging":false
});
    
  });
</script>