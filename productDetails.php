<?php 
include "includes/config.inc.php";
$objSmarty=new Smarty();
$objCommon=new Common();
$objSite=new Site();
$menucategoryList=$objSite->getMultiValue("category_id,category_name","category" , "category_status='1'");
$objSmarty ->assign('menucategoryList',$menucategoryList);
$objSmarty->assign("objCommon", $objCommon);
$objCommon->getTitle();
#...................................................................................
#product list
$product_id=$_REQUEST["product_id"];
$productDetail=$objCommon->showProduct($product_id);
$objSmarty->assign("productDetail", $productDetail);

$relatedList=$objCommon->relatedList($product_id);
$objSmarty->assign("relatedList",$relatedList);
#...................................................................................

#...................................................................................
$main_content = $objSmarty->fetch('productDetails.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');
?>