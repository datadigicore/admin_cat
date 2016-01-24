<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Data Ujian
      <small>Management Control</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-group"></i> Data Ujian</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Input Data Ujian</h3>
          </div>
          <div class="box-body">
          <?php if (isset($_POST['message'])): ?>
            <div class="alert alert-<?php echo $_POST['alert']; ?> alert-dismissible">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <i class="icon fa fa-exclamation-triangle"></i><?php echo $_POST['message']; ?>
            </div>
          <?php endif ?>
            <div class="panel panel-default" style="margin-bottom:0">
              <div class="panel-heading te-panel-heading">
                <i class="glyphicon glyphicon-file"></i> Form Input
              </div>
              <div class="panel-body">
                <form class="form-horizontal" method="POST" action="<?php echo $url_rewrite;?>process/ujian/add">
                  <input type="hidden" name="Login" value="masuk">
                  <div class="form-group">
                    <label class="col-md-2 control-label">Kategori</label>
                    <div class="col-md-9">
                      <select type="text" class="form-control" id="kategori" name="kategori" required>
                      </select>
                    </div>
                  </div>
                  <!-- <div class="form-group">
                    <label class="col-md-2 control-label">Paket Soal</label>
                    <div class="col-md-9">
                      <select type="text" class="form-control" id="paket" name="paket">
                        <option value="" disabled selected>-- Pilih Paket Soal --</option>
                        <option value="1">Paket Soal A</option>
                        <option value="2">Paket Soal B</option>
                        <option value="3">Paket Soal C</option>
                        <option value="4">Paket Soal D</option>
                      </select>
                    </div>
                  </div> -->
                  <div class="form-group">
                    <label class="col-md-2 control-label">Tanggal</label>
                    <div class="col-md-9">
                      <div class='input-group date' id='datetime'>
                        <input type='text' class="form-control" name="tanggal" required/>
                        <span class="input-group-addon">
                          <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-2 control-label">Lama Ujian</label>
                    <div class="col-md-9">
                      <span style="position:absolute;margin:7px;right:50px">Menit</span>
                      <input type="number" class="form-control" name="lamaujian" placeholder="Lama Ujian" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-2 control-label">Jumlah Soal</label>
                    <div class="col-md-9">
                      <span style="position:absolute;margin:7px;right:50px">Soal</span>
                      <input type="number" class="form-control" name="jmlsoal" placeholder="Jumlah Soal" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-2 control-label">Jumlah Peserta</label>
                    <div class="col-md-9">
                      <span style="position:absolute;margin:7px;right:50px">Peserta</span>
                      <input type="number" class="form-control" name="jmlpeserta" placeholder="Jumlah Peserta" required>
                    </div>
                  </div>
                  <div class="form-group" style="margin-bottom:0">
                    <div class="col-md-offset-2 col-md-9">
                      <button type="submit" class="btn btn-flat btn-success pull-right">Submit</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>        
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Tabel Pengaturan Ujian</h3>
          </div>
          <div class="box-body">
            <table id="table" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>Id</th>
                  <th>Kategori</th>
                  <th>Tanggal Ujian</th>
                  <th>Lama Ujian</th>
                  <th>Jumlah Soal</th>
                  <th>Jumlah Peserta</th>
                  <th>Status Ujian</th>
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
<script>

  // Date.prototype.toDateInputValue = (function() {
  //     var local = new Date(this);
  //     local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
  //     return local.toJSON().slice(0,10);
  // });
  // $("#tanggal").val(new Date().toDateInputValue());
  $.ajax({
    type: "post",
    url : "<?php echo $url_rewrite;?>process/ujian/kategori",
    success: function(data)
    {
      $("#kategori").html(data);
    }
  });
  $(function () {
    $('#datetime').datetimepicker({
    });
    var table = $(".table").DataTable({
      "oLanguage": {
        "sInfoFiltered": ""
      },
      "processing": true,
      "serverSide": true,
      "scrollX": true,
      "ajax": {
        "url": "<?php echo $url_rewrite;?>process/ujian/table",
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
        {"targets" : 7}
      ],
      "order": [[ 0, "desc" ]]
    });
    function ajaxPostButton(action){
      $.ajax({
        type: "post",
        url : "<?php echo $url_rewrite;?>process/ujian/"+action,
        data: {key:row_id},
        success: function(data)
        {
          table.draw();
        }
      });
      return false;
    }
    $(document).on("click", "#acak", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      row_data = tabrow.data()[0];
      kategori_data = tabrow.data()[1];
      tanggal_data = tabrow.data()[2];
      lamaujian_data = tabrow.data()[3];
      jmlsoal_data = tabrow.data()[4];
      jmlpeserta_data = tabrow.data()[5];
      var $form=$(document.createElement('form')).css({display:'none'}).attr("method","POST").attr("action","<?php echo $url_rewrite;?>process/ujian/randomize");
      var $input=$(document.createElement('input')).css({display:'none'}).attr('name','kategori').val(kategori_data);
      var $input2=$(document.createElement('input')).css({display:'none'}).attr('name','tanggal').val(tanggal_data);
      var $input3=$(document.createElement('input')).css({display:'none'}).attr('name','lamaujian').val(lamaujian_data);
      var $input4=$(document.createElement('input')).css({display:'none'}).attr('name','jmlsoal').val(jmlsoal_data);
      var $input5=$(document.createElement('input')).css({display:'none'}).attr('name','jmlpeserta').val(jmlpeserta_data);
      $form.append($input).append($input2).append($input3).append($input4).append($input5);
      $("body").append($form);
      $form.submit();
    });
    $(document).on("click", "#aktif", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      row_id = tabrow.data()[0];
      action = "activate";
      ajaxPostButton(action);
    });
    $(document).on("click", "#verifikasi", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      row_id = tabrow.data()[0];
      action = "verification";
      ajaxPostButton(action);
    });
    $(document).on("click", "#mulai", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      row_id = tabrow.data()[0];
      action = "start";
      ajaxPostButton(action);
    });
    $(document).on("click", "#selesai", function (){
      var tr = $(this).closest('tr');
      tabrow = table.row( tr );
      row_id = tabrow.data()[0];
      action = "finish";
      ajaxPostButton(action);
    });
  });
</script>