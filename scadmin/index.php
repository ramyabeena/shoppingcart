<?php
include ("../includes/config.inc.php");
$objAdmin=new Admin(); 
$objAdmin->Admin_authetic();
$objSmarty=new Smarty();
$objSite=new Site();
#.............................................................................................
#SMARTY ASSIGNING
$req_file_name=$objSite->get_file_name();
$objSmarty ->assign("req_file_name",$req_file_name);
$main_content = $objSmarty->fetch('index.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');
?>