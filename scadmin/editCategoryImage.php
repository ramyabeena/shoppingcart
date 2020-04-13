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
    $objAdminMgmt->editCategoryImage();
}
#VALUE
$category_image = $objSite->getValue("category_image","category","category_id='".$id."'");
$objSmarty->assign("category_image",$category_image);
#.............................................................................................
#SMARTY ASSIGNING 
$main_content = $objSmarty->fetch('editCategoryImage.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');

?>