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
    $objAdminMgmt->returnsrefunds();
}
#VALUE

$returnsrefunds = stripslashes($objSite->getValue("returnsrefunds","returnsrefunds","1=1"));

$oFCKeditor 			= new FCKeditor('content') ;
$oFCKeditor->BasePath	= $sBasePath ;
$oFCKeditor->Height		= 450 ;
$oFCKeditor->Value		= $returnsrefunds;
$Editor1 				= $oFCKeditor->Create() ;
$objSmarty->assign("Editor1", "$Editor1");
#............................................................................................
#SMARTY ASSIGNING
$req_file_name=$objSite->get_file_name();
$objSmarty ->assign("req_file_name",$req_file_name);
$main_content = $objSmarty->fetch('returnsrefunds.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');

?>