<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Daftar Pengulangan Soal
      <small>Menu</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-group"></i> Data Pengulangan Soal</li>
    </ol>
  </section>
  <section class="content">          
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <?php $peserta = $ujian->get_data_peserta($_SESSION['ruangan']); ?>
          <?php $hasil = explode(",",$ujian->get_list_soal("s")); $no=1; ?>
          <div class="box-body">
              <label class="col-xs-2" for="sel1">Nomor Soal</label><!-- 
              <div class="col-xs-2"> 
                <button id="prev-soal" class="btn btn-primary btn-flat">Soal Sebelumnya</button>
              </div> -->
              <div class="col-md-2">
                <select class="form-control" id="select_soal">
                    <?php foreach ($hasil as $key => $value) { ?>            
                      <option id="<?php echo $no; ?>" value="<?php echo $value; ?>" ><b><?php echo $no;?></b></option>
                      <?php $no++; } 
                            $no=1;
                      ?>
                    </select>
              </div><!-- 

              <div class="col-xs-2"> 
              <button id="next-soal" class="btn btn-primary btn-flat">Soal Selanjutnya</button>
              </div>  -->            
          </div>
          <div class="box-body">
          <?php foreach ($peserta as $key => $value) { ?> 
            <div class="col-sm-2 form-group">
              <button id="<?php echo 'user_'.$value['id_peserta']; ?>" class="<?php echo 'btn btn-primary btn-flat peserta';?>"><?php echo $value['no_peserta']; ?></button>
            </div>
          <?php } ?>
        </div> 
        </div>        
      </div>
    </div>
  </section>
</div>


<script>
  $(function () {
    var table;
    var e = document.getElementById("select_soal");
    var strUser = e.options[e.selectedIndex].value;
    var nomor_soal = $("#select_soal option:selected").text();
    $(".select2").select2();
    $("#select_soal").select2({
          placeholder: "-- Pilih Soal --",
    });
    function tagSoal(soal){
       $('.peserta').removeClass('btn-primary');
       $('.peserta').removeClass('btn-danger');
       $('.peserta').addClass('btn-primary');
      $.ajax({
          type: "post",
          url: '<?php echo $url_rewrite;?>process/ujian/tanda_soal_per_peserta',
          data: {nomor_soal:soal},
          success: function (output) {
            
            var hasil = JSON.parse(output);
            var res = hasil.split(",");
            for (i = 0; i < res.length; i++) { 
                $("#user_"+res[i]).removeClass('btn-primary');
                $("#user_"+res[i]).addClass('btn-danger cancel');
            }
          }
      });
    }

    tagSoal(strUser);
    
    $('.peserta').on('click', function(){
      var param = $(this).attr('id');
      var data = param.split("_");
      keterangan = $('#keterangan').val();
      id_peserta = data[1];
      id_soal = $('#select_soal').val();
      aksi ="";
      id_batal=0;
      // if($('#'+param).hasClass('cancel')==true){
        // aksi="hapus_pengulangan";
        // id_batal=id_peserta;
      // }
      // else{
        aksi="add_pengulangan";
      // }
      $.ajax({
        type: "post",
        url: '<?php echo $url_rewrite;?>process/ujian/'+aksi,
        data: {keterangan:keterangan,id_soal:id_soal,id_peserta:id_peserta},
        success: function (output) {
          $("#table").DataTable().destroy();
          $("#table tbody").empty();
          tagSoal(id_soal);
          ;
        }
      });
    });

   $("#select_soal").change(function () {
          id_soal = this.value;
          $("#table").DataTable().destroy();
          $("#table tbody").empty();
          var nomor_soal = $("#select_soal option:selected").text();
          $("#judul").html("DAFTAR PESERTA YANG MENGULANG SOAL NOMOR "+nomor_soal);
          tagSoal(id_soal);

          
   });

  });
</script>