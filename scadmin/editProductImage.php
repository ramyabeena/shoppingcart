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
    $objAdminMgmt->editProductImage();
}
#VALUE
$product_image = $objSite->getValue("product_image","product","product_id='".$id."'");
$objSmarty->assign("product_image",$product_image);
#.............................................................................................
#SMARTY ASSIGNING 
$main_content = $objSmarty->fetch('editProductImage.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');

?>