<div class="container">
        <form name="form1" method="post">
        <input type="hidden" name="product_id" value="{$smarty.request.id}" />
          <div class="row">
 			<div class="col">
            {if $error!=""}	
            <div class="form-group">
              <div class="alert alert-danger alert-dismissible fade show">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Error!</strong> {$error}
              </div>
              </div>
              {/if}
            <div class="form-group">
              <label for="sel1">Category Name :</label>
              <select class="form-control" id="sel1" name="category_id" required disabled="disabled" >
              	<option value="">Choose the category name</option>
                {section name=catname loop=$categoryList}
                <option value="{$categoryList[catname].category_id}"
                {if $categoryList[catname].category_id eq $category_id} selected="selected"{/if}
                >{$categoryList[catname].category_name}</option>
                {/section}
              </select>
            </div>
            <div class="form-group">
            <label for="sel2">Sub Category Name:</label>
            <span id="showSubCategories">
            <select class="form-control" id="sel2" name="subcategory_id" required disabled="disabled">
              	<option value="">Choose the Sub category name</option>
                {section name=subcatname loop=$subcategoryList}
                <option value="{$subcategoryList[subcatname].subcategory_id}"
                {if $subcategoryList[subcatname].subcategory_id eq $subcategory_id} selected="selected"{/if}
                >{$subcategoryList[subcatname].subcategory_name}</option>
                {/section}
            </select>
            </span>
           	</div>
            <div class="form-group">
            	<label for="prodname">Product Name:</label>
                <input type="text" class="form-control" placeholder="Enter Product Name" id="prodname" name="product_name" required value="{$product_name}" />
            </div>
            <div class="form-group">
            	<label for="proddesc">Product Description:</label>
                {$Editor1}
            </div>
            <div class="form-group">
            	<label for="prodprice">Product Price:</label>
                <input type="text" class="form-control" placeholder="Enter Product Price" id="prodprice" name="product_price" required value="{$product_price}" />
            </div>
         <div class="form-group text-center">
          <button type="submit" name="edit" class="btn btn-primary" value="Edit">Update</button>
          <button type="reset" class="btn btn-primary" onclick="window.location.href='viewProducts.php';">Cancel</button>
          </div>
            </div>
          </div>	
          
        </form>																	
    </div>

{literal}
<script>
function showSubCategories(category_id)
{
	$.post("ajaxAction.php",{"id":category_id,"action":"showSubCategories"}, function(data)
	{
		$("#showSubCategories").html(data);
	});
}
</script>
{/literal}