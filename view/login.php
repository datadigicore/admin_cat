<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Admin | CAT Polda</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" type="image/png" href="<?php echo $url_rewrite;?>static/dist/img/iconpolda.png"/>
    <link rel="stylesheet" href="<?php echo $url_rewrite;?>static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo $url_rewrite;?>static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<?php echo $url_rewrite;?>static/dist/css/style.min.css">
    <link rel="stylesheet" href="<?php echo $url_rewrite;?>static/dist/css/custom.css">
    <link rel="stylesheet" href="<?php echo $url_rewrite;?>static/plugins/iCheck/square/blue.css">
  </head>
  <body class="hold-transition login-page">
    <div class="dikti-header">
      <div class="top-header">
        <div class="container">
          <a href="#">
            <img src="<?php echo $url_rewrite;?>static/dist/img/iconpolda.png">
            <h3 class="logo nomargin">CAT Polda Metro</h3>
          </a>
        </div>
      </div>
    </div>
    <div class="login-box">
      <div class="login-logo">
        <img src="<?php echo $url_rewrite;?>static/dist/img/iconpolda.png" style="width:48px;"><br>
        <a href="" style="color:white;">Verifikasi Admin</a>
      </div>
      <div class="login-box-body">
      <?php if (isset($_POST['message'])): ?>
        <div class="alert alert-<?php echo $_POST['alert']; ?> alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <i class="icon fa fa-exclamation-triangle"></i><?php echo $_POST['message']; ?>
        </div>
      <?php endif ?>
        <p class="login-box-msg">Masukkan Username dan Password</p>
        <form action="<?php echo $url_rewrite;?>login" method="post">
          <div class="form-group has-feedback">
            <input type="text" class="form-control" name="username" placeholder="Username" required>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" name="password" placeholder="Password" required>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
            </div>
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Login</button>
            </div>
          </div>
        </form>
      </div>
      <div class="login-footer">
        © 2016 - CAT Polda
      </div>
    </div>
    <script src="<?php echo $url_rewrite;?>static/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="<?php echo $url_rewrite;?>static/bootstrap/js/bootstrap.min.js"></script>
    <script src="<?php echo $url_rewrite;?>static/plugins/iCheck/icheck.min.js"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%'
        });
      });
    </script>
  </body>
</html>