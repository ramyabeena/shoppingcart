<?php 
	

class Common extends Site
{
	
    function sideCategoryList()
    {
        $sideCategoryList=$this->getMultiValue("category_id,category_name", "category", "category_status='1'");
        return $sideCategoryList;
    }
	#.........................................................................................................................
    function showSideProductList($category_id)
    {
        global $objSmarty;
        $sideProductList=$this->getMultiValue("product_id,product_name", "product", "product_status='1' AND product_category_id='".$category_id."'");
        //return $sideProductList;
        $objSmarty->assign("sideProductList",$sideProductList);
    }
    #...................................................................................................................................................
    function showmenuProductList($category_id)
    {
        global $objSmarty;
        $productmenuList=$this->getMultiValue("product_id,product_name", "product", "product_status='1' AND product_category_id='".$category_id."'");
        //print_r($productList);
        $objSmarty->assign("productmenuList",$productmenuList);
    }
    
    #.........................................................................................................................
    function showProductList($category_id)
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
                    
                    $sql_sel = "SELECT product_id,product_name,product_image,product_price FROM product WHERE product_id IS NOT NULL AND product_status='1' AND product_category_id='".$category_id."' $condition $sort";
                    $total_pages = $this->ExecuteQuery($sql_sel,'norows');
                    
                    $fields.="&category_id=".$category_id;
                    
                    $targetpage = "showProducts.php";
                    $next_page = $this->make_page($targetpage,$total_pages,$limit,$page,$fields);
                    $sql_limit = $sql_sel." LIMIT ".$sql_lim;
                    
                    $result = mysql_query($sql_limit) or die(mysql_error());
                    while($row_seller = mysql_fetch_array($result))
                    {
                                     
                        $productList[] =$row_seller;
                    }
                    $objSmarty->assign("productList",$productList);
                    $objSmarty->assign("pagination", $next_page);
                    $objSmarty->assign("limit", $limit);
    }
    #.......................................................................................................................................
    function showProduct($product_id)
    {
        $product_detail=$this->getMultiValue("product_id,product_category_id,product_name,product_description,product_price,product_image", "product", "product_id='".$product_id."'");
        return $product_detail;
    }
    #...............................................................................................................................................
    function relatedList($product_id)
    {
        $categoryid=$this->getValue("product_category_id","product", "product_id='".$product_id."'");
        $relatedList=$this->getMultiValue("product_id,product_name,product_image,product_price", "product", "product_category_id='".$categoryid."' AND product_status='1' AND product_id!='".$product_id."'");
        return $relatedList;
    }
    #.........................................................................................................................
    function showCategoryList()
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
                    
                    $sql_sel = "SELECT category_id,category_name,category_image FROM category WHERE category_id IS NOT NULL AND category_status='1' $condition $sort";
                    $total_pages = $this->ExecuteQuery($sql_sel,'norows');
                    
                                        
                    $targetpage = "showCategories.php";
                    $next_page = $this->make_page($targetpage,$total_pages,$limit,$page,$fields);
                    $sql_limit = $sql_sel." LIMIT ".$sql_lim;
                    
                    $result = mysql_query($sql_limit) or die(mysql_error());
                    while($row_seller = mysql_fetch_array($result))
                    {
                        
                        $categoryList[] =$row_seller;
                    }
                    $objSmarty->assign("categoryList",$categoryList);
                    $objSmarty->assign("pagination", $next_page);
                    $objSmarty->assign("limit", $limit);
    }
    #.......................................................................................................................................
    function getTitle()
    {
        global $objSmarty;
        $filename=$this->get_file_name();
        if($filename=="index.php")
        {
            $title="Shopping Cart - Home Page";
        }
        if($filename=="showCategories.php")
        {
            $title="Shopping Cart - My Categories";
        }
        if($filename=="showProducts.php")
        {
            $title="Shopping Cart - My Products";
            $category_id=$_REQUEST["category_id"];
            $category_name=$this->getValue("category_name","category","category_id='".$category_id."'");
            $title.=" - ".$category_name;
        }
        if($filename=="productDetails.php")
        {
            $product_id=$_REQUEST["product_id"];
            $title="Shopping Cart - My Products";
            $category_id=$this->getValue("product_category_id", "product", "product_id='".$product_id."'");
            $category_name=$this->getValue("category_name","category","category_id='".$category_id."'");
            $title.=" - ".$category_name;
            $product_name=$this->getValue("product_name", "product", "product_id='".$product_id."'");
            $title.=" - ".$product_name;
        }
        $objSmarty->assign("title",$title);
    }
}
?>