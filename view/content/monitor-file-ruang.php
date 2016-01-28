<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Monitoring File
      <small>Management Control</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-desktop"></i> Monitoring File</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Tabel Proses File</h3>
          </div>
          <div class="box-body">
            <table id="table" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>NO</th>
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
<script>
  $(function () {
    var table = $("#table").DataTable({
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
        "url": "<?php echo $url_rewrite;?>process/monitor/file-lokasi",
        "type": "POST",
        "data": {'lokasi':'<?php echo $lokasi ?>'}
      },
      "columnDefs" : [
        {"targets" : 0},
        {"targets" : 1},
        {"orderable": false,
         "data": null,
         "defaultContent":  '<div class="text-center">'+
                              '<a style="margin:0 2px;" id="btn-edt" href="#editModal" class="btn btn-sm btn-flat btn-primary" data-toggle="modal"><i class="fa fa-arrow-circle-o-right"></i> Proses File</a>'+
                            '</div>',
         "targets": 2 }
      ],
      "order": [[ 1, "asc" ]]
    });
  });
</script>