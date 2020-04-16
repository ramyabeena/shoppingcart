<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Admin Authenticate - Login</title>
	{include file="main_css.tpl"}
</head>
<body style="padding:100px;">	
    <!--container section start-->
      <div class="container border">
        <form name="form1" method="post" onsubmit="return validateAdmin();">
          <div class="row">
          	<div class="col text-center"><img src="../images/shopping_cart_logo.png" class="img-thumbnail" alt="Online Shopping" style="border:none;padding-top:10px;max-width:50%;" /></div>
            <div class="col">
            <div class="form-group">
            {if $error!=""}	
              <div class="alert alert-danger alert-dismissible fade show">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Error!</strong> {$error}
              </div>
              {/if}
            <label for="username">Username:</label>
            <input type="text" class="form-control" placeholder="Enter Username" id="username" name="username" required>
           	</div>
         	<div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
          </div>
          <div class="form-group text-center">
          <button type="submit" name="login" class="btn btn-primary">Login</button>
          </div>
            </div>
          </div>	
          
        </form>																	
    </div>
    <!--container section end-->
    {include file="main_footer.tpl"}
	{include file="main_js.tpl"}
</body>
</html>
