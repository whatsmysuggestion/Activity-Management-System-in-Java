<html>
<head>

<script language="JavaScript" >

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
   if(ob.bname.value =="")
   {
      alert("Enter the branchname.");
      ob.bname.focus();
      return false;
	}
	
	

   if(isNumber(ob.bname.value, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") != true)
   {
     alert("The branchname should comprise only Alphabet.");
     ob.bname.focus();
     return false;
   }
   
   if(ob.baddr.value =="")
   {
      alert("Enter the branchadress.");
      ob.baddr.focus();
      return false;
	}
    
   if(isNumber(ob.baddr.value, "' '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") !=true)
   {
     alert("The branch address should comprise only Alphabet and Numbers.");
     ob.baddr.focus();
     return false;
   }
   }
 


</script>
</head> 

<body bgcolor="#abcdefff" onLoad=document.loginform.bname.focus();>

<%@ page import="java.sql.*,ABean.KMVBean"%>

<jsp:useBean id="KBean4"  scope="session" class="ABean.KMVBean"/>

<%KBean4.match=0;%>

<%@ include file="nlogo.jsp" %>

 
 
 <fieldset ><legend> <h1>Add New Branch </h1></legend>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1();" action="AddBR.jsp" target=_parent>

 <p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
 
 <p>
 <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

 Enter Branch Name:       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<!--webbot bot="Validation" s-data-type="String" b-allow-letters="TRUE" i-maximum-length="30" -->
 <input type="text" name="bname" value=""size="50" maxlength="30">
 <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
 
 Enter Branch  Address: &nbsp;
 <input type="textfield" name="baddr" value="" size="50" maxlength="100">
 <p>
 <p>
 <p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="submit" name="submit" value="SUBMIT"   onClick="return fun1()" >
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="Reset"name="reset"value="RESET">
 
 
 </form>
 </fieldset>
 <a href="zmgtask.jsp">BACK </a>


</body>
</html>