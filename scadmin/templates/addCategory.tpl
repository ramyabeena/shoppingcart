<div class="container">
        <form name="form1" enctype="multipart/form-data" method="post" onsubmit="return validateCategory();">
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
            <label for="categoryname">Category Name:</label>
            <input type="text" class="form-control" placeholder="Enter Category Name" id="categoryname" name="category_name" required>
           	</div>
         	<div class="form-group">
            <label for="catimage">Category Image:</label>
            <input type="file" class="form-control-file border" placeholder="Choose Image File" id="catimage" name="category_image" required>
          </div>
          <div class="form-group text-center">
          <button type="submit" name="add" class="btn btn-primary" value="Add">Add</button>
          </div>
            </div>
          </div>	
          
        </form>																	
    </div>