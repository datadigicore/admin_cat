<?php
  $rs_nilai = $mdl_dashboard->getNilaiPeserta();
  $nilai = "[";
  $kat = "[";
  while($r=$db->fetch_array($rs_nilai)){
    // $nilai .=  "{
    //             name: 'Proprietary or Undetectable',
    //             y: $r[0]
    //         },";
    $nilai.="$r[0],";
    $kat.="$r[1],";
  }
  $nilai .= "]";
  $kat .= "]";

  $rs_kesatuan = $mdl_dashboard->getKesatuan();
  $kesatuan = "[";
  $jumlah = "[";
  while($r=$db->fetch_array($rs_kesatuan)){
    // $nilai .=  "{
    //             name: 'Proprietary or Undetectable',
    //             y: $r[0]
    //         },";
    $kesatuan.="'$r[0]',";
    $jumlah.="$r[1],";

  }
  $kesatuan .= "]";
  $jumlah .= "]";

  $rs_status = $mdl_dashboard->getStatus();
  
  $temp=0;
  while($r=$db->fetch_array($rs_status)){

    switch($r[0]){
      case 0:
      $status3="Belum Verifikasi";
      break;
      case 1:
      $status3="Sudah Verifikasi";
      break;
      case 2:
      $status3="Sedang Ujian";
      break;
      case 3:
      $status3="Sudah Selesai";
      break;
      case 4:
      case 5:
      $status3="Suspend";
      break;
      default:
      $status3="";
      break;
    } 
    $status2[$status3]+=$r[1];
  }

  $status4 = "[";
  $jumlah3 = "[";
  foreach ($status2 as $key => $value){
    $status4.="'$key',";
    $jumlah3.="$value,";
  }
  $status4 .= "]";
  $jumlah3 .= "]";
  // print_r($status2);
  // echo($status4);
  // echo($jumlah3);
