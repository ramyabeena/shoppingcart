<div class="container-fluid">
	  {if $smarty.request.successmsg!=""}	
      <div class="alert alert-success alert-dismissible fade show">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Success!</strong>  {$smarty.request.successmsg}
      </div>
      {/if}
      {if $smarty.request.errormsg!=""}	
      <div class="alert alert-danger alert-dismissible fade show">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Error!</strong> {$smarty.request.errormsg}
      </div>
      {/if}
	<table class="table table-bordered">
    <thead>
      <tr>
        <th class="text-center">Banner Id</th>
        <th class="text-center">Banner Link</th>
        <th class="text-center">Banner Image</th>
        <th class="text-center">Status</th>
        <th class="text-center">Edit</th>
        <th class="text-center">Delete</th>
      </tr>
    </thead>
    <tbody>
    {section name=banList loop=$bannerList}
   
    
      <tr>
        <td>{$bannerList[banList].banner_id}.</td>
        <td>{$bannerList[banList].banner_link}</td>
        <td><img src="../banner_images/{$bannerList[banList].banner_image}" class="img-thumbnail" /></td>
        <td class="text-center">
        
        {if $bannerList[banList].banner_status eq 1}
			 <a href="#" onClick="changeToBannerDeactive('{$bannerList[banList].banner_id}');"> 
			 <img src="images/ok.png" width="16" height="16" border="0" alt="active" align="absmiddle" 
			 style="cursor:pointer;" ></a>
			 {else}
			 <a href="#" onClick="changeToBannerActive('{$bannerList[banList].banner_id}');"> 
			<img src="images/delete.png" width="16" height="16" border="0" alt="Inactive"></a>
			{/if}
        </td>
        <td class="text-center">
			<a href="editBanner.php?id={$bannerList[banList].banner_id}"><img src="images/edit.png" border="0" width="16" height="16" title="Edit" alt="Edit"></a>
            <a href="editBannerImage.php?id={$bannerList[banList].banner_id}"><img src="images/picture.png" border="0" width="16" height="16" title="Edit" alt="Edit"></a>
		</td>
		<td class="text-center">
			<a href="#" onclick="deleteBanner('{$bannerList[banList].banner_id}');"><img src="images/remove.png" border="0" width="16" height="16" title="Delete" alt="Delete"></a>
		</td>
      </tr>
     {/section}
    </tbody>
  </table>
  
  <!-- Right-aligned -->
  
    <ul class="pagination justify-content-end" style="margin:20px 0">
      <li class="page-item">{$pagination}</li>
    </ul>
</div>
{literal}
<script>
function changeToBannerDeactive(banner_id)
{
	if(confirm("Are you sure want to deactivate this banner?"))
	{
		$.post("ajaxFile.php",{"banner_id":banner_id,"action":"changeToBannerDeactive"},function(data)
		{
			alert(data);
		});
		window.location.reload();
	}
}
function changeToBannerActive(banner_id)
{
	if(confirm("Are you sure want to activate this banner?"))
	{
		$.post("ajaxFile.php",{"banner_id":banner_id,"action":"changeToBannerActive"},function(data)
		{
			alert(data);
		});
		window.location.reload();

	}
}
function deleteBanner(banner_id)
{
	if(confirm("Are you sure want to delete this banner?"))
	{
		$.post("ajaxFile.php",{"banner_id":banner_id,"action":"deleteBanner"},function(data)
		{
			alert(data);
		});
		window.location.reload();

	}
}
</script>
{/literal}