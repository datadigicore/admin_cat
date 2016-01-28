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
            <h3 class="box-title" style="margin-top:6px;">Tabel Log Revisi</h3>
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
                  <th>Tambahan waktu</th>
                  <th>Alasan Revisi</th>
                  <th>Kategori Ujian</th>
                  <th>Status Ujian</th>
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
        "url": "<?php echo $url_rewrite;?>process/monitor/log",
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
         {"targets" : 7},
          {"targets" : 7},
              ],
      "order": [[ 1, "asc" ]]
    });
    
  });
</script>