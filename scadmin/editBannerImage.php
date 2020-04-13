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
    $objAdminMgmt->editBannerImage();
}
#VALUE
$banner_image = $objSite->getValue("banner_image","banner","banner_id='".$id."'");
$objSmarty->assign("banner_image",$banner_image);
#.............................................................................................
#SMARTY ASSIGNING 
$main_content = $objSmarty->fetch('editBannerImage.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');

?>