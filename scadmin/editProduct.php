<?php
include ("../includes/config.inc.php");
include("../includes/FCKeditor/fckeditor.php");
$sBasePath = "../includes/FCKeditor/";
//include_once "../includes/classes/class.Content.php";
$objAdmin=new Admin(); 
$objAdmin->Admin_authetic();
$objAdminMgmt	= new AdminManagement();
$categoryList=$objAdminMgmt->categoryList();
$subcategoryList=$objAdminMgmt->subcategoryList();


$objSmarty=new Smarty();
$objSite=new Site();
#.............................................................................................
$id = $_REQUEST['id'];
//print_r($_REQUEST);
if($_REQUEST['edit'] == "Edit")
{
    $objAdminMgmt->editProduct();
}
#VALUE
$category_id = $objSite->getValue("product_category_id","product","product_id='".$id."'");
$objSmarty->assign("category_id",$category_id);
$subcategory_id = $objSite->getValue("product_subcategory_id","product","product_id='".$id."'");
$objSmarty->assign("subcategory_id",$subcategory_id);
$product_name = $objSite->getValue("product_name","product","product_id='".$id."'");
$objSmarty->assign("product_name",$product_name);
$product_desc = strip_tags(stripslashes($objSite->getValue("product_description","product","product_id='".$id."'")));
$product_price = $objSite->getValue("product_price","product","product_id='".$id."'");
$objSmarty->assign("product_price",$product_price);



$oFCKeditor 			= new FCKeditor('content') ;
$oFCKeditor->BasePath	= $sBasePath ;
$oFCKeditor->Value		= $product_desc;
$Editor1 				= $oFCKeditor->Create() ;
$objSmarty->assign("Editor1", "$Editor1");
#.............................................................................................
#SMARTY ASSIGNING
$objSmarty->assign("categoryList",$categoryList);
$objSmarty->assign("subcategoryList",$subcategoryList);
$main_content = $objSmarty->fetch('editProduct.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');

?>