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
    $objAdminMgmt->editCategory();
}
#VALUE
$category_name = $objSite->getValue("category_name","category","category_id='".$id."'");
$objSmarty->assign("category_name",$category_name);
#.............................................................................................
#SMARTY ASSIGNING 
$main_content = $objSmarty->fetch('editCategory.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');

?>