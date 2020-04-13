function validateAdmin()
{
	var username=document.form1.username.value;
	var password=document.form1.password.value;
	if(username=="")
	{
		alert("Please enter your username:");
		document.form1.username.focus();
		return false;
	}
	if(password=="")
	{
		alert("Please enter your password:");
		document.form1.password.focus();
		return false;
	}
}

//CATEGORY ADD
function validateCategory(){
	
  var category_name=document.form1.category_name.value;
  var category_image= document.form1.category_image.value;
  if(category_name == "")
  {
    alert("Please enter Category Name ");
    document.form1.category_name.focus();
    return false;
  }
  if(category_image == "")
  {
    alert("Please choose the Catagory Image ");
    document.form1.category_image.focus();
    return false;
  }
}

function validateSubCategory()
{
  var category_id=document.form1.category_id.value;
  var subcategory_name=document.form1.subcategory_name.value;
  var subcategory_image= document.form1.subcategory_image.value;
  if(category_id=="")
  {
	  alert("Please select the category");
	  document.form1.category_id.focus();
	  return false;
  }
  if(subcategory_name == "")
  {
    alert("Please enter Sub Category Name ");
    document.form1.subcategory_name.focus();
    return false;
  }
  if(subcategory_image == "")
  {
    alert("Please choose the Sub Catagory Image ");
    document.form1.subcategory_image.focus();
    return false;
  }
}

function validateProduct()
{
	var category_id=document.form1.category_id.value;
	var subcategory_id=document.form1.subcategory_id.value;
	var product_name=document.form1.product_name.value;
	var product_price=document.form1.product_price.value;
	var product_image=document.form1.product_image.value;
	if(category_id=="")
	{
	  alert("Please select the category");
	  document.form1.category_id.focus();
	  return false;
	}
	if(subcategory_id=="")
	{
	  alert("Please select the subcategory");
	  document.form1.subcategory_id.focus();
	  return false;
	}
	if(product_name=="")
	{
	  alert("Please enter the product name");
	  document.form1.product_name.focus();
	  return false;
	}
	if(product_image == "")
	{
	alert("Please choose the Product image ");
	document.form1.product_image.focus();
	return false;
	}
}
function validateBanner()
{
	var banner_link=document.form1.banner_link.value;
	var banner_image=document.form1.banner_image.value;
	if(banner_link=="")
	{
	  alert("Please enter the banner link");
	  document.form1.banner_link.focus();
	  return false;
	}
	if(banner_image == "")
	{
	alert("Please choose the banner image ");
	document.form1.banner_image.focus();
	return false;
	}
}