?>
<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Dashboard
      <small>Menu</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-dashboard"></i> Dashboard</li>
    </ol>
  </section>
  <section class="content">
   <!--  <div class="row">
      <div class="col-lg-3 col-xs-6">
        <div class="small-box bg-aqua">
          <div class="inner">
            <h3>150</h3>
            <p>Laporan keluar</p>
          </div>
          <div class="icon">
            <i class="ion ion-document-text"></i>
          </div>
          <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <div class="col-lg-3 col-xs-6">
        <div class="small-box bg-green">
          <div class="inner">
            <h3>53<sup style="font-size: 20px">%</sup></h3>
            <p>Statistik Anggaran</p>
          </div>
          <div class="icon">
            <i class="ion ion-stats-bars"></i>
          </div>
          <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <div class="col-lg-3 col-xs-6">
        <div class="small-box bg-yellow">
          <div class="inner">
            <h3>44</h3>
            <p>Orang terdaftar</p>
          </div>
          <div class="icon">
            <i class="ion ion-person-add"></i>
          </div>
          <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <div class="col-lg-3 col-xs-6">
        <div class="small-box bg-red">
          <div class="inner">
            <h3>65</h3>
            <p>Data anggaran</p>
          </div>
          <div class="icon">
            <i class="ion ion-pie-graph"></i>
          </div>
          <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
    </div> -->
    <div class="row">
      <div class="col-lg-12 col-xs-12">
        <div class="box box-primary">
            <div class="box-body">
              <div class="chart tab-pane active" id="nilai-chart" style="position: relative; height: 300px;"></div>
          
            </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-12 col-xs-12">
        <div class="box box-primary">
            <div class="box-body">
              <div class="chart tab-pane active" id="kesatuan-chart" style="position: relative; height: 300px;"></div>
          
            </div>
        </div>
      </div>
    </div>

    <div class="row">
      <section class="col-lg-7 connectedSortable">
        
        <div class="box box-primary">
            <div class="box-body">
              <div class="chart tab-pane active" id="status-chart" style="position: relative; height: 300px;"></div>
          
            </div>
        </div>
        <!-- div class="nav-tabs-custom">
          <ul class="nav nav-tabs pull-right">
            <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>
            <li><a href="#sales-chart" data-toggle="tab">Donut</a></li>
            <li class="pull-left header"><i class="fa fa-inbox"></i> Data Anggaran</li>
          </ul>
          <div class="tab-content no-padding">
            
          </div>
        </div> -->
        <!-- div class="box box-primary">
          <div class="box-header">
            <i class="ion ion-clipboard"></i>
            <h3 class="box-title">Agenda Kegiatan</h3>
            <div class="box-tools pull-right">
              <ul class="pagination pagination-sm inline">
                <li><a href="#">&laquo;</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">&raquo;</a></li>
              </ul>
            </div>
          </div>
          <div class="box-body">
            <ul class="todo-list">
              <li>
                <span class="handle">
                  <i class="fa fa-ellipsis-v"></i>
                  <i class="fa fa-ellipsis-v"></i>
                </span>
                <input type="checkbox" value="" name="">
                <span class="text">Kegiatan Ristekdikti 1</span>
                <small class="label label-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
                <div class="tools">
                  <i class="fa fa-edit"></i>
                  <i class="fa fa-trash-o"></i>
                </div>
              </li>
              <li>
                <span class="handle">
                  <i class="fa fa-ellipsis-v"></i>
                  <i class="fa fa-ellipsis-v"></i>
                </span>
                <input type="checkbox" value="" name="">
                <span class="text">Kegiatan Ristekdikti 2</span>
                <small class="label label-info"><i class="fa fa-clock-o"></i> 4 hours</small>
                <div class="tools">
                  <i class="fa fa-edit"></i>
                  <i class="fa fa-trash-o"></i>
                </div>
              </li>
              <li>
                <span class="handle">
                  <i class="fa fa-ellipsis-v"></i>
                  <i class="fa fa-ellipsis-v"></i>
                </span>
                <input type="checkbox" value="" name="">
                <span class="text">Kegiatan Ristekdikti 3</span>
                <small class="label label-warning"><i class="fa fa-clock-o"></i> 1 day</small>
                <div class="tools">
                  <i class="fa fa-edit"></i>
                  <i class="fa fa-trash-o"></i>
                </div>
              </li>
              <li>
                <span class="handle">
                  <i class="fa fa-ellipsis-v"></i>
                  <i class="fa fa-ellipsis-v"></i>
                </span>
                <input type="checkbox" value="" name="">
                <span class="text">Kegiatan Ristekdikti 4</span>
                <small class="label label-success"><i class="fa fa-clock-o"></i> 3 days</small>
                <div class="tools">
                  <i class="fa fa-edit"></i>
                  <i class="fa fa-trash-o"></i>
                </div>
              </li>
              <li>
                <span class="handle">
                  <i class="fa fa-ellipsis-v"></i>
                  <i class="fa fa-ellipsis-v"></i>
                </span>
                <input type="checkbox" value="" name="">
                <span class="text">Kegiatan Ristekdikti 5</span>
                <small class="label label-primary"><i class="fa fa-clock-o"></i> 1 week</small>
                <div class="tools">
                  <i class="fa fa-edit"></i>
                  <i class="fa fa-trash-o"></i>
                </div>
              </li>
              <li>
                <span class="handle">
                  <i class="fa fa-ellipsis-v"></i>
                  <i class="fa fa-ellipsis-v"></i>
                </span>
                <input type="checkbox" value="" name="">
                <span class="text">Kegiatan Ristekdikti 6</span>
                <small class="label label-default"><i class="fa fa-clock-o"></i> 1 month</small>
                <div class="tools">
                  <i class="fa fa-edit"></i>
                  <i class="fa fa-trash-o"></i>
                </div>
              </li>
            </ul>
          </div>
          <div class="box-footer clearfix no-border">
            <button class="btn btn-default pull-right"><i class="fa fa-plus"></i> Add item</button>
          </div>
        </div> -->
        <!-- div class="box box-info">
          <div class="box-header">
            <i class="fa fa-envelope"></i>
            <h3 class="box-title">Kirim Pesan</h3>
            <div class="pull-right box-tools">
              <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
            </div>
          </div>
          <div class="box-body">
            <form action="#" method="post">
              <div class="form-group">
                <input type="email" class="form-control" name="emailto" placeholder="Email to:">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject" placeholder="Subject">
              </div>
              <div>
                <textarea class="textarea" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
              </div>
            </form>
          </div>
          <div class="box-footer clearfix">
            <button class="pull-right btn btn-default" id="sendEmail">Send <i class="fa fa-arrow-circle-right"></i></button>
          </div>
        </div> -->
      </section>
      <section class="col-lg-5 connectedSortable">
        <div class="box box-primary">
          <div class="box-header">
            <i class="ion ion-clipboard"></i>
            <h3 class="box-title">Grafik Gender Peserta</h3>
            
          </div>
          <div class="box-body">
            <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;"></div>
          </div>
        </div>
        <!-- div class="box box-solid bg-light-blue-gradient">
          <div class="box-header">
            <div class="pull-right box-tools">
              <button class="btn btn-primary btn-sm daterange pull-right" data-toggle="tooltip" title="Date range"><i class="fa fa-calendar"></i></button>
              <button class="btn btn-primary btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
            </div>
            <i class="fa fa-map-marker"></i>
            <h3 class="box-title">
              Data Anggaran Keluar Negeri
            </h3>
          </div>
          <div class="box-body">
            <div id="world-map" style="height: 250px; width: 100%;"></div>
          </div>
          <div class="box-footer no-border">
            <div class="row">
              <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                <div id="sparkline-1"></div>
                <div class="knob-label">2013</div>
              </div>
              <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                <div id="sparkline-2"></div>
                <div class="knob-label">2014</div>
              </div>
              <div class="col-xs-4 text-center">
                <div id="sparkline-3"></div>
                <div class="knob-label">2015</div>
              </div>
            </div>
          </div>
        </div>
        <div class="box box-solid bg-teal-gradient">
          <div class="box-header">
            <i class="fa fa-th"></i>
            <h3 class="box-title">Data Anggaran</h3>
            <div class="box-tools pull-right">
              <button class="btn bg-teal btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
              <button class="btn bg-teal btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
          </div>
          <div class="box-body border-radius-none">
            <div class="chart" id="line-chart" style="height: 250px;"></div>
          </div>
          <div class="box-footer no-border">
            <div class="row">
              <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                <input type="text" class="knob" data-readonly="true" value="20" data-width="60" data-height="60" data-fgColor="#39CCCC">
                <div class="knob-label">Anggaran Akomodasi</div>
              </div>
              <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                <input type="text" class="knob" data-readonly="true" value="50" data-width="60" data-height="60" data-fgColor="#39CCCC">
                <div class="knob-label">Anggaran Kegiatan</div>
              </div>
              <div class="col-xs-4 text-center">
                <input type="text" class="knob" data-readonly="true" value="30" data-width="60" data-height="60" data-fgColor="#39CCCC">
                <div class="knob-label">Anggaran Sisa</div>
              </div>
            </div>
          </div>
        </div>
        <div class="box box-solid bg-green-gradient">
          <div class="box-header">
            <i class="fa fa-calendar"></i>
            <h3 class="box-title">Calendar</h3>
            <div class="pull-right box-tools">
              <div class="btn-group">
                <button class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></button>
                <ul class="dropdown-menu pull-right" role="menu">
                  <li><a href="#">Add new event</a></li>
                  <li><a href="#">Clear events</a></li>
                  <li class="divider"></li>
                  <li><a href="#">View calendar</a></li>
                </ul>
              </div>
              <button class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
              <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
          </div>
          <div class="box-body no-padding">
            <div id="calendar" style="width: 100%"></div>
          </div>
          <div class="box-footer text-black">
            <div class="row">
              <div class="col-sm-6">
                <div class="clearfix">
                  <span class="pull-left">Task #1</span>
                  <small class="pull-right">90%</small>
                </div>
                <div class="progress xs">
                  <div class="progress-bar progress-bar-green" style="width: 90%;"></div>
                </div>
                <div class="clearfix">
                  <span class="pull-left">Task #2</span>
                  <small class="pull-right">70%</small>
                </div>
                <div class="progress xs">
                  <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="clearfix">
                  <span class="pull-left">Task #3</span>
                  <small class="pull-right">60%</small>
                </div>
                <div class="progress xs">
                  <div class="progress-bar progress-bar-green" style="width: 60%;"></div>
                </div>
                <div class="clearfix">
                  <span class="pull-left">Task #4</span>
                  <small class="pull-right">40%</small>
                </div>
                <div class="progress xs">
                  <div class="progress-bar progress-bar-green" style="width: 40%;"></div>
                </div>
              </div>
            </div>
          </div>
        </div -->
      </section>
    </div>
  </section>
