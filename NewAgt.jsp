<html><head>
<script language="JavaScript"> 
function fun1()
    {
      var agfname=document.loginform.agfname.value;
      var aglname=document.loginform.aglname.value;
      var aglogname=document.loginform.aglogname.value;
      var agpwd=document.loginform.agpwd.value;
      var agptype=document.loginform.agptype.value;
      var agemail=document.loginform.agemail.value;
      var agaddr=document.loginform.agaddr.value;
      var agph=document.loginform.agph.value;
     
    
    
     if(agfname=="") 
      { 
      alert("Please enter a valid AgentFirstName");
      document.loginform.agfname.focus(); 
      return false; 
      }
	 
	 
	  if(agfname=="@") 
      {
      alert("Please enter a valid AgentFirstName");
      document.loginform.agfname.focus(); 
      return false; 
      }
	        
	   if(aglname=="") 
            { 
            alert("Please enter a valid AgentLastName");
            document.loginform.aglname.focus(); 
            return false; 
      }
       if(aglogname=="") 
            { 
            alert("Please enter a valid AgentLoginName");
            document.loginform.aglogname.focus(); 
            return false; 
			
      }
    if(agpwd=="") 
      { 
      alert("Please enter a valid AgentPassword");
      document.loginform.agpwd.focus(); 
      return false; 
      }  
       if(agptype=="") 
            { 
            alert("Please enter a valid PolicyType");
            document.loginform.agptype.focus(); 
            return false; 
            }
            
           
        
       if(agemail=="") 
            { 
            alert("Please enter a valid EmailId");
            document.loginform.agemail.focus(); 
            return false; 
      }  
      
      var i=0;
      	var j=0;
	var k=0;
      for(i=0;i<agemail.length;i++)
      	{
      	if(agemail.charAt(i)==".")
      	{
      	++j;
      	}
      	if(agemail.charAt(i)=="@")
      	{
      	++k;
      	}
      
      	}
      
      
      	if(j>2||k>1)
      	{
      	alert("Please Enter Valid Email Id");
      	document.loginform.agemail.focus();
      	return false;
      	}
      
      
      
      	i=0;j=0,k=0;
      
      	for(i=0;i<agemail.length;i++)
      	{
      	if(agemail.charAt(i)==".")
      	{
      	j=i;
      	break;
      	}
      	if(agemail.charAt(i)=="@")
      	{
      	k=i;
      	}
      
      	}
      
      	if(((j-k)<2)||(k==0)||(agemail.length==j))
      	{
      	alert("Please Enter Valid Email Id");
      	document.loginform.agemail.focus();
      	return false;
      	}
                
       if(agaddr=="") 
            { 
            alert("Please enter a valid Address");
            document.loginform.agaddr.focus(); 
            return false; 
      }  
       if(agph=="" || isNaN(agph)) 
            { 
            alert("Please enter a valid PhoneNo");
            document.loginform.agph.focus(); 
            return false; 
      }        
      
     else
     return true;
    }
</script>

<script language="javascript" src="eBankscripts/usefun.js"></script>

</head> 
<body bgcolor = "#abcdefff" onLoad=document.loginform.agfname.focus();>

<jsp:useBean id="KBean9"  scope="session" class="ABean.KMVBean" />
<% KBean9.match=0;%>

<%@ include file="newlogo.jsp" %>
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add New Agent </h1>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1()"   action="AddAgt.jsp" target=_parent>
 <p> 
 
 <p><p>


  Enter  FirstName:&nbsp;&nbsp;&nbsp;<input type="text" name="agfname" value="" maxlength="30">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   Enter Last Name:&nbsp;&nbsp;&nbsp; 
   <input type="text" name="aglname" value="" maxlength="30">
   <p>
   Enter  LoginName:&nbsp;<input type="text" name="aglogname" value="" maxlength="30">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   Enter  Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     
   <input type="password" name="agpwd" value="" maxlength="10">
   <p>
     Enter  PolicyType:&nbsp;&nbsp;<select name="agptype">
                                                     <option value="">--</option>
                                                    <option value="JSK">JSK (Jeevan Sukanya)</option>
                                                    <option value="JRK">JRK (Jana Raksha)</option>
                                                    <option value="JCH">JCH (Jeevan Chhaya)</option>
                                                    <option value="NJR">NJR (New Jana Raksha)</option>
                                                    </select>
     
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   Enter  Email-ID:&nbsp;&nbsp;&nbsp; 
   <input type="text" name="agemail" value="" maxlength="30">
   <p>
    Enter  Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="textfield" name="agaddr" value="" maxlength="100" >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enter  Phone No:&nbsp;&nbsp; &nbsp;
    <input type="text" name="agph" value="" maxlength="15">
   
  
 <p><p>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="submit" name="submit" value="SUBMIT">
  <input type="Reset"name="reset"value="RESET">
  </form><form  action ="mgtask.jsp">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="BACK " value="BACK to Task Menu"> 
 </form>
  


</body>
</html>