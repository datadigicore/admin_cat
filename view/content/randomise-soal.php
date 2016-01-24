<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Acak Soal
      <small>Management Control</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-random"></i> Acak Soal</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-xs-6">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Data Acak Soal 1</h3>
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
      <div class="col-xs-6">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Data Acak Soal 2</h3>
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
      <div class="col-xs-6">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Data Acak Soal 3</h3>
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
      <div class="col-xs-6">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Data Acak Soal 4</h3>
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
  </section>
</div>
<div class="modal fade" id="chooseModal" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#f9af00 !important; color:white;">
        <h4 class="modal-title">Pilih Paket Soal</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <div class="col-xs-4">
            <button style="width:100%;height:120px;font-size:24px;font-weight:bold;">Paket A</button>
          </div>
          <div class="col-xs-4">
            <button style="width:100%;height:120px;font-size:24px;font-weight:bold;">Paket B</button>
          </div>
          <div class="col-xs-4">
            <button style="width:100%;height:120px;font-size:24px;font-weight:bold;">Paket C</button>
          </div>
        </div>
      </div>
      <div class="modal-footer" style="border:none">
      </div>
    </div>
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
        {"orderable": false,
         "data": null,
         "defaultContent":  '<div class="text-center">'+
                              '<a style="margin:0 2px;" id="btn-edt" href="#editModal" class="btn btn-xs btn-flat btn-success btn-sm" data-toggle="modal"><i class="fa fa-edit"></i> Revisi</a>'+
                            '</div>',
         "targets": 6 },
      ],
      "order": [[ 2, "asc" ]]
    });
    function refreshTabel(){
      $("#chooseModal").modal("show");
    }
    setTimeout(refreshTabel, 3000);
  });
</script>