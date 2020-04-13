<?php
include ("../includes/config.inc.php");
$objAdmin=new Admin(); 
$objAdmin->Admin_authetic();
$objAdminMgmt	= new AdminManagement();
$objSite=new Site();
#.............................................................................................
//print_r($_REQUEST);
if($_REQUEST['add'] == "Add")
{
    $objAdminMgmt->addBanner();
}
#.............................................................................................
#SMARTY ASSIGNING
$objSmarty=new Smarty();
$main_content = $objSmarty->fetch('addBanner.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$req_file_name=$objSite->get_file_name();
$objSmarty ->assign("req_file_name",$req_file_name);
$objSmarty->display('main.tpl');

?>