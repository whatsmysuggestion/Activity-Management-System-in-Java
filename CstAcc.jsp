<html>
<body>

<%// include file="nlogo.jsp" %>
<%@ page import="java.sql.*" %>
<%
	String cno = (String)session.getAttribute("uname");
	try 
	{
		boolean found = false;
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
		PreparedStatement pst = con.prepareStatement("SELECT CST.CSNO, CST.FirstName, CST.LastName, CST.LoginName, CST.Email,     				CST.Address, CST.Phone FROM CST where csno=?");
		pst.setString(1, cno);
		ResultSet rscd = pst.executeQuery();
%>


<H2><center>Account Details  for Customer No. <% out.print(" "+cno+ "  ");%>  </center></H2>
<br>
<%
while(rscd.next())
{
%>
<div align="center">
  <center>

<Table  Caption="Customer Account " cols=2  width="60%" border = 2 cellpadding="0" cellspacing="0" style="border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: silver" fpstyle="9,011110100">
<TR>
  <TD width="150" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
  <font size="4" color="#800000">Customer No</font></TD>   
  <TD width="269" style="color: black; border-style: none; background-color: #FFFFEF" height="25"><font size="4" color="#800000"><%=rscd.getString(1) %></font></TD></TR>
<TR>
  <TD width="150" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
  <font size="4" color="#800000">First Name</font></TD>         
  <TD width="269" style="color: black; border-style: none; background-color: #FFFFEF" height="25"><font size="4" color="#800000"><%=rscd.getString(2) + " " + rscd.getString(3) %></font></TD></TR>
<TR>
  <TD width="150" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
  <font size="4" color="#800000">Login Name</font></TD>        
  <TD width="269" style="color: black; border-style: none; background-color: #FFFFEF" height="25"><font size="4" color="#800000"><%=rscd.getString(4) %></font></TD></TR>
<TR>
  <TD width="150" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
  <font size="4" color="#800000">Email</font></TD>               
  <TD width="269" style="color: black; border-style: none; background-color: #FFFFEF" height="25"><font size="4" color="#800000"><%=rscd.getString(5) %></font></TD></TR>
<TR>
  <TD width="150" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
  <font size="4" color="#800000">Address</font></TD>          
  <TD width="269" style="color: black; border-style: none; background-color: #FFFFEF" height="25"><font size="4" color="#800000"><%=rscd.getString(6) %></font></TD></TR>
<TR>
  <TD width="150" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
  <font size="4" color="#800000">Phone No.</font></TD>       
  <TD width="269" style="color: black; border-style: none; background-color: #FFFFEF" height="25"><font size="4" color="#800000"><%=rscd.getString(7) %></font></TD></TR>

</Table>
  </center>
</div>
<p><p><p>
<%
}
   		}catch(Exception e){
   			out.println(e);
   		}
%>

<br>
  <form  action ="csttask.jsp" target="_parent" >
   <center><input type="submit" name="BACK " value="BACK to Task Menu"   >  </center>
   </form>
  


</body>
</html>