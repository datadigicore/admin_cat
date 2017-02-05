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
            <table id="table" class="display nowrap table table-bordered table-striped" cellspacing="0" width="100%">
              <thead style="background-color:#4A4545;color:white;">
                <tr>
                  <th>Mata Ujian</th>
                  <th>Tanggal Ujian / Waktu Mulai Ujian</th>
                  <th>Lama Ujian</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td><?php echo $mata_ujian ?></td>
                  <td><?php echo str_replace(" ", " / ",$tanggal_ujian) ?></td>
                  <td><?php echo $durasi_ujian." Menit" ?></td>
                </tr>
              </tbody>
            </table>
      </div>
      <div class="col-xs-12">
                    <div class="jumbotron text-center text-center" id="jumbotron-polda">
                        <div id="countdown">
                            <span id="hour">--</span>:<span id="min">--</span>:<span id="sec">--</span>
                        </div> 
                    </div>
                    <div class="row">
                        <div class="button text-center">
                            <button class="btn btn-warning btn-lg tombol" id="refresh"><i class="fa fa-refresh" aria-hidden="true"></i> Refresh</button>
                            <!--<button class="btn btn-success btn-lg tombol" id="start"><i class="fa fa-play-circle-o" aria-hidden="true"></i> Start</button>-->
                            <!--<button class="btn btn-danger btn-lg tombol" id="stop"><i class="fa fa-stop-circle-o" aria-hidden="true"></i> Stop</button>-->
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
clockStart();
</script>

<script>
    function init()
    {
            var conn = new WebSocket('ws://<?php echo $websocket;?>');

            conn.addEventListener("open", function (e) {

            });
            conn.addEventListener("error", function (e) {
                var n = noty({text: 'Failed to connect to websocket. Retrying ...',maxVisible: 1,timeout: 2000});
                init();
            });

            conn.onopen = function(e) {
                var n = noty({text: 'Success connect to websocket',maxVisible: 1,timeout: 2000});
                console.log("Connection established!");

            };

            conn.onmessage = function(e) {
                console.log(e.data);
                if (e.data == 2) {
                    static_event(e.data);
                }
            };

    }

    $("#refresh").on('click', function(){
        var conn = new WebSocket('ws://<?php echo $websocket;?>');
        conn.onopen = function(e) {
            conn.send('refresh');
        };
    });

    $("#start").on('click', function(){
        var conn = new WebSocket('ws://<?php echo $websocket;?>');
        conn.onopen = function(e) {
            conn.send(2);
        };
    });

    $("#stop").on('click', function(){
        var conn = new WebSocket('ws://<?php echo $websocket;?>');
        conn.onopen = function(e) {
            conn.send('stop');
        };
    });

    $(document).ready(function () {
        init();
    })
</script>



