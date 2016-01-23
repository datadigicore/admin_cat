    <footer class="main-footer">
      <div class="pull-right hidden-xs">
        CAT Polda 2016
      </div>
      <strong>Copyright &copy; 2016 <a href="#">Gunadarma University</a>.</strong> All rights reserved.
    </footer>
  </div>
</body>
<script type="text/javascript">
  function reposition() {
    var modal = $(this),
    dialog = modal.find('.modal-dialog');
    modal.css('display', 'block');
    dialog.css("margin-top", Math.max(0, ($(window).height() - dialog.height()) / 2));
  }
  $('.modal').on('show.bs.modal', reposition);
  $(window).on('resize', function() {
    $('.modal:visible').each(reposition);
  });
</script>