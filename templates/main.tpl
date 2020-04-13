<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    {include file="main_header.tpl"}
	{include file="main_css.tpl"}
</head>
<body>
	<!--wrapper start-->
	<div id="wrapper">
		<!--container section start-->
		<div id="container">
        	{include file="main_menu.tpl"}
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
