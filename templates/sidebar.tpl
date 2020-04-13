<div id="accordion">
	
    {section name=seccat loop=$sideCategoryList}
        <div class="card">
            <div class="card-header bg-primary">
            	<a class="card-link text-white" data-toggle="collapse" href="#category{$sideCategoryList[seccat].category_id}">{$sideCategoryList[seccat].category_name}</a>
            </div>
            {$objCommon->showSideProductList($sideCategoryList[seccat].category_id)}
            {if $sideProductList|@count gt 0}
            <div id="category{$sideCategoryList[seccat].category_id}" {if $sideCategoryList[seccat].category_id eq $smarty.request.category_id}  class="collapse show" {else} class="collapse" {/if} data-parent="#accordion">
                <div class="card-body">
                	<ul class="sidebarlist">
                    	{section name=secprod loop=$sideProductList}
                        	<li><a href="productDetails.php?product_id={$sideProductList[secprod].product_id}">{$sideProductList[secprod].product_name}</a></li>
                        {/section}
                    </ul>
                </div>
            </div>
            {/if}
        </div>		
    {/section}
  
</div>