<div class="container">
        <form name="form1" method="post">
          <div class="row">
          	<input type="hidden" name="banner_id" value="{$smarty.request.id}" />
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
            <input type="text" class="form-control" placeholder="Enter Banner Link" id="banlink" name="banner_link" value="{$banner_link}" required>
           	</div>
            <div class="form-group text-center">
          <button type="submit" name="edit" class="btn btn-primary" value="Edit">Update</button>
          <button type="reset" class="btn btn-primary" onclick="window.location.href='viewBanners.php';">Cancel</button>
          </div>
            </div>
          </div>	
          
        </form>																	
    </div>