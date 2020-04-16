<div class="container">
	  {if $success!=""}	
      <div class="alert alert-success alert-dismissible fade show">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Success!</strong>  {$success}
      </div>
      {/if}
      {if $error!=""}	
      <div class="alert alert-danger alert-dismissible fade show">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Error!</strong> {$error}
      </div>
      {/if}
        <form name="form1" method="post">
            <div class="row">
 			<div class="col">
            <div class="form-group">
            	<label for="proddesc">Description:</label>
                {$Editor1}
            </div>
            
         <div class="form-group text-center">
          <button type="submit" name="edit" class="btn btn-primary" value="Edit">Update</button>
          <button type="reset" class="btn btn-primary" onclick="window.location.href='index.php';">Cancel</button>
          </div>
            </div>
          </div>	
          
        </form>																	
    </div>