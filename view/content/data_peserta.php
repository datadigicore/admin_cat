<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Data Peserta CAT POLDA
      <small>Menu</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-table"></i> Data Peserta</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Tabel Peserta CAT</h3>
            <a href="<?php echo $url_rewrite;?>content/addpeserta" class="btn btn-flat btn-success btn-sm pull-right">Tambah Peserta</a>
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
                  <th>NO.</th>
                  <th>No. Ujian</th>
                  <th>Lokasi</th>
                  <th>Ruang</th>
                  <th>Nama</th>
                  <th>PKT</th>
                  <th>Kesatuan</th>
                  <th>NRP</th>
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
    <form method="post" action="<?php echo $url_rewrite;?>process/peserta/edit">
    <input type="hidden" class="form-control" id="id" name="id" placeholder="">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#f9af00 !important; color:white;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" style="color:white">×</span></button>
          <h4 class="modal-title">Edit Peserta</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <input type="text" class="form-control" id="noujian" name="noujian" placeholder="No Ujian">
          </div>
          <div class="form-group">
            <select class="form-control" name="lokasi" id="lokasi">
              <option value="" disabled selected>-- Pilih Lokasi --</option>
            </select>
          </div>
          <div class="form-group">
            <select class="form-control" name="ruang" id="ruang">
              <option value="" disabled selected>-- Pilih Ruangan --</option>
            </select>
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="nama" name="nama" placeholder="Nama Peserta">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="pangkat" name="pangkat" placeholder="Pangkat">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="kesatuan" name="kesatuan" placeholder="Kesatuan">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="nrp" name="nrp" placeholder="NRP">
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-flat btn-success">Simpan Perubahan</button>
        </div>
      </div>
    </form>
  </div>
</div>
<div class="modal fade" id="hapusModal">
  <div class="modal-dialog">
    <form method="post" action="<?php echo $url_rewrite;?>process/peserta/import">
    <input type="hidden" class="form-control" id="iduser" name="iduser" placeholder="">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#d73925 !important; color:white;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" style="color:white">×</span></button>
          <h4 class="modal-title">Hapus Peserta</h4>
        </div>
        <div class="modal-body">
          Apa Anda Yakin Ingin Menghapus Peserta?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-flat btn-danger">Hapus Peserta</button>
        </div>
      </div>
    </form>
  </div>
</div>
<script>
  $(function () {
    $('#selectbtn').click(function () {
      $("#fileimport").trigger('click');
    });
    $("#fileimport").change(function(){
      $("#filename").attr('value', $(this).val().replace(/C:\\fakepath\\/i, ''));
    });
    $('#selectbtn-revisi').click(function () {
      $("#fileimport-revisi").trigger('click');
    });
    $("#fileimport-revisi").change(function(){
      $("#filename-revisi").attr('value', $(this).val().replace(/C:\\fakepath\\/i, ''));
    });
    var table = $(".table").DataTable({
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
        "url": "<?php echo $url_rewrite;?>process/upload_peserta/table-peserta",
        "type": "POST"
      },
      "columnDefs" : [
        {"targets" : 0,
          visible:false},
        {"targets" : 1},
        {"targets" : 2},
        {"targets" : 3},
        {"targets" : 4},
        {"targets" : 5},
        {"targets" : 6},
        {"targets" : 7},
        {"orderable": false,
         "data": null,
         "defaultContent":  '<div class="text-center">'+
                              '<a style="margin:0 2px;" id="btn-edt" href="#editModal" class="btn btn-xs btn-flat btn-success btn-sm" data-toggle="modal"><i class="fa fa-edit"></i> &nbsp;&nbsp;Edit&nbsp;&nbsp;</a>'+
                            '</div>',
         "targets" : 8 }
      ],
      "order": [[ 0, "desc" ]]
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
    $.ajax({
      type: "post",
      url : "<?php echo $url_rewrite;?>process/user/lokasi",
      success: function(data)
      {
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
          $("#ruang").html(data);
        }
      });
    })
  });
</script>