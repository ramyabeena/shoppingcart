<?php 
	/*	Class Function for Admin	*/

class Admin extends Site{
	
	#........................................................................................
	#ADMIN AUTHETICATION
	function Admin_Notauthetic(){
			
		if($_SESSION["adminid"]) {
			$this->redirectUrl("index.php");;
		}
	}
	#........................................................................................
	#ADMIN NOT AUTHETICATION
	function Admin_authetic(){
			
		if(!$_SESSION['adminid']) {
			$this->redirectUrl("login.php");
		}
	}
	#........................................................................................
	//Admin Login
	function AdminLogout(){
			
		session_destroy();
		unset($_SESSION);
		$this->redirectUrl("login.php");
	}
	#........................................................................................
	//Admin Login
	function chkAdminLogin()
	{
		global $objSmarty,$error;		
		$username	= addslashes($_REQUEST["username"]);
		$Password	= addslashes($_REQUEST["password"]);	
		
		$num_admin = $this->getNumvalues("adminlogin","adminlogin_username='".$username."' AND adminlogin_password='".$Password."'");
		$AdminId   = $this->getValue("adminlogin_id","adminlogin","adminlogin_username='".$username."' AND adminlogin_password='".$Password."' AND adminlogin_status = '1'");
		
		if($num_admin == 1){
			$_SESSION['adminid'] = $AdminId;
			$deptId = $this->getValue("adminlogin_department","adminlogin","adminlogin_id='".$AdminId."'");
			$_SESSION['deptid'] = $deptId;
			header("location:index.php");
			die();	
		}
		else{
			$error="Invalid Login or Contact Administrator";
			$objSmarty->assign("error",$error);
			return false;
		}
	}

}
?>