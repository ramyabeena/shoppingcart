<div class="container-fluid mt-2">
    <div class="row">
        <div class="col-4">
        	{include file="sidebar.tpl"}
        </div>
        <div class="col-8">
        	<div class="card-deck">

            {section name=prolist loop=$productList}
                <div class="card">
                <a href="productDetails.php?product_id={$productList[prolist].product_id}"> <img class="card-img-top" src="product_images/{$productList[prolist].product_image}" width="256" height="256"></a>
                <div class="card-body">
                <p class="card-title"><a href="productDetails.php?product_id={$productList[prolist].product_id}">{$productList[prolist].product_name}</a></p>
                <div class="row">
                <div class="col">
                	<p class="card-text text-primary font-weight-bold">&#8377;.{$productList[prolist].product_price}</p>
                </div>
                <div class="col">
                	<button type="button" class="btn btn-primary pr-2 pl-2" style="padding:0px;">Order Now</button>
                </div>
                </div>
                
                </div>
                </div>
            {/section}
            </div>
        </div>
    </div>
</div>