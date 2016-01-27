<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Data Pengguna
      <small>Management Control</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-group"></i> Data Pengguna</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Tabel Pengguna</h3>
            <a href="<?php echo $url_rewrite;?>content/adduser" class="btn btn-flat btn-success btn-sm pull-right">Tambah Pengguna</a>
          </div>
          <div class="box-body">
            <?php if (isset($_POST['message'])): ?>
              <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <i class="icon fa fa-check"></i><?php echo $_POST['message']; ?>
              </div>
            <?php endif ?>
            <table id="table" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>Id</th>
                  <th>Username</th>
                  <th>Status</th>
                  <th>Lokasi</th>
                  <th>Ruangan</th>
                  <th>Kewenangan</th>
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
    <form method="post" action="<?php echo $url_rewrite;?>process/user/edt">
    <input type="hidden" class="form-control" id="idedt" name="idedt" placeholder="">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#f9af00 !important; color:white;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" style="color:white">×</span></button>
          <h4 class="modal-title">Edit Pengguna</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <div class="checkbox icheck" style="position:absolute;margin:6px;right:16px;background:white;">
              <input type="checkbox" id="checkuser">  
            </div>
            <input type="text" class="form-control" id="username" name="username" placeholder="Username" readonly>
          </div>
          <div class="form-group">
            <div class="checkbox icheck" style="position:absolute;margin:6px;right:16px;background:white;">
              <input type="checkbox" id="checkpass">
            </div>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password" readonly>
          </div>
          <div class="form-group">
            <select class="form-control" name="level" id="level" required>
              <option value="" disabled selected>-- Pilih Kewenangan --</option>
              <option value="2">Admin Lokasi</option>
              <option value="3">Admin Ruangan</option>
            </select>
          </div>
          <div class="form-group" id="form-lokasi" hidden>
            <select class="form-control" name="lokasi" id="lokasi">
              <option value="" disabled selected>-- Pilih Lokasi --</option>
            </select>
          </div>
          <div class="form-group" id="form-ruangan" hidden>
            <select class="form-control" name="ruangan" id="ruangan">
              <option value="" disabled selected>-- Pilih Ruangan --</option>
            </select>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-flat btn-success">Simpan Perubahan</button>
        </div>
      </div>
    </form>
  </div>
</div>
<div class="modal fade" id="hapusModal">
  <div class="modal-dialog">
    <form method="post" action="<?php echo $url_rewrite;?>process/user/del">
    <input type="hidden" class="form-control" id="iddel" name="iddel" placeholder="">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#d73925 !important; color:white;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" style="color:white">×</span></button>
          <h4 class="modal-title">Hapus Pengguna</h4>
        </div>
        <div class="modal-body">
          Apa Anda Yakin Ingin Menghapus Pengguna?
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-flat btn-danger">Hapus Pengguna</button>
        </div>
      </div>
    </form>
  </div>
</div>
<script>
  $(function () {
    var table = $(".table").DataTable({
      "oLanguage": {
        "sInfoFiltered": ""
      },
      "processing": true,
      "serverSide": true,
      "scrollX": true,
      "ajax": {
        "url": "<?php echo $url_rewrite;?>process/user/table",
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
        {"orderable": false,
         "data": null,
         "defaultContent":  '<div class="text-center">'+
                              '<a style="margin:0 2px;" id="btn-edt" href="#editModal" class="btn btn-xs btn-flat btn-success btn-sm" data-toggle="modal"><i class="fa fa-edit"></i> Edit</a>'+
                              '<a style="margin:0 2px;" id="btn-del" href="#hapusModal" class="open-deleteProject btn btn-xs btn-flat btn-danger btn-sm" data-toggle="modal"><i class="fa fa-trash-o"></i> Hapus</a>'+
                            '</div>',
         "targets": 6 },
         {"targets" : 7,
         "visible" : false},
         {"targets" : 8,
         "visible" : false}
      ],
      "order": [[ 0, "desc" ]]
    });
    $(document).on("click", "#nonaktif", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      row_id = tabrow.data()[0];
      $.ajax({
        type: "post",
        url : "<?php echo $url_rewrite;?>process/user/activate",
        data: {key:row_id},
        success: function(data)
        {
          table.draw();
        }
      });
      return false;
    });
    $(document).on("click", "#aktif", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      row_id = tabrow.data()[0];
      $.ajax({
        type: "post",
        url : "<?php echo $url_rewrite;?>process/user/deactivate",
        data: {key:row_id},
        success: function(data)
        {
          table.draw();
        }
      });
      return false;
    });
    $(document).on("click", "#btn-edt", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      $("#idedt").val(tabrow.data()[0]);
    });
    $(document).on("click", "#btn-del", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      $("#iddel").val(tabrow.data()[0]);
    });
  });
  function clear(){
    $("#form-lokasi").attr("hidden", "true");
    $("#lokasi").removeAttr("required");
    $("#form-ruangan").attr("hidden", "true");
    $("#ruangan").removeAttr("required");
  }
  $("#level").change(function(){
    if ($(this).val() == 2) {
      clear();
      $("#form-lokasi").removeAttr("hidden");
      $("#lokasi").attr("required", "true");
      $.ajax({
        type: "post",
        url : "<?php echo $url_rewrite;?>process/user/lokasi",
        success: function(data)
        {
          $("#editModal").modal("show");
          $("#lokasi").html(data);
        }
      });
    }
    else if ($(this).val() == 3) {
      clear();
      $("#form-lokasi").removeAttr("hidden");
      $("#lokasi").attr("required", "true");
      $("#form-ruangan").removeAttr("hidden");
      $("#ruangan").attr("required", "true");
      $.ajax({
        type: "post",
        url : "<?php echo $url_rewrite;?>process/user/lokasi",
        success: function(data)
        {
          $("#editModal").modal("show");
          $("#lokasi").html(data);
        }
      });
      $("#lokasi").change(function(){
        $.ajax({
          type: "post",
          url : "<?php echo $url_rewrite;?>process/user/ruangan",
          data : {key:$(this).val()},
          success: function(data)
          {
            $("#editModal").modal("show");
            $("#ruangan").html(data);
          }
        });
      })
    }
  });
</script>