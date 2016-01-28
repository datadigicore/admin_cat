
<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Manage PDF
      <small>Management pdf</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-desktop"></i> Manage PDF</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-xs-offset-2 col-xs-8">
        <?php 
            if (isset($_POST['message'])): ?>
              <div class="alert alert-<?php echo $_POST['alert']; ?> alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <i class="icon fa fa-warning"></i><?php echo $_POST['message']; ?>
              </div>
            <?php endif ?>
            <!-- <div class="well">
              <select class="form-control" id="id-ujian">
                <option value=""> Pilih Ujian</option>
                <?php 
                  // $qry = $db->query("SELECT id_ujian, nama_master FROM ujian join master_kategori on ujian.id_kategori = master_kategori.id_master WHERE ujian.status_ujian = 3");
                  //  // echo "<option value=\"\" >pilih kode akun</option>";
                  //  while ($row = $db->fetch_object($qry)) {
                  //       $id = $row->id_ujian;
                  //       $nama = $row->nama_master;
                  //            echo "<option value=\"$id\" >$nama</option>";
                     
                  //  }
                ?>
              </select>
            </div> -->
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Tabel PDF Ruangan <?php echo $ruang ?></h3>
          </div>
          <div class="box-body">
            <table id="table" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>Nama</th>
                  <th>No Peserta</th>
                  <th>Ruangan</th>
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
    // $( document).on("submit",".download-perorangan",function( event ) {
    //   event.preventDefault();
    //   url = $(this).attr("action");
    //   fd = new FormData();
    //   $.ajax({
    //     type: "post",
    //     url : "<?php echo $url_rewrite;?>"+url,
    //     data : fd,
    //     success: function(data)
    //     {
    //       table.draw();
    //     }
    //   });
    // });

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
        "url": "<?php echo $url_rewrite;?>process/monitor/perorang",
        "type": "POST",
        "data":{ruang:'<?php echo $ruang ?>'}
      },
      "columnDefs" : [
        {"targets" : 0},
        {"targets" : 1},
        {"targets" : 2}
      ],
      "order": [[ 1, "asc" ]]
    });
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