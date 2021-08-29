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
<p align="right"><b><a target="_parent" href="NewApptForm.jsp">New Appointment</a></b></p>
<p align="right"><b><a target="_self" href="DelApptDetail.jsp">Delete 
Appointment</a></b></p>
<div align="center">
  <center>
  <%
		try 
		{
			boolean found = false;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
			PreparedStatement pst = con.prepareStatement("SELECT CSName, apdate, time FROM appt where agno=?");
			pst.setString(1, ano);
			ResultSet rs = pst.executeQuery();
  %>
  <table border="0" cellpadding="0" cellspacing="0" width="676" id="AutoNumber1" style="border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: silver; border-collapse:collapse" fpstyle="9,011111000" bordercolor="#111111" height="78">
    <tr class="thead">
      <td width="280" height="21">Customer Name</td>
      <td width="156" height="21">Date</td>
      <td width="169" height="21">Time</td>
    </tr>
    <tr>
      <td width="605" style="color: black; border-style: none; background-color: #FFFFEF" colspan="3" height="19">&nbsp;
      </td>
    </tr>
    <%
    	while(rs.next())
    	{
    		found = true;
    %>
    <tr>
      <td width="280" style="color: black; border-style: none; background-color: #FFFFEF" height="19">&nbsp;<%= rs.getString(1) %></td>
      <td width="156" style="color: black; border-style: none; background-color: #FFFFEF" height="19">&nbsp;<%= rs.getString(2) %></td>
      <td width="169" style="color: black; border-style: none; background-color: #FFFFEF" height="19">&nbsp;<%= rs.getString(3) %></td>
    </tr>
    <%
    	}
    	if(!found)
    	{
    %>
    <tr>
      <td width="605" style="color: black; border-style: none; background-color: #FFFFEF" colspan="3" height="19">
      <p align="center">No Record Found</td>
    </tr>
    <%
    	}
    }
    catch(Exception e)
    {
    	out.println(e);
    }
    %>
    </table>
  <br>
  </center>
</div>

<p align="center">&nbsp;</p>

</body>

</html>