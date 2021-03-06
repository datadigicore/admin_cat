<aside class="main-sidebar">
  <section class="sidebar">
    
    <ul class="sidebar-menu">
      <li class="header">MENU NAVIGATION</li>
      <?php if ($_SESSION['level'] == 1): ?>
        <li class="active"><a href="<?php echo $url_rewrite;?>content/"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/upload-soal"><i class="fa fa-database"></i> <span>Upload Soal</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/upload-peserta"><i class="fa fa-database"></i> <span>Upload Peserta</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/data-peserta"><i class="fa fa-group"></i> <span>Data Peserta</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/monitor"><i class="fa fa-desktop"></i> <span>Monitoring Peserta</span></a></li>        
        <li><a href="<?php echo $url_rewrite;?>content/ujian"><i class="fa fa-gear"></i> <span>Manage Ujian</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/soal"><i class="fa fa-gear"></i> <span>Manage Soal</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/user"><i class="fa fa-user"></i> <span>Manage Admin</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/log"><i class="fa fa-desktop"></i> <span>Monitoring Revisi</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/file-ruangan"><i class="fa fa-file-text-o"></i> <span>Manage PDF</span></a></li>
      <?php elseif ($_SESSION['level'] == 2): ?>
        <li class="active"><a href="<?php echo $url_rewrite;?>content/"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/monitor"><i class="fa fa-desktop"></i> <span>Monitoring Peserta</span></a></li>        
        <li><a href="<?php echo $url_rewrite;?>content/user"><i class="fa fa-user"></i> <span>Manage Koordinator</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/file-ruangan"><i class="fa fa-file-text-o"></i> <span>Manage PDF</span></a></li>
      <?php else : ?>
        <li class="active"><a href="<?php echo $url_rewrite;?>content/"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/ujian_per_ruang"><i class="fa fa-gear"></i> <span>Manage Ujian</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/monitor"><i class="fa fa-desktop"></i> <span>Monitoring Peserta</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/data_pengulangan"><i class="fa fa-pencil-square"></i> <span>Pengulangan Soal</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/rekapitulasi_pengulangan"><i class="fa fa-pencil-square"></i> <span>Rekapitulasi Pengulangan</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/ujian_pengulangan"><i class="fa fa-unlock"></i> <span>Ujian Pengulangan</span></a></li>
        <li><a href="<?php echo $url_rewrite;?>content/file-ruangan"><i class="fa fa-file-text-o"></i> <span>Manage PDF</span></a></li>
      <?php endif ?>
    </ul>
  </section>
</aside>