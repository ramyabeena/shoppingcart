<div class="container-fluid mt-2">
    <div class="bg-primary mt-2 m1-2">
    	<p class="ml-3 text-white">Privacy Policy</p>
    </div>
     <div class= "row ml-2 pb-2">{$privacypolicy}</div>
    
    <div class="bg-primary mt-2 m1-2">
    	<p class="ml-3 text-white">Our Products</p>
    </div>
    <div class= "row ml-2 pb-2">
    	
              <marquee style="margin-top:-50px; text-decoration:none;" scrollamount="5" onMouseOver="this.stop();" onMouseOut="this.start();">
                {section name=prod loop=$productList}
                	<div class="border text-center mt-5 ml-5" style="width:100px;overflow:hidden; float:left;">
                		<a href="productDetails.php?product_id={$productList[prod].product_id}" style="text-decoration:none;" ><img src="product_images/{$productList[prod].product_image}" width="96" height="96" /><br />
                    {$productList[prod].product_name}<br>&#8377.{$productList[prod].product_price}</a>
               		</div>
                {/section}
               
               
             </marquee>
       
    </div>
 </div>