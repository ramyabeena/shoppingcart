<?php
    @require 'setup.php';
	define("PAGE_LIMIT",10);	
	#------------------------------------------------------------------------------------
    #Global object for db connections
    global $objSite,$CFG; 
    $CFG['site']['include_path']	= $CFG['site']['base_path']."/includes";
	$db_host = $CFG['db']['db_host'];
	$db_name = $CFG['db']['db_name'];
	$db_user = $CFG['db']['db_user'];
	$db_pwd  = $CFG['db']['db_pwd'];
	
	#.............................................................................................
	#SMARTY SETTINGS
	require_once ($CFG['site']['include_path']."/smarty/Smarty.class.php");
	global $objSmarty;
	$objSmarty= new Smarty();
	#................................................................................................
	function __autoload($class_name)
	{
	    global $CFG;
	    //echo $class_name;
	    //echo "<br>";
	    @include $CFG['site']['include_path']."/classes/class.".$class_name.'.php';
	    if (!class_exists($class_name, false)) {
	        trigger_error("Unable to load class: $class_name", E_USER_WARNING);
	    }
	    
	}
	
	
	$objCommon= new Common();
	$objSmarty->assign('objCommon',$objCommon);
	#Common Class Files
	require_once ($CFG['site']['include_path']."/classes/class.Site.php");
	$objSite = new Site();
	$objSite = new Site($db_host,$db_name,$db_user,$db_pwd);
	$objSmarty->assign('objSite',$objSite);

?>