<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Perencanaan Ujian Pengulangan
      <small>Menu</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-group"></i> Data Ujian Pengulangan</li>
    </ol>
  </section>
  <section class="content">          
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header with-border">
          <div class="box-body">
            <table id="table" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>ID</th>
                  <th>Ruangan</th>
                  <th>Mata Ujian</th>
                  <th>Waktu Ujian</th>
                  <th>Tindakan</th>
                </tr>
              </thead>
            </table>
          </div>
        </div>        
      </div>
    </div>
  </section>
</div>
<div class="modal fade" id="editModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#f9af00 !important; color:white;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color:white">×</span></button>
        <h4 class="modal-title">Pengaturan Ujian Ulang</h4>
      </div>
      <form method="post" action="<?php echo $url_rewrite;?>process/monitor/mulai_ujian_ulang">
      <div class="modal-body">
        <div class="form-group">
          <input type="hidden" class="form-control" id="idruang" name="idruang" placeholder="Id Peserta" readonly>
          <input type="hidden" class="form-control" id="idujian" name="idujian" placeholder="Id Peserta" readonly>
          <input type="text" class="form-control" id="noruangan" name="noruangan" placeholder="Nomor Peserta" readonly>
        </div>
        <div class="form-group">
          <input type="text" class="form-control" id="namamataujian" name="namamataujian" placeholder="Nama Peserta" readonly>
        </div>
        <div class="form-group">
          <span style="position:absolute;margin:7px;right:50px">Menit</span>
          <input type="number" class="form-control" name="tambahwaktu" placeholder="Tambahan Waktu Ujian" required>
        </div>
        <!-- <div class="form-group">
          <textarea class="form-control" name="alasan" placeholder="Alasan" style="resize:none;" required></textarea>
        </div> -->
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-flat btn-success">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>


<script>
  $(function () {
    var table;
    baca_tabel();

$(document).on("click", "#revisi", function (){
     var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      ujian_id = tabrow.data()[0];
      ruang_id = tabrow.data()[1];
      noruangan_data = tabrow.data()[1];
      namamataujian_data = tabrow.data()[2];
      $("#editModal").modal("show");
      $("#idujian").val(ujian_id);
      $("#idruang").val(ruang_id);
      $("#noruangan").val(noruangan_data);
      $("#namamataujian").val(namamataujian_data);
    });

function baca_tabel(){ 
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
        "url": "<?php echo $url_rewrite;?>process/ujian/table-ujian-pengulangan",
        "type": "POST"
      },
      "columnDefs" : [
        {"targets" : 0,
          visible:false},
        {"targets" : 1},
        {"targets" : 2},
        {"targets" : 3},
        {"targets" : 4}
      ],
      "order": [[ 0, "desc" ]]
    });
}

   
  });
</script>