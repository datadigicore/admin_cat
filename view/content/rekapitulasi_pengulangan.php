<div class="content-wrapper">
  <section class="content">

    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Rekapitulasi Pengulangan Soal Listening</h3>
          </div>
          <?php $hasil = explode(",",$ujian->get_list_soal("s")); $no=1; ?>
          <div class="box-body">
                <label class="col-xs-1" for="sel1">Nomor Soal</label>
              <div class="col-xs-2">
                <select class="form-control" id="select_soal">
                    <?php foreach ($hasil as $key => $value) { ?>            
                      <option value="<?php echo $value; ?>" > <?php echo $no;?></option>
                      <?php $no++; } ?>
                    </select>
              </div>
          <div class="box-body">
          <?php foreach ($peserta as $key => $value) { ?> 
            <div class="col-sm-2 form-group">
              <button id="<?php echo $value['id_peserta']; ?>" class="<?php echo 'btn btn-primary btn-flat peserta';?>"><?php echo $value['no_peserta']; ?></button>
            </div>
          <?php } ?>
        </div> 
          <div class="box-body">
            <table id="table" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr><th style="text-align:center" colspan="7" id="judul"></th></tr>
                <tr>
                  <th>ID</th>
                  <th>Id Peserta</th>
                  <th>Id Ujian</th>
                  <th>No Peserta</th>
                  <th>Soal</th>
                  <th>Nama</th>
                  <th>Aksi</th>
                </tr>
              </thead>
            </table>
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
    // alert(strUser);
    function tagSoal(soal){
      $.ajax({
          type: "post",
          url: '<?php echo $url_rewrite;?>process/ujian/tanda_soal_per_peserta',
          data: {nomor_soal:soal},
          success: function (output) {
            
            var hasil = JSON.parse(output);
            var res = hasil.split(",");
            for (i = 0; i < res.length; i++) { 
                $("#"+res[i]).removeClass('btn-primary');
                $("#"+res[i]).addClass('btn-danger');
            }
          }
      });
    }

    tagSoal(strUser);

    $('.peserta').on('click', function(){
      var param = $(this).attr('id');
      keterangan = $('#keterangan').val();
      id_peserta = $(this).attr('id');
      id_soal = $('#select_soal').val();
      $.ajax({
        type: "post",
        url: '<?php echo $url_rewrite;?>process/ujian/add_pengulangan',
        data: {keterangan:keterangan,id_soal:id_soal,id_peserta:id_peserta},
        success: function (output) {
          $("#table").DataTable().destroy();
          $("#table tbody").empty();
          baca_tabel(id_soal);
          tagSoal(strUser);
          ;
        }
      });
    });
    $(".select2").select2();
        $("#select_peserta").select2({
          placeholder: "-- Pilih Kode Item Barang --",
        });
        $("#select_soal").select2({
          placeholder: "-- Pilih Kode Item Barang --",
        });
    baca_tabel(strUser);
     $("#judul").html("DAFTAR PESERTA YANG MENGULANG SOAL NOMOR "+nomor_soal);
    // $('#btn-next').click(function() {
    //   pref_value = $('#select_soal option:selected').next().val();    
    //   current_value = $('#select_soal option:selected').val();
    //   // alert(current_value+" Point to : "+pref_value);
    //   if(pref_value!=undefined){
    //     $('#select_soal option:selected').next().attr('selected', 'selected');
    //     // alert($('#select_soal').val());  
    //   }    
    // });

    //  $('#btn-prev').click(function() {
    //   pref_value = $('#select_soal option:selected').prev().val();    
    //   current_value = $('#select_soal option:selected').val();
    //   // alert(current_value+" Point to : "+pref_value);
    //   if(pref_value!=undefined){
    //     $('#select_soal option:selected').prev().attr('selected', 'selected');
    //     // alert($('#select_soal').val());  
    //   }    
    // });
$("#btn-submit").click(function() {
  keterangan = $('#keterangan').val();
  id_peserta = $('#select_peserta').val();
  id_soal = $('#select_soal').val();
  $.ajax({
        type: "post",
        url: '<?php echo $url_rewrite;?>process/ujian/add_pengulangan',
        data: {keterangan:keterangan,id_soal:id_soal,id_peserta:id_peserta},
        success: function (output) {

          $("#table").DataTable().destroy();
          $("#table tbody").empty();
          baca_tabel(id_soal);
          ;
        }
  });
});
$("#btn-next").click(function() {
  var nextElement = $('#select_soal > option:selected').next('option');
  if (nextElement.length > 0) {
    // $('#select_soal > option:selected').removeAttr('selected');
    $('#select_soal option:selected').next().attr('selected', 'selected');
  }
});

$("#btn-prev").click(function() {
  var nextElement = $('#select_soal > option:selected').prev('option');
  if (nextElement.length > 0) {
    $('#mycars > option:selected').removeAttr('selected').prev('option').attr('selected', 'selected');
  }
});

 $("#select_soal").change(function () {
        $id_soal = this.value;
        $("#table").DataTable().destroy();
        $("#table tbody").empty();
        baca_tabel($id_soal);
        var nomor_soal = $("#select_soal option:selected").text();
        $("#judul").html("DAFTAR PESERTA YANG MENGULANG SOAL NOMOR "+nomor_soal);

        
    });
function baca_tabel(id_soal){ 
 table = $(".table").DataTable({
      dom: 'lBfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
      "oLanguage": {
        "sInfoFiltered": ""
      },
      "processing": true,
      "serverSide": true,
      "scrollX": true,
      "ajax": {
        "url": "<?php echo $url_rewrite;?>process/ujian/table-pengulangan/"+id_soal,
        "type": "POST"
      },
      "columnDefs" : [
        {"targets" : 0,
          visible:false},
        {"targets" : 1,
          visible:false},
        {"targets" : 2,
          visible:false},
        {"targets" : 3},
        {"targets" : 4,
          visible:false},
        {"targets" : 5},
        {"targets" : 6}
      ],
      "order": [[ 0, "desc" ]]
    });
}
    $(document).on("click", "#hapus", function (){
      id_soal =  $("#select_soal").val();
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      row_id = tabrow.data()[1];
      // alert(row_id+id_soal)
      $.ajax({
        type: "post",
        url: '<?php echo $url_rewrite;?>process/ujian/hapus_pengulangan',
        data: {id_peserta:row_id},
        success: function (output) {
          $("#table").DataTable().destroy();
          $("#table tbody").empty();
          baca_tabel(id_soal);
          ;
        }
      });
    });
    $(document).on("click", "#btn-edt", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      $("#id").val(tabrow.data()[0]);
      $("#noujian").val(tabrow.data()[1]);
      $("#lokasi").val(tabrow.data()[2]);
      $("#ruang").val(tabrow.data()[3]);
      $("#nama").val(tabrow.data()[4]);
      $("#pangkat").val(tabrow.data()[5]);
      $("#kesatuan").val(tabrow.data()[6]);
      $("#nrp").val(tabrow.data()[7]);
      $.ajax({
        type: "post",
        url : "<?php echo $url_rewrite;?>process/user/ruangan",
        data : {key:$("#lokasi").val()},
        success: function(data)
        {
          $("#ruang").html(data);
        }
      });
    });
   
  });
</script>