<html><head>
<script language="JavaScript"> 
function fun1()
    {
     
     var brno=document.loginform.brno.value;
     var mfname=document.loginform.mfname.value;
     var mlname=document.loginform.mlname.value;
     var mlogname=document.loginform.mlogname.value;
     var mpwd=document.loginform.mpwd.value;
     var memail=document.loginform.memail.value;
     var maddr=document.loginform.maddr.value;    
     var mph=document.loginform.mph.value;
     
     if(brno=="") 
           { 
           alert("Please enter BranchNo CORRECTLY");
           document.loginform.brno.focus();
           return false; 
      }
  
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
          {  return true;}
    }
</script></head> 
<body bgcolor = "#abcdefff"  onLoad=document.loginform.brno.focus();>


<%@ include file="newlogo.jsp" %>

<jsp:useBean id="KBean6"  scope="session" class="ABean.KMVBean"/>
 <% KBean6.match=0; %>
 
 <%@ page import="java.sql.*" %>
 <jsp:useBean id="KBean6A" class="ABean.KMVBean"/>
 
 <%! String s,s1,a;%>

 <%! int count; %>
 <%
    Cookie [] coks=request.getCookies();
    
     for(count=0;count<coks.length;count++)
         {
           s1=coks[count].getName();
         
                if (s1.equals("zno"))
                 { 
                    System.out.println("....jsp..KBean6A....s1=cookie name=" +s1);
                     s=coks[count].getValue();
                     KBean6A.setCk(s);
                     break;
                 }
           }
   %>  
   <jsp:getProperty name="KBean6A" property="branch"/>
   <%! ResultSet rs6A;%>
   <%
   rs6A=KBean6A.rs;
   
   System.out.println("...jsp ..KBean6A..2");
   
%>

 
 
<center> <h1> Replace Manager </h1></center>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1()"   action="RepMgr.jsp" target=_parent>
 <p> 
 
 <p>
 Enter  BranchNo:&nbsp;&nbsp;&nbsp;<select name="brno">
                                          <option>--</option>
                                          <%   while(rs6A.next())
					  	  {   a=rs6A.getString(9);  %>
					  	  
					  	    <option value=<%out.println(a);%> > <%out.println(a);%> </option>
					  
					   
                                         
                                          </select>
 <p>

<p> 
 
 <p>
<B>Enter  New Manager Details:</B>
 <p>

 Enter  FirstName :&nbsp;&nbsp;&nbsp;<input type="text" name="mfname" value=<%out.println(rs6A.getString(2));%>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
 Enter  LastName:&nbsp;&nbsp;&nbsp;<input type="text" name="mlname" value=<%out.println(rs6A.getString(3));%>>
 <p>
 Enter  LoginName:&nbsp;<input type="text" name="mlogname" value=<%out.println(rs6A.getString(4));%>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

 Enter  Password:&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="mpwd" value=<%out.println(rs6A.getString(5));%>>
 <p>
 Enter  Email-ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="memail" value=<%out.println(rs6A.getString(6));%>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  Enter  Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="maddr" value=<%out.println(rs6A.getString(7));%>>
 <p>
  Enter  PhoneNo:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="mph" value=<%out.println(rs6A.getString(8));%>>
<%} %>
 <p>
  
 <p>
 <p><p>
 <input type="submit" name="submit" value="SUBMIT"  >
 &nbsp;&nbsp;&nbsp;
 <input type="Reset"name="reset"value="RESET">
 
</form>
<form  action ="zmgtask.jsp">
 &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="BACK " value="BACK to Task Menu"   > 
 </form>

</body>
</html>