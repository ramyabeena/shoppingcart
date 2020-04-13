function validateEmailAddress()
{
	var name=document.form1.name.value;
	var nameregex = /^[a-zA-Z ]{2,30}$/;
	var emailadd=document.form1.emailadd.value;
	if(name=="")
	{
		alert("Please enter your name:");
		document.form1.name.focus();
		return false;
	}
	if (!nameregex.test(name))
	{
		alert("Please enter valid name");
		document.form1.name.value="";
		document.form1.name.focus();
		return false;
    }
	if(emailadd=="")
	{
		alert("Please enter your email address:");
		document.form1.emailadd.focus();
		return false;
	}
	 if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(emailadd)))
	  {
	    alert("You have entered an invalid email address!")
	    document.form1.emailadd.value="";
	    document.form1.emailadd.focus();
	    return (false);
	}
	else
	{
		$.post("ajaxFile.php",{"name":name,"emailadd":emailadd,"action":"validateNameEmail"},function(data)
		        {
		            alert(data);
		        });
				document.form1.name.value="";
				document.form1.emailadd.value="";
				document.form1.name.focus();
		        //return false;
		        window.location.reload();
	}	
}


function exportpdf()
{
	window.open("exportpdf.php");
}

function exportexcel()
{
	window.open("exportexcel.php");
}
function exportcsv()
{
		window.open("exportcsv.php");
}