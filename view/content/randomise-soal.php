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
<div class="modal fade" id="editModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#f9af00 !important; color:white;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color:white">×</span></button>
        <h4 class="modal-title">Edit Pengguna</h4>
      </div>
      <div class="modal-body">
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
    // function refreshTabel(){
    //   tableLive.draw();
    // }
    // setInterval(refreshTabel, 3000);
  });
</script>