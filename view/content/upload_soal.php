<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Data Bank Soal
      <small>Menu</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-table"></i> Data Soal</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title" style="margin-top:6px;">Table Soal CAT POLDA</h3>
            <a href="#importModal" data-toggle="modal" class="btn btn-flat btn-success btn-sm pull-right">Import Soal</a>
          </div>
          <div class="box-body">
            <?php 
            if (isset($_POST['message'])): ?>
              <div class="alert alert-<?php echo $_POST['alert']; ?> alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <i class="icon fa fa-warning"></i><?php echo $_POST['message']; ?>
              </div>
            <?php endif ?>
            <table id="table" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#11245B;color:white;">
                <tr>
                  <th>NO.</th>
                  <th>Tanggal Upload</th>
                  <th>Nama Soal</th>
                  <th>Kategori</th>
                  <th>Penulis</th>
                  <th>Hash</th>
                  <th>Uploader</th>
                  <th>Status</th>
                </tr>
              </thead>
            </table>
          </div>
        </div>        
      </div>
    </div>
  </section>
</div>
<div class="modal fade" id="importModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="<?php echo $url_rewrite;?>process/upload/import" method="POST" enctype="multipart/form-data">
        <div class="modal-header" style="background-color:#111F3F !important; color:white;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" style="color:white">×</span></button>
          <h4 class="modal-title">Import Soal</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <input type="text" id="penulis" name="penulis" class="form-control" placeholder="Penulis Soal">
          </div>
          <div class="form-group">
            <select name="kategori" id="kategori" class="form-control">
              <option>Pilih Kategori</option>
              <?php
               $qry = $db->query("select id_master, nama_master from master_kategori");
               while ($row = $db->fetch_object($qry)) {
                    $id = $row->id_master;
                    $kategori = $row->nama_master;
                    echo "<option value=\"$id\">$kategori</option>";
               }
               ?>
            </select>
          </div>
          <div class="form-group">
            <input type="file" id="fileimport" name="fileimport" style="display:none;">
            <a id="selectbtn" class="btn btn-flat btn-primary" style="position:absolute;right:16px;">Select File</a>
            <input type="text" id="filename" class="form-control" placeholder="Pilih File .xls / .xlsx" readonly>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-flat btn-success">Upload Data</button>
        </div>
      </form>
    </div>
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
      "oLanguage": {
        "sInfoFiltered": ""
      },
      "processing": true,
      "serverSide": true,
      "scrollX": true,
      "ajax": {
        "url": "<?php echo $url_rewrite;?>process/upload/table-soal",
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
      ],
      "order": [[ 0, "desc" ]]
    });
    $(document).on("click", "#btn-edt", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row(tr);
      $("#tglimport").val('Tahun Anggaran : '+tabrow.data()[4]);
      $("#thnanggaran").val(tabrow.data()[4]);
    });
    $(document).on("click", "#btn-viw", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row(tr);
      var f = document.createElement('form');
      f.setAttribute('method','post');
      f.setAttribute('target','_blank');
      f.setAttribute('action','<?php echo $url_rewrite;?>process/rkakl/view');
      var i = document.createElement('input');
      i.setAttribute('type','text');
      i.setAttribute('name','filename');
      i.setAttribute('value', tabrow.data()[7]);
      f.appendChild(i);
      document.body.appendChild(f);
      f.submit();
    });
  });
</script>