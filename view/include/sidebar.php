<aside class="main-sidebar">
  <section class="sidebar">
    
    <ul class="sidebar-menu">
      <li class="header">MENU NAVIGATION</li>
      <?php if ($_SESSION['level'] == 1): ?>
        <li class="active"><a href="<?php echo $url_rewrite;?>content/"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/rkakl"><i class="fa fa-table"></i> <span>Master Soal</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/rkakl"><i class="fa fa-group"></i> <span>Data Peserta</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/rab"><i class="fa fa-desktop"></i> <span>Monitoring Peserta</span></a></li>        
        <li><a href="<?php echo $url_rewrite;?>content/user"><i class="fa fa-gear"></i> <span>Manage Admin</span></a></li>
      <?php else : ?>
        <li class="active"><a href="<?php echo $url_rewrite;?>content/"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/rkakl"><i class="fa fa-table"></i> <span>Master Soal</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/rkakl"><i class="fa fa-table"></i> <span>Data Peserta</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/rab"><i class="fa fa-table"></i> <span>Monitoring Peserta</span></a></li> 
      <?php endif ?>
    </ul>
  </section>
</aside>