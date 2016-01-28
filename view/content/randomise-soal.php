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
    <form method="post" action="<?php echo $url_rewrite;?>process/ujian/activateRandom">
    <input type="hidden" name="id" value="<?php echo $paket->id_ujian;?>">
    
    <div class="modal-content">
      <div class="modal-header" style="background-color:#f9af00 !important; color:white;">
        <h4 class="modal-title">Pilih Paket Soal</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
        <?php for ($i=0; $i < $paket->pilihan_paket ; $i++) { ?>
          <div class="col-xs-<?php echo floor(12/$paket->pilihan_paket);?>">
            <input type="submit" id="paket<?php echo chr($i+65); ?>" value="Paket <?php echo chr($i+65); ?>" name="paket" style="width:100%;height:120px;font-size:24px;font-weight:bold;">
          </div>
        <?php } ?>
        </div>
      </div>
      <div class="modal-footer" style="border:none">
      </div>
    </div>
    </form>
  </div>
</div>
<div class="modal fade" id="waitingModal" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#f9af00 !important; color:white;">
        <h4 class="modal-title">Mohon Menunggu</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <div class="progress progress-lg active">
            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
              Sedang Melakukan Proses Pengacakan
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  $(function () {
    $("#waitingModal").modal("show");
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
      $("#waitingModal").modal("hide");
      $("#chooseModal").modal("show");
    }
    setTimeout(refreshTabel, 3000);
  });
  $( "form" ).submit(function( event ) {
    $("#chooseModal").modal("hide");
    $("#waitingModal").modal("show");
  });
</script>