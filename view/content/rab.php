<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Data RAB
      <small>Menu</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-table"></i> Data RAB</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
            <h3 class="box-title" style="margin-top:6px;">Table Rencana Anggaran Biaya</h3>

            <!-- <a href="<?php echo $url_rewrite;?>content/rab/add" class="btn btn-flat btn-success btn-sm pull-right">Tambah RAB</a> -->

            <a href="#addrab" data-toggle="modal" class="btn btn-flat btn-success btn-sm pull-right">Tambah RAB</a>

          </div>
          <div class="box-body">
            <?php if (isset($_POST['message'])): ?>
              <div class="alert alert-<?php echo $_POST['alert']; ?> alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <i class="icon fa fa-warning"></i><?php echo $_POST['message']; ?>
              </div>
            <?php endif ?>
            <table class="display table table-bordered table-striped" style="width:200px">
              <tr>
                <td><label>Tahun</label></td>
                <td>
                  <select class="form-control" name="tahun2" id="tahun2" required>
                    <?php for ($i=0; $i < count($tahun); $i++) { 
                      echo "<option value='".$tahun[$i]."'>".$tahun[$i].'</option>';
                    }?>
                  </select>
                </td>
              </tr>
              <?php if ($_SESSION['direktorat'] == "") { ?>
              <tr>
                <td><label>Direktorat</label></td>
                  <td>
                    <select id="direktorat2" name="direktorat2" class="form-control" onchange="search()">
                      <option value="5696">5696</option>
                      <option value="5697">5697</option>
                      <option value="5698">5698</option>
                      <option value="5699">5699</option>
                      <option value="5700">5700</option>
                    </select>
                  </td>
              </tr>
              <?php } else{ ?>
              <input type="hidden" id="direktorat" name="direktorat" value="<?php echo $_SESSION['direktorat']; ?>" />
              <?php } ?>
              <?php echo $url_rewrite;?>
            </table>
            <table id="table" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#11245B;color:white;">
                <tr>
                  <th>No</th>
                  <th>Kode RKAKL</th>
                  <th>Uraian Acara</th>
                  <th>Tanggal</th>
                  <th>Lokasi</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<div class="modal fade" id="addrab">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="<?php echo $url_rewrite;?>process/rab/save" method="POST" enctype="multipart/form-data">
        <div class="modal-header" style="background-color:#111F3F !important; color:white;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" style="color:white">×</span></button>
          <h4 class="modal-title">Add RAB</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>Tahun Anggaran</label>
            <select class="form-control" name="tahun" id="tahun" required>
              <?php for ($i=0; $i < count($tahun); $i++) { 
                echo "<option value='".$tahun[$i]."'>".$tahun[$i].'</option>';
              }?>
            </select>
          </div>
          <input type="hidden" id="prog" name="prog" value="06" />
          <?php if ($_SESSION['direktorat'] == "") { ?>
          <div class="form-group">
            <label>Kode Kegiatan</label>
            <select class="form-control" id="direktorat" name="direktorat" onchange="search()">
                <option value="5696">5696</option>
                <option value="5697">5697</option>
                <option value="5698">5698</option>
                <option value="5699">5699</option>
                <option value="5700">5700</option>
            </select>
          </div>
          <?php } else{ ?>
          <input type="hidden" id="direktorat" name="direktorat" value="<?php echo $_SESSION['direktorat']; ?>" />
          <?php } ?>
          <div class="form-group">
            <label>Output</label>
            <select class="form-control" id="output" name="output" onchange="chout()" required>
              <option>-- Pilih Output --</option>
            </select>
          </div>
          <div class="form-group">
            <label>Suboutput</label>
            <select class="form-control" id="soutput" name="soutput" onchange="chsout()" required>
              <option>-- Pilih Sub Output --</option>
            </select>
          </div>
          <div class="form-group">
            <label>Komponen</label>
            <select class="form-control" id="komp" name="komp" onchange="chkomp()" required>
              <option>-- Pilih Komponen --</option>
            </select>
          </div>
          <div class="form-group">
            <label>Sub Komponen</label>
            <select class="form-control" id="skomp" name="skomp" onchange="chskomp()" required>
              <option>-- Pilih Sub Komponen --</option>
            </select>
          </div>
          <div class="form-group">
            <label>Uraian Acara</label>
            <textarea rows="5" type="text" class="form-control" id="uraian" name="uraian" placeholder="Uraian Acara" style="resize:none;" required></textarea>
          </div>
          <div class="form-group">
            <label>Tanggal</label>
            <input class="form-control" type="text" name="tanggal"  placeholder="dd/mm/yyyy" />
          </div>
          <div class="form-group">
            <label>Lokasi Kegiatan</label>
            <input type="text" class="form-control" id="lokasi" name="lokasi" placeholder="Lokasi Kegiatan" required />
          </div>
          
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-flat btn-success">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="ajuan">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="<?php echo $url_rewrite;?>process/rab/ajukan" method="POST">
        <div class="modal-header" style="background-color:#111F3F !important; color:white;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" style="color:white">×</span></button>
          <h4 class="modal-title">Dialog Box</h4>
        </div>
        <div class="modal-body">
          <input type="hidden" id="id_rab_aju" name="id_rab_aju" value="" />
          <div class="form-group">
            <label>Apakah Anda Yakin Ingin Melakukan Pengajuan ?</label>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" data-dismiss="modal" class="btn btn-flat btn-warning">Tidak</button>
          <button type="submit" class="btn btn-flat btn-success">Ya</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="sahkan">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="<?php echo $url_rewrite;?>process/rab/sahkan" method="POST">
        <div class="modal-header" style="background-color:#111F3F !important; color:white;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" style="color:white">×</span></button>
          <h4 class="modal-title">Dialog Box</h4>
        </div>
        <div class="modal-body">
          <input type="hidden" id="id_rab_sah" name="id_rab_sah" value="" />
          <div class="form-group">
            <label>Apakah Anda Yakin Ingin Melakukan Pengesahan ?</label>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" data-dismiss="modal" class="btn btn-flat btn-warning">Tidak</button>
          <button type="submit" class="btn btn-flat btn-success">Ya</button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>

  $(function () {
     $( "#datepicker" ).datepicker({
        changeMonth: true,
        changeYear: true,
        format: 'dd/mm/yyyy'
      });
    var tahun = $('#tahun2').val();
    var direktorat = $('#direktorat2').val();
    var table = $("#table").DataTable({
      "oLanguage": {
        "sInfoFiltered": ""
      },
      "processing": true,
      "serverSide": true,
      // "scrollX": true,
      "ajax": {
        "url": "<?php echo $url_rewrite;?>process/rab/table",
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
      ],
      "order": [[ 0, "desc" ]]
    });
    $(document).on("click", "#btn-aju", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row(tr);
      $("#id_rab_aju").val(tabrow.data()[0]);
    });
    $(document).on("click", "#btn-sah", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row(tr);
      $("#id_rab_sah").val(tabrow.data()[0]);
    });
    chprog();
  });

  function search(){
    var tahun = $('#tahun2').val();
    var direktorat = $('#direktorat2').val();
    table.destroy();
    $('#table').DataTable({
      "scrollX": true,
      "bProcessing": true,
      "bServerSide": true,
      "sAjaxSource": "getRab",
      "fnServerParams": function ( aoData ) {
        aoData.push( { "name": "tahun", "value": tahun },
                      { "name": "direktorat", "value": direktorat } );
      }
    });
  }

  function chprog(){
    $("#output option").remove();   
    $("#soutput option").remove();   
    $("#komp option").remove();   
    $("#skomp option").remove();   
    $('#output').append('<option>-- Pilih Output --</option>');
    $('#soutput').append('<option>-- Pilih Sub Output --</option>');
    $('#komp').append('<option>-- Pilih Komponen --</option>');
    $('#skomp').append('<option>-- Pilih Sub Komponen --</option>');
    var tahun = $('#tahun').val();
    var direktorat = $('#direktorat').val();
    var prog = $('#prog').val();
    $.ajax({
      type: "POST",
      url: "<?php echo $url_rewrite;?>process/rab/getout",
      data: { 'prog' : prog,
              'tahun' : tahun,
              'direktorat' : direktorat
            },
      success: function(data){
        var obj = jQuery.parseJSON(data);
        for (var i = 0; i < obj.KDOUTPUT.length; i++) {
          $('#output').append('<option value="'+obj.KDOUTPUT[i]+'">'+obj.KDOUTPUT[i]+' - '+obj.NMOUTPUT[i]+'</option>')
        };
      },
    });
  }
  function chout(){
    var prog = $('#prog').val();
    var output = $('#output').val();
    var tahun = $('#tahun').val();
    var direktorat = $('#direktorat').val();
    alert('as');
    $.ajax({
      type: "POST",
      url: "<?php echo $url_rewrite;?>process/rab/getsout",
      data: { 'prog' : prog,
              'output' : output,
              'tahun' : tahun,
              'direktorat' : direktorat
            },
      success: function(data){
        var obj = jQuery.parseJSON(data);
        for (var i = 0; i < obj.KDSOUTPUT.length; i++) {
          $('#soutput').append('<option value="'+obj.KDSOUTPUT[i]+'">'+obj.KDSOUTPUT[i]+' - '+obj.NMSOUTPUT[i]+'</option>')
        };
      },
    });
  }
  function chsout(){
    $("#komp option").remove();   
    $("#skomp option").remove();   
    $('#komp').append('<option>-- Pilih Komponen --</option>');
    $('#skomp').append('<option>-- Pilih Sub Komponen --</option>');
    var tahun = $('#tahun').val();
    var direktorat = $('#direktorat').val();
    var prog = $('#prog').val();
    var output = $('#output').val();
    var soutput = $('#soutput').val();
    $.ajax({
      type: "POST",
      url: "<?php echo $url_rewrite;?>process/rab/getkomp",
      data: { 'prog' : prog,
              'output' : output,
              'soutput' : soutput,
              'tahun' : tahun,
              'direktorat' : direktorat
            },
      success: function(data){
        var obj = jQuery.parseJSON(data);
        for (var i = 0; i < obj.KDKMPNEN.length; i++) {
          $('#komp').append('<option value="'+obj.KDKMPNEN[i]+'">'+obj.KDKMPNEN[i]+' - '+obj.NMKMPNEN[i]+'</option>')
        };
      },
    });
  }
  function chkomp(){
    $("#skomp option").remove();   
    $('#skomp').append('<option>-- Pilih Sub Komponen --</option>');
    var tahun = $('#tahun').val();
    var direktorat = $('#direktorat').val();
    var prog = $('#prog').val();
    var output = $('#output').val();
    var soutput = $('#soutput').val();
    var komp = $('#komp').val();
    $.ajax({
      type: "POST",
      url: "<?php echo $url_rewrite;?>process/rab/getskomp",
      data: { 'prog' : prog,
              'output' : output,
              'soutput' : soutput,
              'komp' : komp,
              'tahun' : tahun,
              'direktorat' : direktorat
            },
      success: function(data){
        var obj = jQuery.parseJSON(data);
        for (var i = 0; i < obj.KDSKMPNEN.length; i++) {
          $('#skomp').append('<option value="'+obj.KDSKMPNEN[i]+'">'+obj.KDSKMPNEN[i]+' - '+obj.NMSKMPNEN[i]+'</option>')
        };
      },
    });
  }
</script>
