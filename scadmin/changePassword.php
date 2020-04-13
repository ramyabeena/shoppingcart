<?php
include ("../includes/config.inc.php");
$objAdmin=new Admin(); 
$objAdmin->Admin_authetic();
$objAdminMgmt	= new AdminManagement();
$objSmarty=new Smarty();
$objSite=new Site();
#.............................................................................................
if($_REQUEST['edit'] == "Edit")
{
     
    $objAdminMgmt->editPassword();
}
#VALUE
$password = $objSite->getValue("adminlogin_password","adminlogin","adminlogin_id='1'");
$objSmarty->assign("password",$password);
#.............................................................................................
#SMARTY ASSIGNING 
$req_file_name=$objSite->get_file_name();
$objSmarty ->assign("req_file_name",$req_file_name);
$main_content = $objSmarty->fetch('changePassword.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');

?>