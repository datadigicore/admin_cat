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



