<?php 
include "includes/config.inc.php";
$objSmarty=new Smarty();
$objSite=new Site();
$objCommon=new Common();
$menucategoryList=$objSite->getMultiValue("category_id,category_name","category" , "category_status='1'");
$objSmarty->assign('menucategoryList',$menucategoryList);
$objSmarty->assign("objCommon", $objCommon);
$objCommon->getTitle();
#...................................................................................
#Banner List
$bannerList=$objSite->bannerList();
$objSmarty->assign("bannerList", $bannerList);
#...................................................................................
#Product List
$productList=$objSite->productIndexList();
$objSmarty->assign("productList", $productList);
$main_content = $objSmarty->fetch('index.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');
?>