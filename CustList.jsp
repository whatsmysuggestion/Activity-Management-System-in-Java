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
<p align="right"><b><a target="_parent" href="CustForm.jsp">Add New Customer</a></b></p>
<h3 align="right"><font size="3"><a target="main" href="PolicyDetails.jsp"> Policy Details</a></font></h3>
<p align="center"><b><font size="4">Customer Details</font></b></p>
<div align="center">
  <center>
<jsp:useBean id="KBean4"  scope="session" class="ABean.KMVBean" />

  <%
		try 
		{
			boolean found = false;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
			PreparedStatement pst = con.prepareStatement("SELECT CST.CSNO, CST.FirstName, CST.LastName, CustPolicy.policyno, CustPolicy.pdate, CST.Address, CST.Phone FROM CST LEFT JOIN CustPolicy ON CST.CSNO = CustPolicy.csno where cst.agno=?");
			pst.setString(1, ano);
			ResultSet rs = pst.executeQuery();
  %>
  <table border="0" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: silver; border-collapse:collapse" fpstyle="9,011111000" bordercolor="#111111">
    <tr class="thead">
      <td width="93">Customer ID</td>
      <td width="187">Customer Name</td>
      <td width="78">Policy No</td>
      <td width="97">Policy Date</td>
      <td width="117">Address</td>
      <td width="110">Phone</td>
    </tr>
    <tr>
      <td width="682" style="color: black; border-style: none; background-color: #FFFFEF" colspan="6">&nbsp;
      </td>
    </tr>
    <%
    	String co="FFFFFF";
    	int c = 1;
    	while(rs.next())
    	{
    		if(c%2==0)
    			co = "FFFFEF";
    		else
    			co = "FFFFFF";
    		found = true;
    		String s1="", s2="";
    %>
    <tr>
      <td width="93" style="color: black; border-style: none; background-color: #<%=co%>">&nbsp;<%= rs.getString(1) %></td>
      <td width="187" style="color: black; border-style: none; background-color: #<%=co%>">&nbsp;<%= rs.getString(2) + " " + rs.getString(3) %></td>
      <td width="78" style="color: black; border-style: none; background-color: #<%=co%>">&nbsp;<%=  (s1=rs.getString(4))!=null?s1:"-" %>&nbsp;</td>
      <td width="97" style="color: black; border-style: none; background-color: #<%=co%>">&nbsp;<%=  (s2=rs.getString(5))!=null?s2:"-" %>&nbsp;</td>
      <td width="117" style="color: black; border-style: none; background-color: #<%=co%>">&nbsp;<%= rs.getString(6) %></td>
      <td width="110" style="color: black; border-style: none; background-color: #<%=co%>">&nbsp;<%= rs.getString(7) %></td>
    </tr>
    <%
    	c++;
    	}
    	if(!found)
    	{
    %>
    <tr>
      <td width="682" style="color: black; border-style: none; background-color: #FFFFEF" colspan="6">
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