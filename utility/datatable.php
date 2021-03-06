<?php 
require_once __DIR__ . '/../config/config.php';

class datatable extends config {
    function get_soal_view($table,$table2,$joinKey, $primaryKey, $columns){ 
        $config = new config();
        $sql_details = $config->sql_details();
        require( 'ssp.class.php' );
        echo json_encode(
            SSP::simpleJoin2( $_POST, $sql_details, $table,$joinKey,$primaryKey, $columns)
        );        
    }
    function get_peserta_view($table,$joinKey, $primaryKey, $columns){ 
        $config = new config();
        $sql_details = $config->sql_details();
        require( 'ssp.class.php' );
        echo json_encode(
            SSP::simpleJoin2( $_POST, $sql_details, $table,$joinKey,$primaryKey, $columns)
        );        
    }
    function get_log_peserta_view($table,$joinKey, $primaryKey, $columns){ 
        $config = new config();
        $sql_details = $config->sql_details();
        require( 'ssp.class.php' );
        echo json_encode(
            SSP::simpleJoin( $_POST, $sql_details, $table,$joinKey,$primaryKey, $columns)
        );        
    }
    function get_table($table, $primaryKey, $columns, $where){
        $config = new config();
        $sql_details = $config->sql_details();
        require( 'ssp.class.php' );
        echo json_encode(
            SSP::simplewhere( $_POST, $sql_details, $table, $primaryKey, $columns, $where)
        );        
    }
    function get_table_join($table, $primaryKey, $columns, $tableJoin, $joinWhere, $where){
        $config = new config();
        $sql_details = $config->sql_details();
        require( 'ssp.class.php' );
        echo json_encode(
            SSP::simplejoin3( $_POST, $sql_details, $table, $primaryKey, $columns, $tableJoin, $joinWhere, $where)
        );        
    }
    function get_table_more_join($table, $primaryKey, $columns, $join, $where){
        $config = new config();
        $sql_details = $config->sql_details();
        require( 'ssp.class.php' );
        echo json_encode(
            SSP::simplemorejoin( $_POST, $sql_details, $table, $primaryKey, $columns, $join, $where)
        );        
    }
    function get_table_exjoin($table, $primaryKey, $columns, $join, $where){
        $config = new config();
        $sql_details = $config->sql_details();
        require( 'ssp.customized.class.php' );
        echo json_encode(
            SSP::simple( $_POST, $sql_details, $table, $primaryKey, $columns, $join, $where)
        );        
    }
    function get_table_group($table, $primaryKey, $columns, $where, $group){
        $config = new config();
        $sql_details = $config->sql_details();
        require( 'ssp.class.php' );
        echo json_encode(
            SSP::simplewheregroup( $_POST, $sql_details, $table, $primaryKey, $columns, $where,$group)
        );        
    }
}
