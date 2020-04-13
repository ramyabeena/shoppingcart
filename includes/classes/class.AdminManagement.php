<?php 
	/*	Class Function for ADMIN MANAGEMENT	*/

class AdminManagement extends Site
{
	#--------------------------------------------------------------------------------
						# Category Management #
	#--------------------------------------------------------------------------------
	#Category ADD
    function addCategory()
	{
        global $CFG,$objSmarty,$error;
		$category_name 	= $this->My_addslashes($_POST['category_name']);
		$categoryname = $this->getNumvalues("category","category_name = '".$category_name."'");
		if($categoryname == 0)
		{
			$inssql = "INSERT INTO category SET category_name = '".$category_name."'";
			$ressql = $this->ExecuteQuery($inssql, "insert");
			
		    
		   	#Get Img Extension
			$img_ext_arr 	= explode(".",$_FILES['category_image']["name"]);
		    $img_ext_arr_cnt= count($img_ext_arr);
			$img_ext 		= strtolower($img_ext_arr[$img_ext_arr_cnt-1]);
			//$img_name 		= $img_ext_arr['0'];
			
			#Photo Upload
			$photo_name  ="category_image_".$ressql.".".$img_ext;
			$dest_folder =$CFG['site']['base_path']. "/category_images/".$photo_name;
			$sour_folder = $_FILES['category_image']['tmp_name'];
			
			move_uploaded_file($sour_folder,$dest_folder);
				
			$simpleObj = new SimpleImage();
			$simpleObj->load($dest_folder);
			$simpleObj->resize(480,480);
			$simpleObj->save($CFG['site']['base_path']. "/category_images/".$photo_name);
			
			
			$sel= "UPDATE category SET category_image='". $photo_name ."' WHERE category_id=".$ressql;
			$this->ExecuteQuery($sel,'update');
			
			$success="New Category Added Successfully";
			$this->redirectUrl("viewCategories.php?successmsg=".$success);
		}
		else
		{
			$error="Category Already Exists";
		    //$this->redirectUrl("viewCategories.php?errormsg=".$error);
			$objSmarty->assign("error",$error);
			return false;
		}
	}
	#--------------------------------------------------------------------------------
	#Category EDIT
	function editCategory()
	{
	    global $objSmarty,$error;
		$category_id=$_POST["category_id"];
		$category_name 	= $this->My_addslashes($_POST['category_name']);
		$categoryname = $this->getNumvalues("category","category_name = '".$category_name."' AND category_id != '".$category_id."'");
		if($categoryname == 0)
		{
			$updsql = "UPDATE category SET category_name = '".$category_name."' WHERE category_id = '".$category_id."' ";
			$this->ExecuteQuery($updsql, "update");
			$success="New Category Updated Successfully";
			$this->redirectUrl("viewCategories.php?successmsg=".$success);
		}else{
			$error="Category Already Exists";
		//$this->redirectUrl("viewCategories.php?errormsg=".$error);
			$objSmarty->assign("error",$error);
			return false;
		}
	}
	#-----------------------------------------------------------------------------------
	function editCategoryImage()
	{
	    global $CFG;
	    $category_id=$_POST["category_id"];
	    #Get Img Extension
	    $img_ext_arr 	= explode(".",$_FILES['category_image']["name"]);
	    $img_ext_arr_cnt= count($img_ext_arr);
	    $img_ext 		= strtolower($img_ext_arr[$img_ext_arr_cnt-1]);
	    //$img_name 		= $img_ext_arr['0'];
	    
	    #Photo Upload
	    $photo_name  ="category_image_".$category_id.".".$img_ext;
	    $dest_folder =$CFG['site']['base_path']. "/category_images/".$photo_name;
	    $sour_folder = $_FILES['category_image']['tmp_name'];
	    
	    move_uploaded_file($sour_folder,$dest_folder);
	    
	    $simpleObj = new SimpleImage();
	    $simpleObj->load($dest_folder);
	    $simpleObj->resize(480,480);
	    $simpleObj->save($CFG['site']['base_path']. "/category_images/".$photo_name);
	    
	    
	    $sel= "UPDATE category SET category_image='". $photo_name ."' WHERE category_id=".$category_id;
	    $this->ExecuteQuery($sel,'update');
	    
	    $success="Category Image Uploaded Successfully";
	    $this->redirectUrl("viewCategories.php?successmsg=".$success);
	}
	#--------------------------------------------------------------------------------
	#Category LIST 
	function viewCategories()
	{
		global $next_page;
		global $objSmarty;
        if($_REQUEST['keyword'])
		$condition.="AND category_name LIKE '".$_REQUEST['keyword']."%'";
			$sort = "ORDER BY category_id ASC";
		
		if(($_REQUEST['keyword'] <> "") && ($_REQUEST['limit'] <> "") && ($_REQUEST['limit'] != "all")){
				$limit = $_REQUEST['limit'];
				$fields = "&limit=$_REQUEST[limit]&keyword=$_REQUEST[keyword]";
			}else{
					$limit = PAGE_LIMIT;
					if($_REQUEST['keyword']!="")
					{
						$fields = "&keyword=$_REQUEST[keyword]";
					}
				}
			$page = $_REQUEST['page'];
			if ($page == 0) $page = 1;
			if($page) 
				$start = ($page - 1) * $limit; 			
			else
				$start = 0;
			
		    if(($_REQUEST['limit'] <> "")&&($_REQUEST['limit'] == "all")){
		 		$sql_lim = "$_REQUEST[limit]";
		 		 }else{
		 		$sql_lim = "$start, $limit";
		       }
		
		$sql_sel = "SELECT category_id,category_name,category_status FROM category WHERE category_id IS NOT NULL $condition $sort";
		$total_pages = $this->ExecuteQuery($sql_sel,'norows');
		
		
		
		
		$targetpage = "viewCategories.php"; 
		$next_page = $this->make_page($targetpage,$total_pages,$limit,$page,$fields);		
		$sql_limit = $sql_sel." LIMIT ".$sql_lim;
		
		$result = mysql_query($sql_limit) or die(mysql_error());
		//$cnt = 1;
		while($row_seller = mysql_fetch_array($result)){
			$categoryList[] =$row_seller;
			
		}
		//return $categoryList;
		$objSmarty->assign("categoryList",$categoryList);
		$objSmarty->assign("pagination", $next_page);
		$objSmarty->assign("limit", $limit);
		
	}
	#-------------------------------------------------------------------------------------------
	#Category List
	function categoryList()
	{
	    $categoryList=$this->getMultiValue("category_id,category_name","category" , "1=1");
	    return $categoryList;
	}
	#-----------------------------------------------------------------------------------------------------------------------
	#add product
	function addProduct()
	{
	    global $CFG,$objSmarty,$error;
	    $category_id    = $this->My_addslashes($_POST['category_id']);
	    $product_name   = $this->My_addslashes($_POST['product_name']);
	    $product_price  = $this->My_addslashes($_POST['product_price']);
	    $product_desc	= ucwords($this->My_addslashes_content($_REQUEST['content']));
	    $productname = $this->getNumvalues("product","product_name = '".$product_name."' and product_category_id='".$category_id."'");
	    if($productname == 0)
	    {
	        $inssql = "INSERT INTO product SET
                            product_name = '".$product_name."',
                            product_category_id='".$category_id."',
                            product_price='".$product_price."',
                            product_description='".$product_desc."'";
	        $ressql = $this->ExecuteQuery($inssql, "insert");
	        
	        
	        #Get Img Extension
	        $img_ext_arr 	= explode(".",$_FILES['product_image']["name"]);
	        $img_ext_arr_cnt= count($img_ext_arr);
	        $img_ext 		= strtolower($img_ext_arr[$img_ext_arr_cnt-1]);
	        //$img_name 		= $img_ext_arr['0'];
	        
	        #Photo Upload
	        $photo_name  ="product_image_".$ressql.".".$img_ext;
	        $dest_folder =$CFG['site']['base_path']. "/product_images/".$photo_name;
	        $sour_folder = $_FILES['product_image']['tmp_name'];
	        
	        move_uploaded_file($sour_folder,$dest_folder);
	        $simpleObj = new SimpleImage();
	        $simpleObj->load($dest_folder);
	        $simpleObj->resize(640,640);
	        $simpleObj->save($CFG['site']['base_path']. "/product_images/".$photo_name);
	        
	        
	        $sel= "UPDATE product SET product_image='". $photo_name ."' WHERE product_id=".$ressql;
	        $this->ExecuteQuery($sel,'update');
	        
	        $success="New Product Added Successfully";
	        $this->redirectUrl("viewProducts.php?successmsg=".$success);
	    }
	    else
	    {
	        $error="Product Already Exists";
	        //$this->redirectUrl("viewProducts.php?errormsg=".$error);
	        $objSmarty->assign("error",$error);
	        return false;
	    }
	}
	#.........................................................................................................
	function viewProducts()
	{
	    global $next_page;
	    global $objSmarty;
	    if($_REQUEST['keyword'])
	        $condition.="AND product_name LIKE '".$_REQUEST['keyword']."%'";
	        $sort = "ORDER BY product_id ASC";
	        
	        if(($_REQUEST['keyword'] <> "") && ($_REQUEST['limit'] <> "") && ($_REQUEST['limit'] != "all")){
	            $limit = $_REQUEST['limit'];
	            $fields = "&limit=$_REQUEST[limit]&keyword=$_REQUEST[keyword]";
	        }else{
	            $limit = PAGE_LIMIT;
	            if($_REQUEST['keyword']!="")
	            {
	                $fields = "&keyword=$_REQUEST[keyword]";
	            }
	        }
	        $page = $_REQUEST['page'];
	        if ($page == 0) $page = 1;
	        if($page)
	            $start = ($page - 1) * $limit;
	            else
	                $start = 0;
	                
	                if(($_REQUEST['limit'] <> "")&&($_REQUEST['limit'] == "all")){
	                    $sql_lim = "$_REQUEST[limit]";
	                }else{
	                    $sql_lim = "$start, $limit";
	                }
	                
	                $sql_sel = "SELECT product_id,product_name,product_category_id,product_status FROM product WHERE product_id IS NOT NULL $condition $sort";
	                $total_pages = $this->ExecuteQuery($sql_sel,'norows');
	                
	                $targetpage = "viewProducts.php";
	                $next_page = $this->make_page($targetpage,$total_pages,$limit,$page,$fields);
	                $sql_limit = $sql_sel." LIMIT ".$sql_lim;
	                
	                $result = mysql_query($sql_limit) or die(mysql_error());
	                while($row_seller = mysql_fetch_array($result))
	                {
	                    $row_seller["category_name"]=$this->getValue("category_name","category","category_id='".$row_seller["product_category_id"]."'");
	                    
	                    $productList[] =$row_seller;
	                }
	                $objSmarty->assign("productList",$productList);
	                $objSmarty->assign("pagination", $next_page);
	                $objSmarty->assign("limit", $limit);
	                
	}
	#---------------------------------------------------------------------------------------------------
	#edit product
	function editProduct()
	{
	    global $objSmarty;
	    $product_id=$_POST["product_id"];
	    $product_name 	= $this->My_addslashes($_POST['product_name']);
	    $product_price  = $this->My_addslashes($_POST['product_price']);
	    $product_desc	= ucwords($this->My_addslashes_content($_REQUEST['content']));
	    $productname = $this->getNumvalues("product","product_name = '".$product_name."' AND product_id != '".$product_id."'");
	    if($productname == 0)
	    {
	        $updsql = "UPDATE product SET 
                        product_name = '".$product_name."',
                        product_price='".$product_price."',
                        product_description='".$product_desc."' 
                       WHERE product_id = '".$product_id."' ";
	        $this->ExecuteQuery($updsql, "update");
	        $success="New Product Updated Successfully";
	        $this->redirectUrl("viewProducts.php?successmsg=".$success);
	    }else{
	        $error="Product Already Exists";
	        $objSmarty->assign("error",$error);
	        return false;
	        //$this->redirectUrl("viewProducts.php?errormsg=".$error);
	    }
	}
	#-----------------------------------------------------------------------------------
	function editProductImage()
	{
	    global $CFG;
	    $product_id=$_POST["product_id"];
	    #Get Img Extension
	    $img_ext_arr 	= explode(".",$_FILES['product_image']["name"]);
	    $img_ext_arr_cnt= count($img_ext_arr);
	    $img_ext 		= strtolower($img_ext_arr[$img_ext_arr_cnt-1]);
	    //$img_name 		= $img_ext_arr['0'];
	    
	    #Photo Upload
	    $photo_name  ="product_image".$product_id.".".$img_ext;
	    $dest_folder =$CFG['site']['base_path']. "/product_images/".$photo_name;
	    $sour_folder = $_FILES['product_image']['tmp_name'];
	    
	    move_uploaded_file($sour_folder,$dest_folder);
	    
	    $simpleObj = new SimpleImage();
	    $simpleObj->load($dest_folder);
	    $simpleObj->resize(640,640);
	    $simpleObj->save($CFG['site']['base_path']. "/product_images/".$photo_name);
	    
	    
	    $sel= "UPDATE product SET product_image='". $photo_name ."' WHERE product_id=".$product_id;
	    $this->ExecuteQuery($sel,'update');
	    
	    $success="Product Image Uploaded Successfully";
	    $this->redirectUrl("viewProducts.php?successmsg=".$success);
	}
	#---------------------------------------------------------------------------------------------------
	function addBanner()
	{
	    global $CFG,$objSmarty;
	    $banner_link  = $this->My_addslashes($_POST['banner_link']);
	    $banlink = $this->getNumvalues("banner","banner_link = '".$banner_link."'");
	    if($banlink == 0)
	    {
	        $inssql = "INSERT INTO banner SET
                            banner_link = '".$banner_link."'";
	        $ressql = $this->ExecuteQuery($inssql, "insert");
	        
	        
	        #Get Img Extension
	        $img_ext_arr 	= explode(".",$_FILES['banner_image']["name"]);
	        $img_ext_arr_cnt= count($img_ext_arr);
	        $img_ext 		= strtolower($img_ext_arr[$img_ext_arr_cnt-1]);
	        //$img_name 		= $img_ext_arr['0'];
	        
	        #Photo Upload
	        $photo_name  ="banner_image_".$ressql.".".$img_ext;
	        $dest_folder =$CFG['site']['base_path']. "/banner_images/".$photo_name;
	        $sour_folder = $_FILES['banner_image']['tmp_name'];
	        
	        move_uploaded_file($sour_folder,$dest_folder);
	        $simpleObj = new SimpleImage();
	        $simpleObj->load($dest_folder);
	        $simpleObj->resize(741,226);
	        $simpleObj->save($CFG['site']['base_path']. "/banner_images/".$photo_name);
	        
	        
	        $sel= "UPDATE banner SET banner_image='". $photo_name ."' WHERE banner_id=".$ressql;
	        $this->ExecuteQuery($sel,'update');
	        
	        $success="New Banner Added Successfully";
	        $this->redirectUrl("viewBanners.php?successmsg=".$success);
	    }
	    else
	    {
	        $error="Banner Already Exists";
	        //$this->redirectUrl("viewBanners.php?errormsg=".$error);
	        $objSmarty->assign("error",$error);
	        return false;
	    }
	}
	#.........................................................................................................
	function viewBanners()
	{
	    global $next_page;
	    global $objSmarty;
	   /* if($_REQUEST['keyword'])
	        $condition.="AND subcategory_name LIKE '".$_REQUEST['keyword']."%'";*/
	        $sort = "ORDER BY banner_id ASC";
	        
	        if(($_REQUEST['keyword'] <> "") && ($_REQUEST['limit'] <> "") && ($_REQUEST['limit'] != "all")){
	            $limit = $_REQUEST['limit'];
	            $fields = "&limit=$_REQUEST[limit]&keyword=$_REQUEST[keyword]";
	        }else{
	            $limit = PAGE_LIMIT;
	            if($_REQUEST['keyword']!="")
	            {
	                $fields = "&keyword=$_REQUEST[keyword]";
	            }
	        }
	        $page = $_REQUEST['page'];
	        if ($page == 0) $page = 1;
	        if($page)
	            $start = ($page - 1) * $limit;
	            else
	                $start = 0;
	                
	                if(($_REQUEST['limit'] <> "")&&($_REQUEST['limit'] == "all")){
	                    $sql_lim = "$_REQUEST[limit]";
	                }else{
	                    $sql_lim = "$start, $limit";
	                }
	                
	                $sql_sel = "SELECT banner_id,banner_image,banner_link,banner_status FROM banner WHERE banner_id IS NOT NULL ".$sort;
	                $total_pages = $this->ExecuteQuery($sql_sel,'norows');
	                
	                $targetpage = "viewBanners.php";
	                $next_page = $this->make_page($targetpage,$total_pages,$limit,$page,$fields);
	                $sql_limit = $sql_sel." LIMIT ".$sql_lim;
	                
	                $result = mysql_query($sql_limit) or die(mysql_error());
	                while($row_seller = mysql_fetch_array($result))
	                {
	                   $bannerList[] =$row_seller;
	                }
	                $objSmarty->assign("bannerList",$bannerList);
	                $objSmarty->assign("pagination", $next_page);
	                $objSmarty->assign("limit", $limit);
	                
	}
	#-----------------------------------------------------------------------------------------------------------------
	#Banner EDIT
	function editBanner()
	{
	    global $objSmarty,$error;
	    $banner_id=$_POST["banner_id"];
	    $banner_link 	= $this->My_addslashes($_POST['banner_link']);
	    $banlink = $this->getNumvalues("banner","banner_link = '".$banner_link."' AND banner_id != '".$banner_id."'");
	    if($banlink == 0)
	    {
	        $updsql = "UPDATE banner SET banner_link = '".$banner_link."' WHERE banner_id = '".$banner_id."' ";
	        $this->ExecuteQuery($updsql, "update");
	        $success="New Banner Updated Successfully";
	        $this->redirectUrl("viewBanners.php?successmsg=".$success);
	    }else{
	        $error="Banner Link Already Exists";
	        //$this->redirectUrl("viewBanners.php?errormsg=".$error);
	        $objSmarty->assign("error",$error);
	        return false;
	    }
	}
	#-----------------------------------------------------------------------------------
	function editBannerImage()
	{
	    global $CFG;
	    $banner_id=$_POST["banner_id"];
	    #Get Img Extension
	    $img_ext_arr 	= explode(".",$_FILES['banner_image']["name"]);
	    $img_ext_arr_cnt= count($img_ext_arr);
	    $img_ext 		= strtolower($img_ext_arr[$img_ext_arr_cnt-1]);
	    //$img_name 		= $img_ext_arr['0'];
	    
	    #Photo Upload
	    $photo_name  ="banner_image_".$banner_id.".".$img_ext;
	    $dest_folder =$CFG['site']['base_path']. "/banner_images/".$photo_name;
	    $sour_folder = $_FILES['banner_image']['tmp_name'];
	    
	    move_uploaded_file($sour_folder,$dest_folder);
	    
	    $simpleObj = new SimpleImage();
	    $simpleObj->load($dest_folder);
	    $simpleObj->resize(741,226);
	    $simpleObj->save($CFG['site']['base_path']. "/banner_images/".$photo_name);
	    
	    
	    $sel= "UPDATE banner SET banner_image='". $photo_name ."' WHERE banner_id=".$banner_id;
	    $this->ExecuteQuery($sel,'update');
	    
	    $success="Banner Image Uploaded Successfully";
	    $this->redirectUrl("viewBanners.php?successmsg=".$success);
	}
	#-----------------------------------------------------------------------------------------------------
	function editPassword()
	{
	    global $objSmarty;
	    //print_r($_POST);
	    $password=$_POST["changepassword"];
	    $query= "UPDATE adminlogin SET adminlogin_password='". $password ."' WHERE adminlogin_id='1'";
	    $this->ExecuteQuery($query,'update');
	    
	    $success="Password Changed Successfully";
	    $objSmarty->assign("success",$success);
	    return false;
	}
	#------------------------------------------------------------------------------------------------------
	function aboutus()
	{
	    global $objSmarty;
	    $desc	= ucwords($this->My_addslashes_content($_REQUEST['content']));
	    $query= "UPDATE aboutus SET about='". $desc ."'";
	    $this->ExecuteQuery($query,'update');
	    
	    $success="Content Changed Successfully";
	    $objSmarty->assign("success",$success);
	    return false;
	}
	#------------------------------------------------------------------------------------------------------
	function termsConditions()
	{
	    global $objSmarty;
	    $desc	= ucwords($this->My_addslashes_content($_REQUEST['content']));
	    $query= "UPDATE termsconditions SET termsconditions='". $desc ."'";
	    $this->ExecuteQuery($query,'update');
	    
	    $success="Content Changed Successfully";
	    $objSmarty->assign("success",$success);
	    return false;
	}
	#------------------------------------------------------------------------------------------------------
	function privacyPolicy()
	{
	    global $objSmarty;
	    $desc	= ucwords($this->My_addslashes_content($_REQUEST['content']));
	    $query= "UPDATE privacypolicy SET privacypolicy='". $desc ."'";
	    $this->ExecuteQuery($query,'update');
	    
	    $success="Content Changed Successfully";
	    $objSmarty->assign("success",$success);
	    return false;
	}
	#------------------------------------------------------------------------------------------------------
	function shippingPolicy()
	{
	    global $objSmarty;
	    $desc	= ucwords($this->My_addslashes_content($_REQUEST['content']));
	    $query= "UPDATE shippingpolicy SET shippingpolicy='". $desc ."'";
	    $this->ExecuteQuery($query,'update');
	    
	    $success="Content Changed Successfully";
	    $objSmarty->assign("success",$success);
	    return false;
	}
	#------------------------------------------------------------------------------------------------------
	function returnsrefunds()
	{
	    global $objSmarty;
	    $desc	= ucwords($this->My_addslashes_content($_REQUEST['content']));
	    $query= "UPDATE returnsrefunds SET returnsrefunds='". $desc ."'";
	    $this->ExecuteQuery($query,'update');
	    
	    $success="Content Changed Successfully";
	    $objSmarty->assign("success",$success);
	    return false;
	}
	#------------------------------------------------------------------------------------------------------
	function contact()
	{
	    global $objSmarty;
	    $desc	= ucwords($this->My_addslashes_content($_REQUEST['content']));
	    $query= "UPDATE contact SET contact='". $desc ."'";
	    $this->ExecuteQuery($query,'update');
	    
	    $success="Content Changed Successfully";
	    $objSmarty->assign("success",$success);
	    return false;
	}
	#------------------------------------------------------------------------------------------------------
	function disclaimer()
	{
	    global $objSmarty;
	    $desc	= ucwords($this->My_addslashes_content($_REQUEST['content']));
	    $query= "UPDATE disclaimer SET disclaimer='". $desc ."'";
	    $this->ExecuteQuery($query,'update');
	    
	    $success="Content Changed Successfully";
	    $objSmarty->assign("success",$success);
	    return false;
	}
}
?>
