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
#category list
$objCommon->showCategoryList();
#...................................................................................
#Category List
$sideCategoryList=$objCommon->sideCategoryList();
$objSmarty->assign("sideCategoryList", $sideCategoryList);
#...................................................................................
$main_content = $objSmarty->fetch('showCategories.tpl');
$objSmarty->assign("MAIN_CONTENT", $main_content);
$objSmarty->display('main.tpl');
?>