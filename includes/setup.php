<?php

    ob_start();            //Turn on output buffering
    @session_start();       //Initialize session data
    error_reporting(E_ALL ^ E_NOTICE);
    global $CFG;
    #BASE PATH & BASE URL
    $CFG['site']['base_path']    = dirname(dirname(__FILE__));
    $CFG['site']['base_url']     = "http://".$_SERVER['HTTP_HOST'];
     
    $CFG['db']['db_host']        = "localhost";
    $CFG['db']['db_name']        = "shoppingcart";
    $CFG['db']['db_user']        = "root";
    $CFG['db']['db_pwd']         = "";
  /**********************************************************************************************************/
?>
