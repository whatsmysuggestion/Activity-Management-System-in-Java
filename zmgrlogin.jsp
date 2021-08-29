<html>
<head>

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
						{
							return true;
						}
							else
							return false;
			 }				
     
  function Regvalidat()
  {
   var ob = this.document.loginform;
  if(ob.uname.value =="")
  {
      alert("Enter Login Name.");
      ob.uname.select();
      return false;
	}
 if(ob.upwd.value =="")
   {
      alert("Enter the Password.");
      ob.upwd.select();
      return false;
	}
 if(ob.upwd.value.length<5 || ob.upwd.value.length >10)
   {
     alert("Enter Password within 5 to 10 letters.");
     ob.upwd.select();
     return false;
   }


 if(isNumber(ob.uname.value, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") != true)
   {
     alert("The Login Name should comprise only Alphabet.");
     ob.uname.select();
     return false;
   }
   
 if(isNumber(ob.upwd.value, "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") != true)
   {
     alert("The Password should comprise only Alphabet and Numbers.");
     ob.upwd.select();
     return false;
   }
   }
</script>
<base target="_parent">
</head> 

<body onLoad=document.loginform.uname.focus();> 
<fieldset ><legend> <h1>Zonal Manager Login </h1></legend>

<!--<form name="loginform" method="Get" onSubmit="return fun1()"   action="ZmgrVal" target=_parent>-->
<form name="loginform" method="Post" onSubmit="return Regvalidat();"  action="ZmgrVal" target=_parent>
<p> 
<p>
<p align="center">
Enter Login Name:&nbsp; 	 
<input type="text" name="uname" value="" size="20" maxlength="15">
<p align="center">
 Enter Password:&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="password" name="upwd" value="" size="20" maxlength="10">
<p align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="submit" name="submit" value="SUBMIT">
  <input type="Reset"name="reset"value="RESET">
<p align="center"><a target="_parent" href="index.jsp">Home</a>

</form>
</fieldset>
</body>
</html>