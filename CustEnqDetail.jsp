<%@ page import="java.sql.*"%>
<%!
     Connection con;
     PreparedStatement pst,pst1;Statement st;
     ResultSet rs;
     boolean del=false;String edat,esec,ethr;int enum,n=1;
%>
<html><head>
<script language="JavaScript"> 
function fun1()
    {      
      var csfname=document.loginform.eno.value;
      var cslname=document.loginform.edate.value;
       var cslogname=document.loginform.emsg.value;                  
       var estatus=document.loginform.estatus.value;                  
    
     if(csfname=="") 
      { 
      alert("Please enter a valid Customer Number");
      document.loginform.eno.focus(); 
      return false; 
      }      
       if(cslname=="") 
            { 
            alert("Please enter a valid Customer Name");
            document.loginform.edate.focus(); 
            return false; 
      }
       if(cslogname=="") 
            { 
            alert("Please enter a msg");
            document.loginform.emsg.focus(); 
            return false; 
      }         
           if(estatus=="") 
            { 
            alert("Please enter a status");
            document.loginform.estatus.focus(); 
            return false; 
      }         
     else
     return true;
    }
</script></head> 
<body bgcolor = "#abcdefff">
 <%@ include file="nlogo.jsp" %>
 <h1 align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Customer Details Report</h1>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1()"   action="AddCustEnq1.jsp" target=_parent>
 <p> 
 
 <p><p>

<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");	
pst=con.prepareStatement("select * from EnqDetails");
rs = pst.executeQuery();
if(rs.next())
{	
 enum = rs.getInt("ENo");
 edat = rs.getString("EnqDate");
 pst1=con.prepareStatement("delete from EnqDetails where ENo=?");
 pst1.setInt(1,enum);
 pst1.executeUpdate();
	out.println(edat);	
}
else
{
%>
<h2><font color=red>
<%
 out.println("All Enquiry added in the database...");
}
    %><br>
  Enquiry Number: &nbsp;&nbsp;&nbsp;<input type="text" name="eno"  value=<%=enum%> size="20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <p>    

   &nbsp;Enquiry Date :&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="edate" value="<%=edat%>" size="40">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
   
   

   <p>
   &nbsp;Enquiry Message:&nbsp;&nbsp; &nbsp;<input type="text" name="emsg" value="" size="20">&nbsp;
       
   

<p>   &nbsp;Enquiry Status:&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="estatus" size="20"><p>
 
 &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="SUBMIT"  >
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="Reset"name="reset"value="RESET">
 
 
 </form><form  action ="agtask.jsp">
 &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="BACK " value="BACK to Task Menu"   > 
 </form>
  


</body>
</html>
