<%@ page import="java.sql.*"%>
<%!
     Connection con;
     PreparedStatement pst;
     ResultSet rs;String date;
%>
<html><head>
<script type="text/javascript" language="JavaScript" src="jscript/popcalendar.js"></script>
<script language="JavaScript"> 
function fun1()
    {      
      var csfname=document.loginform.eno.value;
      var cslname=document.loginform.ename.value;
       var cslogname=document.loginform.doenq.value;                  
    
     if(csfname=="") 
      { 
      alert("Please enter a valid Customer Number");
      document.loginform.eno.focus(); 
      return false; 
      }      
       if(cslname=="") 
            { 
            alert("Please enter a valid Customer Name");
            document.loginform.ename.focus(); 
            return false; 
      }
       if(cslogname=="") 
            { 
            alert("Please enter a Date");
            document.loginform.doenq.focus(); 
            return false; 
      }         
     else
     return true;
    }
</script></head> 
<body bgcolor = "#abcdefff">
<%@ include file="nlogo.jsp" %>
 <h1 align="center"><font size="4">Add New Enquiry </font> </h1>
<%

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","scott");	
Statement st=con.createStatement();
ResultSet rs = st.executeQuery("select max(ENo) from EnqDetails");
 int uid=100;
if(rs.next())
{
	String str = rs.getString(1);
	if (str != null)
	uid = Integer.parseInt(str) + 1;
	
		
}
%> 
 
 
 <div align="center"><br>
   <center>
   <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="60%" id="AutoNumber1">
    <form name="loginform" method="Get" onSubmit="return fun1()"   action="AddCustEnq.jsp" target=_parent>
     <tr>
       <td width="50%">Enquiry Number:</td>
       <td width="50%"><input type="text" name="eno"  value="<%=uid%>" size="20"></td>
     </tr>
     <tr>
       <td width="50%">&nbsp;</td>
       <td width="50%">&nbsp;</td>
     </tr>
     <tr>
       <td width="50%">Customer First Name:</td>
       <td width="50%"><input type="text" name="ename" value="" size="20"></td>
     </tr>
     <tr>
       <td width="50%">&nbsp;</td>
       <td width="50%">&nbsp;</td>
     </tr>
     <tr>
       <td width="50%">Last Name:</td>
       <td width="50%"><input type="text" name="elname" value="" size="20"></td>
     </tr>
     <tr>
       <td width="50%">&nbsp;</td>
       <td width="50%">&nbsp;</td>
     </tr>
     <tr>
       <td width="50%">Email</td>
       <td width="50%"><input type="text" name="email" value="" size="20"></td>
     </tr>
     <tr>
       <td width="50%">&nbsp;</td>
       <td width="50%">&nbsp;</td>
     </tr>
     <tr>
       <td width="50%">Contact No</td>
       <td width="50%"><input type="text" name="contactno" value="" size="20"></td>
     </tr>
     <tr>
       <td width="50%">&nbsp;</td>
       <td width="50%">&nbsp;</td>
     </tr>
     <tr>
       <td width="50%">Address</td>
       <td width="50%"><textarea rows="3" name="address" cols="20"></textarea></td>
     </tr>
     <tr>
       <td width="50%">&nbsp;</td>
       <td width="50%">&nbsp;</td>
     </tr>
     <tr>
       <td width="50%">Date Of Enquiry:&nbsp;</td>
       <td width="50%"><input type="text" name="doenq" size="17" readonly><a onClick="javascript:showCalendar(this, loginform.doenq, 'dd-mm-yyyy',0,400,550)" href="#"><img height="18" alt="Calendar" src="images/calendar.gif" width="18" border="0"></a></td>
     </tr>
     <tr>
       <td width="50%">&nbsp;</td>
       <td width="50%">&nbsp;</td>
     </tr>
     <tr>
       <td width="50%">Type of Enquiry:</td>
       <td width="50%">
       	<select size="1" name="typeEnq">
			<option>Cold Call</option>
			<option>Follow Call</option>
			<option>Visit Call</option>
		</select>
		</td>
     </tr>
     <tr>
       <td width="50%">&nbsp;</td>
       <td width="50%">&nbsp;</td>
     </tr>
     <tr>
       <td width="50%">
       <p align="center"><input type="submit" name="submit" value="SUBMIT"  ></td>
       <td width="50%">
       <p align="center"><input type="Reset"name="reset"value="RESET"></td>
     </tr>
     <tr>
       <td width="50%">&nbsp;</td>
       <td width="50%">&nbsp;</td>
     </tr>
      </form>
      <form  action ="agtask.jsp">
     <tr>
       <td width="100%" colspan="2">
       <p align="center"><input type="submit" name="BACK " value="BACK to Task Menu"   ></td>
     </tr>
      </form>
   </table>
   </center>
 </div>
</body>
</html>