</div>
<div class="modal fade" id="nilai-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Peserta dengan nilai <span id="nilai-psrt"></span></h4>
      </div>
      <div class="modal-body">
        <div class="row" style="margin:auto 10px">
        <table id="table-nilai" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>Id</th>
                  <th>No Peserta</th>
                  <th>Nama Peserta</th>
                  <th>Lokasi</th>
                  <th>Ruangan</th>
                </tr>
              </thead>
            </table>
          </div>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="kesatuan-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Peserta dengan dari kesatuan <span id="kesatuan-psrt"></span></h4>
      </div>
      <div class="modal-body">
        <div class="row" style="margin:auto 10px">
        <table id="table-kesatuan" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>Id</th>
                  <th>No Peserta</th>
                  <th>Nama Peserta</th>
                  <th>Lokasi</th>
                  <th>Ruangan</th>
                </tr>
              </thead>
            </table>
          </div>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="status-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Peserta dengan status <span id="status-psrt"></span></h4>
      </div>
      <div class="modal-body">
        <div class="row" style="margin:auto 10px">
        <table id="table-status" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>Id</th>
                  <th>No Peserta</th>
                  <th>Nama Peserta</th>
                  <th>Lokasi</th>
                  <th>Ruangan</th>
                </tr>
              </thead>
            </table>
          </div>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="gender-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Peserta <span id="gender-psrt"></span></h4>
      </div>
      <div class="modal-body">
        <div class="row" style="margin:auto 10px">
        <table id="table-gender" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>Id</th>
                  <th>No Peserta</th>
                  <th>Nama Peserta</th>
                  <th>Lokasi</th>
                  <th>Ruangan</th>
                </tr>
              </thead>
            </table>
          </div>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<script src="<?php echo $url_rewrite;?>static/dist/js/pages/dashboard.js"></script>
