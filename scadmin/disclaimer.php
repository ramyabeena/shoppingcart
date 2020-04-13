<?php
include ("../includes/config.inc.php");
include("../includes/FCKeditor/fckeditor.php");
$sBasePath = "../includes/FCKeditor/";
//include_once "../includes/classes/class.Content.php";
$objAdmin=new Admin(); 
$objAdmin->Admin_authetic();
$objAdminMgmt	= new AdminManagement();
$objSite=new Site();
$objSmarty=new Smarty();
#.............................................................................................
if($_REQUEST['edit'] == "Edit")
{
    $objAdminMgmt->disclaimer();
}
#VALUE

$disclaimer = stripslashes($objSite->getValue("disclaimer","disclaimer","1=1"));

$oFCKeditor 			= new FCKeditor('content') ;
$oFCKeditor->BasePath	= $sBasePath ;
$oFCKeditor->Height		= 450 ;
$oFCKeditor->Value		= $disclaimer;
$Editor1 				= $oFCKeditor->Create() ;
$objSmarty->assign("Editor1", "$Editor1");
#............................................................................................
#SMARTY ASSIGNING
$req_file_name=$objSite->get_file_name();
$objSmarty ->assign("req_file_name",$req_file_name);
$main_content = $objSmarty->fetch('disclaimer.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');

?>