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


<%@ include file="nlogo.jsp" %>


 <%@ page import="java.sql.*" %>

 <%! String s,s1,a1,a2,a3,a4,a5,a6,a7,a8,a9;%>

   
   <%
s=request.getParameter("brno");
System.out.println(s);
try {
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");	
	 Statement st=con.createStatement();
  	 ResultSet rs= st.executeQuery("Select * from MGR where BRNO='"+s+"'");
     System.out.println("ok1");
 	 while(rs.next())
	 {   
		a1=rs.getString(2);  
		a2=rs.getString(3);  
		a3=rs.getString(4);  
		a4=rs.getString(5);  
		a5=rs.getString(6);  
		a6=rs.getString(7);  
		a7=rs.getString(8);  
		System.out.println(a7);
%>

 
 
		<center> <h1> Replace Managers </h1></center>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1()"   action="RepMgr.jsp" target=_parent>
 		<p> 
 
 		<p>

		 <p>
		Branch No :&nbsp;&nbsp;&nbsp;<input type="text" name="brno" value=<%=s%> readonly maxlength="10"> 
		<p> 
 
 		<p>
		<B>Enter  New Manager Details:</B>
		 <p>

 		Enter  FirstName :&nbsp;&nbsp;&nbsp;<input type="text" name="mfname" value=<%=a1%> maxlength="30">					  								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
 Enter Last Name:&nbsp;&nbsp;&nbsp;<input type="text" name="mlname" value=<%=a2%> maxlength="30">
 <p>
	 Enter  Login Name:&nbsp;<input type="text" name="mlogname" value=<%=a3%> maxlength="15">  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

 Enter  Password:&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="mpwd" value=<%=a4%> maxlength="10">
 <p>
 Enter  Email-ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="memail" value=<%=a5%> maxlength="50">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  Enter  Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="maddr" value=<%=a6%> maxlength="100">
 <p>
  Enter  PhoneNo:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="mph" value=<%=a7%>>   
 <p>
<%    }
 }catch(Exception e){}%>
 <p>
 <p><p>
 <input type="submit" name="submit" value="SUBMIT"  >
 &nbsp;&nbsp;&nbsp;
 
 
</form>
<form  action ="zmgtask.jsp">
 &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="BACK " value="BACK to Task Menu"   > 
</form>

</body>
</html>