<?php 
include "includes/config.inc.php";
$objSmarty=new Smarty();
$objCommon=new Common();
$objSite=new Site();
$menucategoryList=$objSite->getMultiValue("category_id,category_name","category" , "category_status='1'");
$objSmarty ->assign('menucategoryList',$menucategoryList);
$objSmarty->assign("objCommon", $objCommon);
#...................................................................................
$privacypolicy = stripslashes($objSite->getValue("privacypolicy","privacypolicy","1=1"));
$objSmarty->assign("privacypolicy", $privacypolicy);

#...................................................................................
#Product List
$productList=$objSite->productIndexList();
$objSmarty->assign("productList", $productList);
#...................................................................................
$main_content = $objSmarty->fetch('privacypolicy.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');
?>