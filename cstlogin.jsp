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
						{
							return true;
						}
							else
							return false;
			 }			
			 
 function fun1()
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
      alert("Enter Password.");
      ob.upwd.focus();
      return false;
	}
 if(ob.upwd.value.length < 5 || ob.upwd.value.length > 10)
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
</script></head> 
<body onLoad=document.loginform.uname.focus();> 
<fieldset ><legend> <h1>Customer Login </h1></legend>



<form name="loginform" method="POST" onSubmit="return fun1()"   action="CustVal" target=_parent>
<p> 
<center>

Enter Login Name:&nbsp;<input type="text" name="uname" value="" size="20" maxlength="15">
<p>
Enter Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="upwd" value="" size="20" maxlength="10">

<p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="submit" name="submit" value="SUBMIT">

<input type="Reset"name="reset"value="RESET">
<p>

<a target="_parent" href="index.jsp">Home</a></center>

</form>
</fieldset>


</body>
</html>