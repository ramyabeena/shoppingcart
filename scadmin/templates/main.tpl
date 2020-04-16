<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Admin Panel</title>
	{include file="main_css.tpl"}
</head>
<body>
	{include file="main_menu.tpl"}
	<!--wrapper start-->
	<div id="wrapper">
		<!--container section start-->
		<div id="container">
			{$MAIN_CONTENT}
		</div>
		<!--container section end-->
		<!--footer section start-->
		<div id="footer">
			{include file="main_footer.tpl"}
		</div>
		<!--footer section end-->
	</div>
	<!--wrapper end-->
	{include file="main_js.tpl"}
</body>
</html>
