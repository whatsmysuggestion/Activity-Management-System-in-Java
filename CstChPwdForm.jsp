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
  
     
    if(ob.logname.value =="")
   {
      alert("Enter the username.");
      ob.logname.focus();
      return false;
	}
	 if(ob.logpwd.value =="")
   {
      alert("Enter the password.");
      ob.logpwd.focus();
      return false;
	}
 if(ob.logpwd.value.length < 5 || ob.logpwd.value.length > 10)
   {
     alert("Enter password within 5 to 10 letters.");
     ob.logpwd.focus();
     return false;
   }


   if(isNumber(ob.logname.value, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") != true)
   {
     alert("The username should comprise only Alphabet.");
     ob.logname.focus();
     return false;
   }
   
   if(isNumber(ob.logpwd.value, "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") != true)
   {
     alert("The password should comprise only Alphabet and Numbers.");
     ob.logpwd.focus();
     return false;
   }
   }			 
/*function fun1()
    {
     
     var logname=document.loginform.logname.value;
     var logpwd=document.loginform.logpwd.value;
     
     
    if(logname=="" ) 
          { 
          alert("Please enter a Login Name");
          document.loginform.logname.focus(); 
          return false; 
      }
     
     
     if(logpwd=="" ) 
      { 
      alert("Please enter a  Password");
      document.loginform.logpwd.focus();
      return false; 
      }
     
        else
         return true;
    }*/
</script></head> 
<body bgcolor="#abcdefff" onLoad=document.loginform.logname.focus();>

<%@ include file="nlogo.jsp" %>
 
 <center> <h1>CHANGE YOUR PASSWORD</h1></center>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1()"   action="CstChPwd.jsp"  target=_parent>
 <p>
 
  <center>Enter Login Name:&nbsp;<input type="text" name="logname" value="" size="10"></center>
 
 <p><p>
 <center>Enter Password :&nbsp;<input type="password" name="logpwd" value="" size="10"></center>
 
 
 <p>
 <p><p>
 
  <center> <input type="submit" name="submit" value="SUBMIT"  >
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="Reset"name="reset"value="RESET"> </center>
 
 
 
 </form>
 
 <form  action ="csttask.jsp">
  <center><input type="submit" name="BACK " value="BACK to Task Menu"   >  </center>
 </form>

</body>
</html>