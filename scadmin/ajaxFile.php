<?php
include "../includes/config.inc.php";
$objSite=new Site();
$action=$_POST["action"];
if($action=="changeToCategoryDeActive")
{
  $category_id=$_POST["category_id"];
  $query="UPDATE category SET category_status='0' WHERE category_id='".$category_id."'";
  $objSite->ExecuteQuery($query,"update");
  echo "Status changed successfully";
  exit();
}
if($action=="changeToCategoryActive")
{
    $category_id=$_POST["category_id"];
    $query="UPDATE category SET category_status='1' WHERE category_id='".$category_id."'";
    $objSite->ExecuteQuery($query,"update");
    echo "Status changed successfully";
    exit();
}
if($action=="deleteCategory")
{
    $category_id=$_POST["category_id"];
    $query="DELETE FROM category WHERE category_id='".$category_id."'";
    $objSite->ExecuteQuery($query,"delete");
    echo "Category deleted successfully";
    exit();
}
if($action=="changeToProductDeactive")
{
    $product_id=$_POST["product_id"];
    $query="UPDATE product SET product_status='0' WHERE product_id='".$product_id."'";
    $objSite->ExecuteQuery($query,"update");
    echo "Status changed successfully";
    exit();
}
if($action=="changeToProductActive")
{
    $product_id=$_POST["product_id"];
    $query="UPDATE product SET product_status='1' WHERE product_id='".$product_id."'";
    $objSite->ExecuteQuery($query,"update");
    echo "Status changed successfully";
    exit();
}
if($action=="deleteProduct")
{
    $product_id=$_POST["product_id"];
    $query="DELETE FROM product WHERE product_id='".$product_id."'";
    $objSite->ExecuteQuery($query,"delete");
    echo "Product deleted successfully";
    exit();
}
if($action=="changeToBannerDeactive")
{
    $banner_id=$_POST["banner_id"];
    $query="UPDATE banner SET banner_status='0' WHERE banner_id='".$banner_id."'";
    $objSite->ExecuteQuery($query,"update");
    echo "Status changed successfully";
    exit();
}
if($action=="changeToBannerActive")
{
    $banner_id=$_POST["banner_id"];
    $query="UPDATE banner SET banner_status='1' WHERE banner_id='".$banner_id."'";
    $objSite->ExecuteQuery($query,"update");
    echo "Status changed successfully";
    exit();
}
if($action=="deleteBanner")
{
    $banner_id=$_POST["banner_id"];
    $query="DELETE FROM banner WHERE banner_id='".$banner_id."'";
    $objSite->ExecuteQuery($query,"delete");
    echo "Banner deleted successfully";
    exit();
}
?>