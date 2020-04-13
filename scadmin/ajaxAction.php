<?php
include ("../includes/config.inc.php");
$objSite	= new Site();
$action=$_POST["action"];
if($action=="showSubCategories")
{
	$category_id=$_POST["category_id"];
	$html="";
	$result=$objSite->getMultiValue("subcategory_id,subcategory_name", "subcategory", "category_id='".$category_id."'");
	$html.='<select class="form-control" id="sel2" name="subcategory_id" required>
              	<option value="">Choose the Sub category name</option>';
	for($i=0;$i< count($result);$i++)
	{
	    $html.='<option value="'.$result[$i]["subcategory_id"].'">'.$result[$i]["subcategory_name"].'</option>';
	}
	$html.='</select>';
	echo $html;
	exit();
}

?>