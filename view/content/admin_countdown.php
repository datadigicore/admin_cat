<style type="text/css">
    @font-face {
        font-family: 'Armata-Regular';
        src: url('../static/fonts/Armata-Regular.ttf');
    }

    #countdown {
        font-family: 'Armata-Regular', sans-serif;
        font-size: 90pt;
        color: white;
    }
    .tombol {
        min-width: 200px;
    }
    #jumbotron-polda{
        background-color: #1F1A17;
        box-shadow: 0 10px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19) !important;
    }
</style>
<div class="content-wrapper">
  <!-- <section class="content-header">
    <h1>
      Data Peserta CAT POLDA
      <small>Menu</small>
    </h1>
    <ol class="breadcrumb">
      <li><i class="fa fa-group"></i> Data Peserta</li>
    </ol>
  </section> -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
                    <div class="jumbotron text-center text-center" id="jumbotron-polda">
                        <div id="countdown">
                            99:99:99
                        </div> 
                    </div>
                    <div class="row">
                        <div class="button text-center">
                            <button class="btn btn-warning btn-lg tombol"><i class="fa fa-refresh" aria-hidden="true"></i> Refresh</button>
                            <button class="btn btn-success btn-lg tombol"><i class="fa fa-play-circle-o" aria-hidden="true"></i> Start</button>
                            <button class="btn btn-danger btn-lg tombol"><i class="fa fa-stop-circle-o" aria-hidden="true"></i> Stop</button>
                        </div>
                        
                    </div>
      </div>
    </div>
  </section>
</div>
<script>
var timerId // current timer if started
function sec_to_time(sec){
  var hour = parseInt(sec /3600)
  var minute = parseInt((sec%3600)/60)
  var second = parseInt((sec%3600)%60)
  // alert(hour+" "+minutes+" "+second);
  return [hour, minute, second]
}
//sec_to_time(3700)
var date = new Date()
var sisa
function update() {
  var date
  sisa = localStorage.getItem("last_second");
  if(sisa==0){
    clockStop()
  }
  date = sec_to_time(sisa)

  var hours = date[0]
  if (hours < 10) hours = '0'+hours
  document.getElementById('hour').innerHTML = hours

  var minutes = date[1]
  if (minutes < 10) minutes = '0'+minutes
  document.getElementById('min').innerHTML = minutes

  var seconds = date[2]
  if (seconds < 10) seconds = '0'+seconds
  document.getElementById('sec').innerHTML = seconds
  sisa--
  
  localStorage.setItem("last_second",sisa)
}

function clockStart() {
var duration = "<?php echo $count; ?>";
if(parseInt(duration)>0){  
  if (timerId) return
  localStorage.setItem("last_second",duration)
  timerId = setInterval(update, 1000)
  update()  // (*)
}
}

function clockStop() {
  clearInterval(timerId)
  timerId = null
}
clockStart(3454456);
</script>



