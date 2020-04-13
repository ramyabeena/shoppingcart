<?php
include ("../includes/config.inc.php");
$objAdmin=new Admin(); 
$objAdmin->Admin_authetic();
$objAdminMgmt	= new AdminManagement();
$objSmarty=new Smarty();
$objSite=new Site();
#.............................................................................................
$id = $_REQUEST['id'];
//print_r($_REQUEST);
if($_REQUEST['edit'] == "Edit")
{
    $objAdminMgmt->editBanner();
}
#VALUE
$banner_link = $objSite->getValue("banner_link","banner","banner_id='".$id."'");
$objSmarty->assign("banner_link",$banner_link);
#.............................................................................................
#SMARTY ASSIGNING 
$main_content = $objSmarty->fetch('editBanner.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');

?>