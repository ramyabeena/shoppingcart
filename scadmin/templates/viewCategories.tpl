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
        <th class="text-center">Category Id</th>
        <th class="text-center">Category Name</th>
        <th class="text-center">Status</th>
        <th class="text-center">Edit</th>
        <th class="text-center">Delete</th>
      </tr>
    </thead>
    <tbody>
    {section name=catList loop=$categoryList}
      <tr>
        <td>{$categoryList[catList].category_id}.</td>
        <td>{$categoryList[catList].category_name}</td>
        <td class="text-center">
        
        {if $categoryList[catList].category_status eq 1}
			 <a href="#" onClick="changeToCategoryDeactive('{$categoryList[catList].category_id}');"> 
			 <img src="images/ok.png" width="16" height="16" border="0" alt="active" align="absmiddle" 
			 style="cursor:pointer;" ></a>
			 {else}
			 <a href="#" onClick="changeToCategoryActive('{$categoryList[catList].category_id}');"> 
			<img src="images/delete.png" width="16" height="16" border="0" alt="Inactive"></a>
			{/if}
        </td>
        <td class="text-center">
			<a href="editCategory.php?id={$categoryList[catList].category_id}"><img src="images/edit.png" border="0" width="16" height="16" title="Edit" alt="Edit"></a>
            <a href="editCategoryImage.php?id={$categoryList[catList].category_id}"><img src="images/picture.png" border="0" width="16" height="16" title="Edit" alt="Edit"></a>
		</td>
		<td class="text-center">
			<a href="#" onclick="deleteCategory('{$categoryList[catList].category_id}');"><img src="images/remove.png" border="0" width="16" height="16" title="Delete" alt="Delete"></a>
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
function changeToCategoryDeactive(category_id)
{
	if(confirm("Are you sure want to deactivate this category?"))
	{
		$.post("ajaxFile.php",{"category_id":category_id,"action":"changeToCategoryDeActive"},function(data)
		{
			alert(data);
		});
		window.location.reload();
	}
}
function changeToCategoryActive(category_id)
{
	if(confirm("Are you sure want to activate this category?"))
	{
		$.post("ajaxFile.php",{"category_id":category_id,"action":"changeToCategoryActive"},function(data)
		{
			alert(data);
		});
		window.location.reload();

	}
}
function deleteCategory(category_id)
{
	if(confirm("Are you sure want to delete this category?"))
	{
		$.post("ajaxFile.php",{"category_id":category_id,"action":"deleteCategory"},function(data)
		{
			alert(data);
		});
		window.location.reload();

	}
}
</script>
{/literal}