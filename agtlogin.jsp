<html><head>
<script language="JavaScript"> 
function isNumber(data, type)
{
	var numStr=type;
	var thisChar;
	var counter=0;
	for(var i=0; i < data.length; i++)
		{
			thisChar=data.substring(i,i+1);
			if(numStr.indexOf(thisChar)!=-1)
			{counter++;}
		}
		if(counter==data.length)
		{return true;}
		else
		return false;
 }

 		 
			 function fun1()
 {
   var ob = this.document.loginform;
  
     
    if(ob.uname.value =="")
   {
      alert("Enter Login Name.");
      ob.uname.focus();
      return false;
	}
	 if(ob.upwd.value=="")
   {
      alert("Enter the password.");
      ob.upwd.focus();
      return false;
	}
 if(ob.upwd.value.length < 5 || ob.upwd.value.length > 10)
   {
     alert("Enter Password within 5 to 10 letters.");
     ob.upwd.focus();
     return false;
   }


   if(isNumber(ob.uname.value,	"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") != true)
   {
     alert("The Login Name should comprise only Alphabet.");
     ob.uname.focus();
     return false;
   }
   
if(isNumber(ob.upwd.value, "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")!= true)
  {
     alert("The Password should comprise only Alphabet and Numbers.");
     ob.upwd.focus();
     return false;
   }
}
</script></head> 
<body onLoad=document.loginform.uname.focus();> 
<fieldset><legend> <h1>Agent Login </h1></legend>



<form name="loginform" method="post" onSubmit="return fun1()"   action="AgtVal" target=_parent>
<p> 

<p><p align="center">
&nbsp;&nbsp;&nbsp;&nbsp;Enter Login Name:&nbsp;<input type="text" name="uname" value="" size="20" maxlength="15">
<p align="center">
 &nbsp;&nbsp;&nbsp;&nbsp;Enter Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="upwd" value="" size="20" maxlength="10">

<p><p align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="submit" value="SUBMIT">
<input type="Reset"name="reset"value="RESET"><p align="center">
<a target="_parent" href="index.jsp">Home</a></form>
</fieldset>


</body>
</html>