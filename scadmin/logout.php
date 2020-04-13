<?php

include ("../includes/config.inc.php");
#Classes
include_once ("../includes/classes/class.Admin.php");
$objAdmin	= new Admin();

$objAdmin->AdminLogout();
?>
