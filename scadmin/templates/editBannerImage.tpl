<div class="container">
        <form name="form1" enctype="multipart/form-data" method="post">
          <div class="row">
          	<input type="hidden" name="banner_id" value="{$smarty.request.id}" />
            <div class="col">
            <div class="form-group">
            	<img src="../banner_images/{$banner_image}" />
            </div>
            <div class="form-group">
            	<label for="banimage">Banner Image:</label>
            	<input type="file" class="form-control-file border" placeholder="Choose Image File" id="banimage" name="banner_image" required>
           	</div>
            <div class="form-group text-center">
          		<button type="submit" name="edit" class="btn btn-primary" value="Edit">Update</button>
                <button type="reset" class="btn btn-primary" onclick="window.location.href='viewBanners.php';">Cancel</button>
          </div>
            </div>
          </div>	
          
        </form>																	
    </div>