<div class="container">
        <form name="form1" enctype="multipart/form-data" method="post" onsubmit="return validateProduct();">
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
              <select class="form-control" id="sel1" name="category_id" required>
              	<option value="">Choose the category name</option>
                {section name=catname loop=$categoryList}
                <option value="{$categoryList[catname].category_id}">{$categoryList[catname].category_name}</option>
                {/section}
              </select>
            </div>
            <div class="form-group">
            	<label for="prodname">Product Name:</label>
                <input type="text" class="form-control" placeholder="Enter Product Name" id="prodname" name="product_name" required />
            </div>
            <div class="form-group">
            	<label for="proddesc">Product Description:</label>
                {$Editor1}
            </div>
            <div class="form-group">
            	<label for="prodprice">Product Price:</label>
                <input type="text" class="form-control" placeholder="Enter Product Price" id="prodprice" name="product_price" required />
            </div>
         	<div class="form-group">
            <label for="prodimage">Product Image:</label>
            <input type="file" class="form-control-file border" placeholder="Choose Image File" id="prodimage" name="product_image" required>
          </div>
          <div class="form-group text-center">
          <button type="submit" name="add" class="btn btn-primary" value="Add">Add</button>
          </div>
            </div>
          </div>	
          
        </form>																	
    </div>