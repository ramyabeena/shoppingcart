<div class="container">
        <form name="form1" method="post">
          <div class="row">
          	<input type="hidden" name="category_id" value="{$smarty.request.id}" />
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
            <label for="categoryname">Category Name:</label>
            <input type="text" class="form-control" placeholder="Enter Category Name" id="categoryname" name="category_name" value="{$category_name}" required>
           	</div>
            <div class="form-group text-center">
          <button type="submit" name="edit" class="btn btn-primary" value="Edit">Update</button>
          <button type="reset" class="btn btn-primary" onclick="window.location.href='viewCategories.php';">Cancel</button>
          </div>
            </div>
          </div>	
          
        </form>																	
    </div>