<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Data Pengguna
      <small>Management Control</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-group"></i> Data Pengguna</li>
      <li><i class="fa fa-user"></i> Tambah Pengguna</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-md-9 col-xs-12">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Tambah Pengguna</h3>
          </div>
          <form method="POST" action="<?php echo $url_rewrite;?>process/user/add">
            <div class="box-body">
              <?php if (isset($_POST['message'])): ?>
                <div class="alert alert-success alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <i class="icon fa fa-check"></i><?php echo $_POST['message']; ?>
                </div>
              <?php endif ?>
              <div class="form-group">
                <input type="text" class="form-control" name="username" placeholder="Username" required>
              </div>
              <div class="form-group">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
              </div>
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
              <div class="form-group">
                <select class="form-control" name="status" required>
                  <option value="1" selected>Aktif</option>
                  <option value="0">Tidak Aktif</option>
                </select>
              </div>
            </div>
            <div class="box-footer">
              <button type="submit" class="btn btn-flat btn-success pull-right">Submit</button>
            </div>
          </form>
        </div>        
      </div>
    </div>
  </section>
</div>
<script type="text/javascript">
  function clear(){
    $("#form-lokasi").attr("hidden", "true");
    $("#lokasi").removeAttr("required");
    $("#form-ruangan").attr("hidden", "true");
    $("#ruangan").removeAttr("required");
  }
  $("#level").change(function(){
    if ($(this).val() == 2) {
      clear();
      $("#form-lokasi").removeAttr("hidden");
      $("#lokasi").attr("required", "true");
      $.ajax({
        type: "post",
        url : "<?php echo $url_rewrite;?>process/user/lokasi",
        success: function(data)
        {
          $("#lokasi").html(data);
        }
      });
    }
    else if ($(this).val() == 3) {
      clear();
      $("#form-lokasi").removeAttr("hidden");
      $("#lokasi").attr("required", "true");
      $("#form-ruangan").removeAttr("hidden");
      $("#ruangan").attr("required", "true");
      $.ajax({
        type: "post",
        url : "<?php echo $url_rewrite;?>process/user/lokasi",
        success: function(data)
        {
          $("#lokasi").html(data);
        }
      });
      $("#lokasi").change(function(){
        $.ajax({
          type: "post",
          url : "<?php echo $url_rewrite;?>process/user/ruangan",
          data : {key:$(this).val()},
          success: function(data)
          {
            $("#ruangan").html(data);
          }
        });
      })
    }
  });
</script>