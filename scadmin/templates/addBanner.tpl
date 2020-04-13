<div class="container">
        <form name="form1" enctype="multipart/form-data" method="post" onsubmit="return validateBanner();">
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
            	<label for="banlink">Banner Link:</label>
                <input type="text" class="form-control" placeholder="Enter Banner Link" id="banlink" name="banner_link" required />
            </div>
            <div class="form-group">
            <label for="banimage">Banner Image:</label>
            <input type="file" class="form-control-file border" placeholder="Choose Image File" id="banimage" name="banner_image" required>
          </div>
          <div class="form-group text-center">
          <button type="submit" name="add" class="btn btn-primary" value="Add">Add</button>
          </div>
            </div>
          </div>	
          
        </form>																	
    </div>