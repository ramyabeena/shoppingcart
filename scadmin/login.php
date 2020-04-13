<?php
include ("../includes/config.inc.php");
$objAdmin	= new Admin();
$objAdmin->Admin_Notauthetic();
$objSmarty=new Smarty();
if(isset($_POST['login']))
{
	$objAdmin->chkAdminLogin($_REQUEST);
}
$objSmarty->display('login.tpl');
?>