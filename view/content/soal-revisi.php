<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Data Management Soal
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
          <div class="box-header with-border">
            <h3 class="box-title">Table Management Soal</h3>
          </div>
          <div class="box-body">
            <table id="table" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>Id</th>
                  <th>SOAL</th>
                  <th>Jawaban A</th>
                  <th>Jawaban B</th>
                  <th>Jawaban C</th>
                  <th>Jawaban D</th>
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
        <h4 class="modal-title">Revisi Soal</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <textarea type="text" class="form-control" id="soal" name="soal" placeholder="soal" required></textarea>
        </div>
        <div class="form-group">
          <input type="text" class="form-control" id="1" name="1" placeholder="Jawaban A" required>
        </div>
        <div class="form-group">
          <input type="text" class="form-control" id="2" name="2" placeholder="Jawaban B" required>
        </div>
        <div class="form-group">
          <input type="text" class="form-control" id="3" name="3" placeholder="Jawaban C" required>
        </div>
        <div class="form-group">
          <input type="text" class="form-control" id="4" name="4" placeholder="Jawaban D" required>
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
        "url": "<?php echo $url_rewrite;?>process/upload/table-soalsoal",
        "type": "POST",
        "data": {"idsoal" : <?php echo $id_soal;?>}
      },
      "columnDefs" : [
        {"targets" : 0,
          visible:false},
        {"targets" : 1},
        {"targets" : 2},
        {"targets" : 3},
        {"targets" : 4},
        {"targets" : 5},
        {"orderable": false,
         "data": null,
         "defaultContent":  '<div class="text-center">'+
                              '<a style="margin:0 2px;" id="btn-edt" href="#editModal" class="btn btn-xs btn-flat btn-success btn-sm" data-toggle="modal"><i class="fa fa-edit"></i> Edit Soal</a>'+
                            '</div>',
         "targets": 6 }
      ],
      "order": [[ 0, "desc" ]]
    });
  });
</script>