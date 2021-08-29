<html><head>
<script language="JavaScript"> 
function fun1()
    {
     

     var mfname=document.loginform.mfname.value;
     var mlname=document.loginform.mlname.value;
     var mlogname=document.loginform.mlogname.value;
     var mpwd=document.loginform.mpwd.value;
     var memail=document.loginform.memail.value;
     var maddr=document.loginform.maddr.value;    
     var mph=document.loginform.mph.value;
     
     
  
     if(mfname=="") 
      { 
      alert("Please enter ManagerFirstName");
      document.loginform.mfname.focus();
      return false; 
      }
     if(mlname=="") 
      { 
      alert("Please enter a valid ManagerLastName");
      document.loginform.mlname.focus(); 
      return false; 
      }
    if(mlogname=="") 
      { 
      alert("Please enter a valid LoginName");
      document.loginform.mlogname.focus(); 
      return false; 
      } 
    if(mpwd=="") 
      { 
      alert("Please enter Valid Password");
      document.loginform.mpwd.focus();
      return false; 
      }
     if(memail=="") 
      { 
      alert("Please enter a valid E-mailId");
      document.loginform.memail.focus(); 
      return false; 
      }
      
      var i=0;
      	var j=0;
      	var k=0;
            for(i=0;i<memail.length;i++)
            	{
            	if(memail.charAt(i)==".")
            	{
            	++j;
            	}
            	if(memail.charAt(i)=="@")
            	{
            	++k;
            	}
            
            	}
            
            
            	if(j>2||k>1)
            	{
            	alert("Please Enter Valid Email Id");
            	document.loginform.memail.focus();
            	return false;
            	}
            
            
            
            	i=0;j=0,k=0;
            
            	for(i=0;i<memail.length;i++)
            	{
            	if(memail.charAt(i)==".")
            	{
            	j=i;
            	break;
            	}
            	if(memail.charAt(i)=="@")
            	{
            	k=i;
            	}
            
            	}
            
            	if(((j-k)<2)||(k==0)||(memail.length==j))
            	{
            	alert("Please Enter Valid Email Id");
            	document.loginform.memail.focus();
            	return false;
            	}
            
            

      
      
      
    if(maddr=="") 
      { 
      alert("Please enter a valid Address");
      document.loginform.maddr.focus(); 
      return false; 
      }   
      
     if(mph=="" || isNaN(mph)) 
      { 
            alert("Please enter a valid PhoneNo");
      document.loginform.mph.focus(); 
      return false; 
      }   
     else
     return true;
    }
</script></head> 
<body  onLoad=document.loginform.mfname.focus();>

<%@ include file="newlogo.jsp" %>
<%@ page import="java.sql.*" %>

<jsp:useBean id="KBean5"  scope="session" class="ABean.KMVBean" />
<% KBean5.match=0;%>


 
 
 <fieldset ><legend> <h1>Add New Manager </h1></legend>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1()"   action="AddMgr.jsp" target=_parent>
 <p> 
 
 <p>


 Enter  FirstName:&nbsp;<input type="text" name="mfname" value="">
 <p>
 Enter  LastName:&nbsp;<input type="text" name="mlname" value="">
 <p>
 Enter  LoginName:&nbsp;<input type="text" name="mlogname" value="">
 <p>
 Enter  Password:&nbsp;<input type="password" name="mpwd" value="">
 <p>
 Enter  Email-ID:&nbsp;<input type="text" name="memail" value="">
 <p>
  Enter  Address:&nbsp;<input type="textfield" name="maddr" value="" >
 <p>
  Enter  PhoneNo:&nbsp;<input type="text" name="mph" value="">
 <p>
  
 <p>
 <p><p>
 <input type="submit" name="submit" value="SUBMIT"  >
 &nbsp;&nbsp;&nbsp;
 <input type="Reset"name="reset"value="RESET">
 
 
 </form>
 </fieldset>


</body>
</html>