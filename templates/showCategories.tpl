<div class="container-fluid mt-2">
    <div class="row">
        <div class="col-4">
        	{include file="sidebar.tpl"}
        </div>
        <div class="col-8">
        	<div class="card-deck">

            {section name=catlist loop=$categoryList}
                <div class="card">
                <a href="showProducts.php?category_id={$categoryList[catlist].category_id}"> <img class="card-img-top" src="category_images/{$categoryList[catlist].category_image}" width="256" height="256"></a>
                <div class="card-body">
                <p class="card-title"><a href="showProducts.php?category_id={$categoryList[catlist].category_id}">{$categoryList[catlist].category_name}</a></p>
                
                
                </div>
                </div>
            {/section}
            </div>
        </div>
    </div>
</div>