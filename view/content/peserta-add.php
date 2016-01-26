<div class="content-wrapper">
  <section class="content-header">
    <h1>
      Data Peserta
      <small>Management Control</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-group"></i> Data Peserta</li>
      <li><i class="fa fa-user"></i> Tambah Peserta</li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <div class="col-md-9 col-xs-12">
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title" style="margin-top:6px;">Tambah Peserta</h3>
          </div>
          <form method="POST" action="<?php echo $url_rewrite;?>process/peserta/add">
            <div class="box-body">
              <?php if (isset($_POST['message'])): ?>
                <div class="alert alert-success alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <i class="icon fa fa-check"></i><?php echo $_POST['message']; ?>
                </div>
              <?php endif ?>
              <div class="form-group">
                <input type="text" class="form-control" id="noujian" name="noujian" placeholder="No Ujian" required>
              </div>
              <div class="form-group">
                <select class="form-control" name="lokasi" id="lokasi" required>
                  <option value="" disabled selected>-- Pilih Lokasi --</option>
                </select>
              </div>
              <div class="form-group">
                <select class="form-control" name="ruang" id="ruang" required>
                  <option value="" disabled selected>-- Pilih Ruangan --</option>
                </select>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" id="nama" name="nama" placeholder="Nama Peserta" required>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" id="pangkat" name="pangkat" placeholder="Pangkat" required>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" id="kesatuan" name="kesatuan" placeholder="Kesatuan" required>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" id="nrp" name="nrp" placeholder="NRP" required>
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
        $("#ruang").html(data);
      }
    });
  })
</script>