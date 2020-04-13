<div class="container-fluid">
<div class="row">
	<div class="col mr-5 mt-3">
    	<a href="index.php"><img src="images/shopping_cart_logo.png" width="96" height="96" /></a>
    </div>
    <div class="col mr-5 mt-3 text-right">
    	<a href="#" style="text-decoration:none;"> Login / Register </a> |
        <a href="#"><img src="images/shopping-cart.png" />
        <span class="cartcount">{$smarty.session.cart|count}</span>
        </a>
    </div>

</div>
<div id='cssmenu'>
<ul>
   <li><a href='index.php'><span>Home</span></a></li>
   <li><a href='aboutus.php'><span>About</span></a></li>
   <li class='has-sub'><a href='showCategories.php'><span>Products</span></a>
      <ul>
      	{section name=catname loop=$menucategoryList}
        	 {$objCommon->showmenuProductList($menucategoryList[catname].category_id)}
        	 <li {if $productmenuList|@count gt 0} class='has-sub' {/if}><a href="showProducts.php?category_id={$menucategoryList[catname].category_id}"><span>{$menucategoryList[catname].category_name}<span></a>
             {if $productmenuList|@count gt 0}
             	<ul>
                	{section name=prodname loop=$productmenuList}
                    	<li><a href="productDetails.php?product_id={$productmenuList[prodname].product_id}">{$productmenuList[prodname].product_name}</a></li>
                    {/section}
                </ul>
             {/if}
             </li>
        {/section}
      </ul>
   </li>
   
   <li class='last'><a href='contact.php'><span>Contact</span></a></li>
</ul>
</div>
</div>