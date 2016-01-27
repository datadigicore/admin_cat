<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Monitoring Peserta
      <small>Management Control</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-desktop"></i> Monitoring Peserta</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Tabel Pengaturan Peserta</h3>
          </div>
          <div class="box-body">
            <table id="table" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>Id</th>
                  <th>No Peserta</th>
                  <th>Nama Peserta</th>
                  <th>Lokasi</th>
                  <th>Ruangan</th>
                  <th>Kategori Ujian</th>
                  <th>Aksi</th>
                </tr>
              </thead>
            </table>
          </div>
        </div>        
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Tabel Live Monitoring</h3>
          </div>
          <div class="box-body">
            <table id="tableLive" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>Id</th>
                  <th>No Peserta</th>
                  <th>Nama Peserta</th>
                  <th>Lokasi</th>
                  <th>Ruangan</th>
                  <th>Kategori Ujian</th>
                  <th>Status Ujian</th>
                  <th>Score</th>
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
        <h4 class="modal-title">Revisi Pengguna</h4>
      </div>
      <form method="post" action="<?php echo $url_rewrite;?>process/monitor/revisi">
      <div class="modal-body">
        <div class="form-group">
          <input type="hidden" class="form-control" id="idpeserta" name="key" placeholder="Id Peserta" readonly>
          <input type="text" class="form-control" id="nopeserta" name="nopeserta" placeholder="Nomor Peserta" readonly>
        </div>
        <div class="form-group">
          <input type="text" class="form-control" id="namapeserta" name="namapeserta" placeholder="Nama Peserta" readonly>
        </div>
        <div class="form-group">
          <span style="position:absolute;margin:7px;right:50px">Menit</span>
          <input type="number" class="form-control" name="tambahwaktu" placeholder="Tambahan Waktu Ujian" required>
        </div>
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
    var table = $("#table").DataTable({
      dom: 'Bfrtip',
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
        "url": "<?php echo $url_rewrite;?>process/monitor/table",
        "type": "POST"
      },
      "columnDefs" : [
        {"targets" : 0,
         "visible" : false},
        {"targets" : 1},
        {"targets" : 2},
        {"targets" : 3},
        {"targets" : 4},
        {"targets" : 5},
        {"targets" : 6},
      ],
      "order": [[ 1, "asc" ]]
    });
    var tableLive = $("#tableLive").DataTable({
      dom: 'Bfrtip',
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
        "url": "<?php echo $url_rewrite;?>process/monitor/score",
        "type": "POST"
      },
      "columnDefs" : [
        {"targets" : 0,
         "visible" : false},
        {"targets" : 1},
        {"targets" : 2},
        {"targets" : 3},
        {"targets" : 4},
        {"targets" : 5},
        {"targets" : 6},
        {"targets" : 7}
      ],
      "order": [[ 7, "desc" ]]
    });
    function refreshTabel(){
      tableLive.draw();
    }
    setInterval(refreshTabel, 3000);
    $(document).on("click", "#suspend", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      row_id = tabrow.data()[0];
      $.ajax({
        type: "post",
        url : "<?php echo $url_rewrite;?>process/monitor/suspend",
        data: {key:row_id},
        success: function(data)
        {
          table.draw();
        }
      });
      return false;
    });
    $(document).on("click", "#revisi", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      row_id = tabrow.data()[0];
      nopeserta_data = tabrow.data()[1];
      namapeserta_data = tabrow.data()[2];
      $("#editModal").modal("show");
      $("#idpeserta").val(row_id);
      $("#nopeserta").val(nopeserta_data);
      $("#namapeserta").val(namapeserta_data);
    });
  });
</script>