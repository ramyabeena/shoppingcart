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
    $objAdminMgmt->addCategory();
}
#.............................................................................................
#SMARTY ASSIGNING 
$objSmarty = new Smarty();
$req_file_name=$objSite->get_file_name();
$objSmarty ->assign("req_file_name",$req_file_name);
$main_content = $objSmarty->fetch('addCategory.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');

?>