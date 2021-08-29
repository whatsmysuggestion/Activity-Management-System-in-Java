<%@ page import="java.sql.*"%>
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Activity Management System</title>
<style>
.thead { font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon }
</style>
</head>

<body>
<%
	String ano = (String)session.getAttribute("uname");
%>
<p align="right"><b>Agent ID : <%=ano%></b></p>
<div align="center">
  <center>
  <b>New Customer Form</b><br>
  <form action="" method=post>
  <%
		try 
		{
			boolean found = false;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
			PreparedStatement pst = con.prepareStatement("SELECT eno, enqname FROM enqdetails");
			ResultSet rs = pst.executeQuery();
  %>
  <table border="0" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border-left-style: none; border-right-style: none; border-top-style: none; background-color: silver; border-collapse:collapse" fpstyle="9,011111000" bordercolor="#111111">
    <tr>
      <td width="682" style="background-color: #FFFFEF">
      <p align="center">Select from Enquiry :&nbsp;
      &nbsp;<select name="enq">
   		<%
      		while(rs.next())
      		{
      			String eqid = rs.getString(1);
   		%>
            <option selected value="<%=eqid %>"><%= eqid + "   " + rs.getString(2)%></option>
        <%
        	}
        %>
            </select></td>
    </tr>
  </table>
  <%
  		}
  		catch(Exception e){}
  %>
  </form>
  </center>
</div>

</body>

</html>