<script >
 $(document).ready(function(){
  $('#nilai-chart .highcharts-axis-labels text, .highcharts-axis-labels span').click(function () {
        var nil = this.textContent || this.innerText;
        showModal(nil);
    });
  $('#kesatuan-chart .highcharts-axis-labels text, .highcharts-axis-labels span').click(function () {
        var nil = this.textContent || this.innerText;
        showModalKesatuan(nil);
    });
  $('#status-chart .highcharts-axis-labels text, .highcharts-axis-labels span').click(function () {
        var nil = this.textContent || this.innerText;
        showModalStatus(nil);
    });
 });

 
 function showModal(nilai){
  
    $('#nilai-modal').modal('show');
    $('#nilai-psrt').html(nilai);
    if ($.fn.DataTable.isDataTable( '#table-nilai' ) ) {
        $("#table-nilai").DataTable().destroy();
      }
    tableLive = $("#table-nilai").DataTable({
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
        "data": {nilai:nilai},
        "url": "<?php echo $url_rewrite;?>process/monitor/nilai-chart",
        "type": "POST"
      },
      "columnDefs" : [
        {"targets" : 0,
         "visible" : false},
        {"targets" : 1},
        {"targets" : 2},
        {"targets" : 3},
        {"targets" : 4}
      ],
       dom: 'Bfrtip',
    buttons: [
           'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]
    });
  

    
 }
 function showModalGender(gender){
  
    $('#gender-modal').modal('show');
    $('#gender-psrt').html(gender);
    if(gender == "Pria"){
      jenkel = "P";
    }else{
      jenkel ="W";
    }
    if ($.fn.DataTable.isDataTable( '#table-gender' ) ) {
        $("#table-gender").DataTable().destroy();
      }
    tableLive = $("#table-gender").DataTable({
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
        "data": {jenkel:jenkel},
        "url": "<?php echo $url_rewrite;?>process/monitor/gender-chart",
        "type": "POST"
      },
      "columnDefs" : [
        {"targets" : 0,
         "visible" : false},
        {"targets" : 1},
        {"targets" : 2},
        {"targets" : 3},
        {"targets" : 4}
      ],
       dom: 'Bfrtip',
    buttons: [
           'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]
    });
  

    
 }
 function showModalKesatuan(kesatuan){
  
    $('#kesatuan-modal').modal('show');
    $('#kesatuan-psrt').html(kesatuan);
    if ($.fn.DataTable.isDataTable( '#table-kesatuan' ) ) {
        $("#table-kesatuan").DataTable().destroy();
      }
    tableLive = $("#table-kesatuan").DataTable({
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
        "data": {kesatuan:kesatuan},
        "url": "<?php echo $url_rewrite;?>process/monitor/kesatuan-chart",
        "type": "POST"
      },
      "columnDefs" : [
        {"targets" : 0,
         "visible" : false},
        {"targets" : 1},
        {"targets" : 2},
        {"targets" : 3},
        {"targets" : 4}
      ],
       dom: 'Bfrtip',
    buttons: [
           'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]
    });
  

    
 }
 function showModalStatus(nil){
  
    $('#status-modal').modal('show');
    
    switch(nil){
      case '0':
      status = 'Belum Verifikasi';
      break;
      case '1':
      status = 'Sudah Verifikasi';
      break;
      case '2':
      status = 'Sedang Ujian';
      break;
      case '3':
      status = 'Sudah Selesai';
      break;
      case '4': 
      case '5':
      status = 'Suspend';
      break;
      case 'Belum Verifikasi':
      status = 'Belum Verifikasi';
      nil = '0';
      break;
      case 'Sudah Verifikasi':
      status = 'Sudah Verifikasi';
      nil = '1';
      break;
      case 'Sedang Ujian':
      status = 'Sedang Ujian';
      nil = '2';
      break;
      case 'Sudah Selesai':
      status = 'Sudah Selesai';
      nil = '3';
      break;
      case 'Suspend':
      status = 'Suspend';
      nil = '4';
      break;
      default:
      status = 'tes';
      nil = '';
      break;
    }
    $('#status-psrt').html(status);
    if ($.fn.DataTable.isDataTable( '#table-status' ) ) {
        $("#table-status").DataTable().destroy();
      }
    tableLive = $("#table-status").DataTable({
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
        "data": {status:nil},
        "url": "<?php echo $url_rewrite;?>process/monitor/status-chart",
        "type": "POST"
      },
      "columnDefs" : [
        {"targets" : 0,
         "visible" : false},
        {"targets" : 1},
        {"targets" : 2},
        {"targets" : 3},
        {"targets" : 4}
      ],
       dom: 'Bfrtip',
    buttons: [
           'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ]
    });
 }
  $.ajax({url: "<?echo $url_rewrite?>process/dashboard/gender",
    type: 'POST',
    data: {},
    success: function(output) {
       var decodedDataChart = $.parseJSON(output);
        var gender = new Morris.Donut({
          element: 'sales-chart',
          resize: true,
          colors: ["#3c8dbc", "#f56954", "#00a65a"],
          data: [
            {label: "Pria", value: decodedDataChart[0]},
            {label: "Wanita", value: decodedDataChart[1]}
          ],
          hideHover: 'auto'
        })
        .on('click', function (i, row) {  
           var gen = row.label;
           showModalGender(gen);
        });
      

     },
    error: function (xhr, ajaxOptions, thrownError) {
        alert(xhr.status + " "+ thrownError);
  }});

    $('#nilai-chart').highcharts({
      legend: {
          enabled:false
        },

      chart: {
            type: 'column'
        },
        title: {
            text: 'Nilai Peserta'
        },
        subtitle: {
            text: 'Klik bar untuk melihat data peserta'
        },
      xAxis: {
            categories: <?php print_r($nilai)?>,
            title:{
              text:"Nilai"
            }
        },
        yAxis: {
            title:{
              text:"Jumlah Peserta"
            }
        },

        plotOptions: {
            series: {
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            var nil = this.category;
                            showModal(nil)
                        }
                    }
                }
            }
        },

        series: [{
            data: <?php print_r($kat)?>
        }],

    });

    $('#kesatuan-chart').highcharts({
      legend: {
          enabled:false
        },

      chart: {
            type: 'column'
        },
        title: {
            text: 'Kesatuan Asal Peserta'
        },
        subtitle: {
            text: 'Klik bar untuk melihat data peserta'
        },
      xAxis: {
            categories: <?php print_r($kesatuan)?>,
        title:{
              text:"Kesatuan"
            }
        },
        yAxis: {
            title:{
              text:"Jumlah Peserta"
            }
        },

        plotOptions: {
            series: {
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            var nil = this.category;
                            showModalKesatuan(nil)
                        }
                    }
                }
            }
        },

        series: [{
            data: <?php print_r($jumlah)?>
        }]
    });

    $('#status-chart').highcharts({
      legend: {
          enabled:false
        },

      chart: {
            type: 'column'
        },
        title: {
            text: 'Status Peserta'
        },
        subtitle: {
            text: 'Klik bar untuk melihat data peserta'
        },
      xAxis: {
            categories: <?php print_r($status4)?>,
        title:{
              text:"Status Peserta"
            }
        },
        yAxis: {
            title:{
              text:"Jumlah Peserta"
            }
        },

        plotOptions: {
            series: {
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            var nil = this.category;
                            switch(nil){
                              case 'Belum Verifikasi':
                              status = 0;
                              break;
                              case 'Sudah Verifikasi':
                              status = 1;
                              break;
                              case 'Sedang Ujian':
                              status = 2;
                              break;
                              case 'Sudah Selesai':
                              status = 3;
                              break;
                              case 'Suspend':
                              status = 4;
                              break;
                              default:
                              status = "";
                              break;
                            } 
                            showModalStatus(status);
                        }
                    }
                }
            }
        },

        series: [{
            data: <?php print_r($jumlah3)?>
        }]
    });
    $('#nilai-modal').on('show.bs.modal', function (e) {
      // var button = $(event.relatedTarget);
      // alert(JSON.stringify(button.data('foo')));
      

    });
</script>