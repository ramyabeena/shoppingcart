<div class="container-fluid mt-2">
    <div class="row">
        <div class="col">
        	<img src="product_images/{$productDetail[0].product_image}" width="640" height="640"  style="max-width:100%;"/>
        </div>
        <div class="col">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">{$productDetail[0].product_name|stripslashes}</h4>
                <p class="card-text">{$productDetail[0].product_description|strip_tags}</p>
                <p class="card-text text-primary font-weight-bold">&#8377;.{$productDetail[0].product_price}</p>
                <label for="message">Message on Cake</label>
                <textarea id="message" class="form-control"></textarea><br />
                <div class="text-center"><button type="button" class="btn btn-primary">Add to Cart</button></div>
               </div>
            </div>
        </div>
    </div>
    <div class="bg-primary mt-2 m1-2">
    	<p class="ml-3 text-white">Related Products</p>
    </div>
    <div class= "row ml-2 pb-2">
    	
              <marquee style="margin-top:-50px; text-decoration:none;" scrollamount="5" onMouseOver="this.stop();" onMouseOut="this.start();">
                {section name=rel loop=$relatedList}
                	<div class="border text-center mt-5 ml-5" style="width:100px;overflow:hidden; float:left;">
                		<a href="productDetails.php?product_id={$relatedList[rel].product_id}" style="text-decoration:none;" ><img src="product_images/{$relatedList[rel].product_image}" width="96" height="96" /><br />
                    {$relatedList[rel].product_name}<br>&#8377.{$relatedList[rel].product_price}</a>
               		</div>
                {/section}
               
               
             </marquee>
       
    </div>
</div>