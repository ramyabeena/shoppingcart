<?php
include ("../includes/config.inc.php");
include("../includes/FCKeditor/fckeditor.php");
$sBasePath = "../includes/FCKeditor/";
$objAdmin=new Admin(); 
$objAdmin->Admin_authetic();
$objAdminMgmt	= new AdminManagement();
$categoryList=$objAdminMgmt->categoryList();
$objSmarty=new Smarty();
$objSite=new Site();

$oFCKeditor 			= new FCKeditor('content') ;
$oFCKeditor->BasePath	= $sBasePath ;
$Editor1 				= $oFCKeditor->Create() ;
$objSmarty->assign("Editor1", "$Editor1");
#.............................................................................................
//print_r($_REQUEST);
if($_REQUEST['add'] == "Add")
{
    $objAdminMgmt->addProduct();
}
#.............................................................................................
#SMARTY ASSIGNING
$req_file_name=$objSite->get_file_name();
$objSmarty ->assign("req_file_name",$req_file_name);
$objSmarty->assign("categoryList",$categoryList);
$main_content = $objSmarty->fetch('addProduct.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');

?>