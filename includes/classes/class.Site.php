<?php 
/**
	**Class Function for Site
*/

class Site{
	
	//function __construct() {
     function Site($db_host="",$db_name="",$db_user="",$db_pwd=""){
         global $CFG;
         
         $db_host = $CFG['db']['db_host'];
         $db_name = $CFG['db']['db_name'];
         $db_user = $CFG['db']['db_user'];
         $db_pwd  = $CFG['db']['db_pwd'];

        $this->db_connection($db_host,$db_name,$db_user,$db_pwd);
     }
	#........................................................................................
	#DB CONNECTION
	function db_connection($db_host,$db_name,$db_user,$db_pwd){
			
		$con = mysql_connect($db_host,$db_user,$db_pwd) or die("Could not connect: ".$db_host." :: ".$db_name." :: ".$db_user." :: ".$db_pwd. mysql_error());
		mysql_select_db($db_name,$con) or die ('Can\'t use  : '.$db_name . mysql_error());		
	}
	#........................................................................................
	#GET Single Value
	function getValue($select,$table_name,$condition){
		$sql = "SELECT ".$select." FROM ".$table_name." WHERE ".$condition." ";
		#echo $sql."<br>";
		$res = mysql_query($sql)or die(mysql_error());
		$row = mysql_fetch_assoc($res);
		
		return stripslashes($row[$select]);
	}
	#........................................................................................
	#GET Single Value
	function getMultiValue($select,$table_name,$condition){
		$sql = "SELECT ".$select." FROM ".$table_name." WHERE ".$condition." ";
		#echo $sql."<br>";
		$res = mysql_query($sql)or die(mysql_error());
		while($row = mysql_fetch_assoc($res)){
			$row_list[] = $row;
		}
		
		return $row_list;
	}
	#........................................................................................	
	#GET NUM VALUES
	function getNumvalues($table_name,$condition){
			
		//$sql = "SELECT ".$select." FROM ".$table_name." WHERE ".$condition." ";
		$sql = "SELECT * FROM ".$table_name." WHERE ".$condition." ";
		#echo $sql;
		$res = mysql_query($sql)or die(mysql_error());
		$num = mysql_num_rows($res);
		#echo $num;
		return $num;		
	}
	#........................................................................................
	#GET Addslashes
	function My_addslashes($string){
		
	    $string = htmlspecialchars(addslashes(trim($string)));
	    return $string;
    }
    #........................................................................................
	#GET Addslashes
	function My_addslashes_content($string){
		
	    $string = addslashes(trim($string));
	    return $string;
    }
    #........................................................................................
	#GET Addslashes
	function My_stripslashes($string){
		
	    $string = stripslashes($string);
	    return $string;
    }
   
    
	#........................................................................................
    #GET FILE NAME
	function get_file_name(){
		
		
		$php_self_arr1 		= explode("/",$_SERVER['PHP_SELF']);
		$cnt_php_self_arr1	= count($php_self_arr1);
		$req_file_name		= $php_self_arr1[$cnt_php_self_arr1-1];
		//echo "<br>".$req_file_name;
		
		
		return $req_file_name;
	}
	#........................................................................................
	#Redirect Url
	function redirectUrl($filename){
		header("Location: $filename");
		exit();
    }
	#....................................................................................
	#EXECUTE QUERY
	function ExecuteQuery($Query, $Qrytype){
		
		if(!empty($Query) && !empty($Qrytype)){
			switch(strtolower($Qrytype))
			{
				case "select":
					$Result = mysql_query($Query) or die("Error in Selection Query <br> ".$Query."<br>". mysql_error());
					if($Result){	
						$ResultSet = array();
						while($ResultSet1 = mysql_fetch_assoc($Result))
							$ResultSet[] = $ResultSet1;
						return $ResultSet;
					}
					else return false;
					break;
				case "update":
					$Result = mysql_query($Query) or die("Error in Updation Query <br> ".$Query."<br>". mysql_error());
					if($Result){
						$AffectedNums = mysql_affected_rows();
						return $AffectedNums;
					}
					else return false;
					break;
					case "norows":
					$Result = mysql_query($Query) or die("Error in No of Rows Query <br> ".$Query."<br>". mysql_error());
					if($Result){
						$Totalrows = mysql_num_rows($Result);
						return $Totalrows;
					}
					else return false;
					break;
				case "insert":
					$Result = mysql_query($Query) or die("Error in Insertion Query <br> ".$Query."<br>". mysql_error());
					if($Result){
						$LastInsertedRow = mysql_insert_id();
						return $LastInsertedRow;
					}
					else return false;
					break;
				case "delete":
					$Result = mysql_query($Query) or die("Error in Deletion Query <br> ".$Query."<br>". mysql_error());
					if($Result)
						return true;
					else
						return false;
			}
		}
	}
	#....................................................................................
	#PAGINATION ADMIN
	function make_page($targetpage,$total_pages,$limit,$page,$fields){
		$adjacents = 1;
		/* Setup page vars for display. */					//if no page var is given, default to 1.
		$prev = $page - 1;							//previous page is page - 1
		$next = $page + 1;	
		
		if($limit<=0)
		{
			$limit=1;
		}						//next page is page + 1
		$lastpage = ceil($total_pages/$limit);		//lastpage is = total pages / items per page, rounded up.
		$lpm1 = $lastpage - 1;						//last page minus 1
		
		/* 
			Now we apply our rules and draw the pagination object. 
			We're actually saving the code to a variable in case we want to draw it more than once.
		*/
		$pagination = "";
		if($lastpage > 1)
		{	
			$pagination .= "<ul class=\"pagination justify-content-end\" style=\"margin:20px 0\">";
			//previous button
			if ($page > 1) 
				$pagination.= "<li class=\"page-item\"><a class=\"page-link\" href=\"$targetpage?page=$prev$fields\"=>&laquo; Previous</a></li>";
			else
				$pagination.= "<li class=\"page-item\"><a class=\"page-link disabled\">&laquo; Previous</a></li>";	
			
			//pages	
			if ($lastpage < 7 + ($adjacents * 2))	//not enough pages to bother breaking it up
			{	
				for ($counter = 1; $counter <= $lastpage; $counter++)
				{
					if ($counter == $page)
						$pagination.= "<li class=\"page-item\"><a class=\"page-link bg-primary\">$counter</a></li>";
					else
						$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=$counter$fields\" class=\"page-link\">$counter</a></li>";
				}
			}
			elseif($lastpage > 5 + ($adjacents * 2))	//enough pages to hide some
			{
				//close to beginning; only hide later pages
				if($page < 1 + ($adjacents * 2))		
				{
					for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
					{
						if ($counter == $page)
							$pagination.= "<li class=\"page-item\"><a href=\"#\" class=\"page-link bg-primary\">$counter</a></li>";
						else
							$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=$counter$fields\" class=\"page-link\">$counter</a></li>";
												
					}
					$pagination.= "...";
					$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=$lpm1$fields\" class=\"page-link\">$lpm1</a></li>";
					$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=$lastpage$fields\" class=\"page-link\">$lastpage</a></li>";
							
				}
				//in middle; hide some front and some back
				elseif($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2))
				{
					$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=1$fields\" class=\"page-link\">1</a></li>";
					$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=2$fields\" class=\"page-link\">2</a></li>";
					$pagination.= "...";
					for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++)
					{
						if ($counter == $page)
							$pagination.= "<li class=\"page-item\"><a href=\"#\" class=\"page-link bg-primary\">$counter</span>";
						else
							$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=$counter$fields\" class=\"page-link\">$counter</a></li>";	
											
					}
					$pagination.= "...";
					$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=$lpm1$fields\" class=\"page-link\">$lpm1</a></li>";
					$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=$lastpage$fields\" class=\"page-link\">$lastpage</a></li>";
				}
				//close to end; only hide early pages
				else
				{
					$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=1$fields\" class=\"page-link\">1</a></li>";
					$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=2$fields\" class=\"page-link\">2</a></li>";
					$pagination.= "...";
					for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++)
					{
						if ($counter == $page)
							$pagination.= "<li class=\"page-item\"><a href=\"#\" class=\"page-link bg-primary\">$counter</a></li>";
						else
							$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=$counter$fields\" class=\"page-link\">$counter</a></li>";
					}
				}
			}
			
			//next button
			if ($page < $counter - 1) 
				$pagination.= "<li class=\"page-item\"><a href=\"$targetpage?page=$next$fields\" class=\"page-link\">Next &raquo;</a></li>";
			else
			$pagination.= "<li class=\"page-item \"><a href=\"#\" class=\"page-link disabled\">Next &raquo;</a></li>";
			$pagination.= "</ul>\n";		
		}
		return $pagination;
	}
	#....................................................................................
	#Sendmail
	function sendMail($fromname,$fromemail,$to_email,$mail_subject,$mail_content){

    	$mailHeader  = "From:".$fromname." <".$fromemail."> \n" ;
	    $mailHeader .= "X-Sender:". $fromemail." \n";
	    $mailHeader .= "Reply-To: ".$fromname." <".$fromemail."> \n";
	    $mailHeader .= "Content-Type: text/html; charset=iso-8859-1 \n";
	    $mailHeader .= "Return-Path:".$fromemail." \n";
	    $mailHeader .= "Error-To: ".$fromemail." \n";
	    $mailHeader .= "X-Mailer: ".$_SERVER['SERVER_NAME']." \n";
	    $mailHeader .= "MIME-Version: 1.0 \n";
	    
	    $mailresult  = mail($to_email,$mail_subject,$mail_content,$mailHeader);
	    return $mailresult;
    }
	#.......................................................................................................................................................
    #............................................................................................................................................
    #show Banner list
    function bannerList()
    {
        $query="SELECT banner_link,banner_image FROM banner WHERE banner_status='1'";
        $result=mysql_query($query)or die(mysql_error());
        $cnt=0;
        while($rowseller=mysql_fetch_assoc($result))
        {
            $rowseller["sno"]=$cnt;
            $bannerList[]=$rowseller;
            $cnt=$cnt+1;
        }
       // $bannerList=$this->getMultiValue("banner_link,banner_image", "banner", "banner_status='1'");
        return $bannerList;
    }
    #..................................................................................................................
    #show productIndexList
    function productIndexList()
    {
        $productIndexList=$this->getMultiValue("product_id,product_image,product_name,product_price", "product", "product_status='1'");
        return $productIndexList;
    }
	#...................................................................................................................
	/*function categoryList()
	{
	    global $objSmarty;
	    $categoryList=$this->getMultiValue("category_id,category_name", "category", "category_status='1'");
	    //return $categoryList;
	    $objSmarty->assign("categoryList",$categoryList);
	}*/
}
?>