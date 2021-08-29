<%@ page import="java.sql.*"%>
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Activity Management System</title>
</head>

<body>
<%
	String ano = (String)session.getAttribute("uname");
//	if(ano==null)	response.sendRedirect("index.jsp");
%>
<p align="right"><b>Agent ID : <%=ano%></b></p>
<p align="right"><b><a target="_parent" href="CustEnq.jsp">Add New Enquiry</a></b></p>

<div align="center">
  <center>
  <%
		try 
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
			PreparedStatement pst = con.prepareStatement("SELECT ENo, status, EnqfName, Enqlname, EnqType, EnqDate FROM EnqDetails where agno=?");
			pst.setString(1, ano);
			ResultSet rs = pst.executeQuery();
  %>
 <form method="POST" action="CustForm.jsp" target="_parent">
  <table border="0" cellpadding="0" cellspacing="0" width="90%" id="AutoNumber1" style="border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: silver; border-collapse:collapse" fpstyle="9,011111000" bordercolor="#111111" height="59">
    <tr>
      <td width="5%" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" height="21">&nbsp;</td>
      <td width="25%" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" height="21">Enquiry Number</td>
      <td width="25%" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" height="21">Name</td>
      <td width="17%" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" height="21">Enquiry Type</td>
      <td width="17%" style="font-weight: bold; color: white; background-color: maroon; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black" height="21">Date</td>
      <td width="16%" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" height="21">Status</td>
    </tr>
    <tr>
      <td width="682" style="color: black; border-style: none; background-color: #FFFFEF" colspan="6" height="19">&nbsp;</td>
    </tr>
    <%
    	while(rs.next())
    	{
    		String s = "", st="";
    		String s1 = rs.getString(1);
    		st = rs.getString(2);
    %>
    <tr>
      <td width="5%" style="color: black; border-style: none; background-color: #FFFFEF" height="19">
      <% if(st.equals("Processing")){%>
        <input type="radio" value="<%=s1%>" checked name="enqid">
      <% }%>
      </td>
      <td width="25%" style="color: black; border-style: none; background-color: #FFFFEF" height="19">&nbsp;<%= s1 %></td>
      <td width="25%" style="color: black; border-style: none; background-color: #FFFFEF" height="19">&nbsp;<%= rs.getString(3) + " " + ((s=rs.getString(4))!=null?s:"") %></td>
      <td width="17%" style="color: black; border-style: none; background-color: #FFFFEF" height="19">&nbsp;<%= rs.getString(5) %></td>
      <td width="17%" style="color: black; background-color: #FFFFEF; border-style: none" height="19">&nbsp;<%= rs.getString(6) %></td>
      <td width="16%" style="color: black; border-style: none; background-color: #FFFFEF" height="19">&nbsp;<%= st %></td>
    </tr>
    <%
    	}
    }
    catch(Exception e)
    {
    	out.println(e);
    }
    %>
    <tr>
      <td width="105%" style="color: black; border-style: none; background-color: #FFFFEF" height="19" colspan="6">&nbsp;
        </td>
    </tr>
    <tr>
      <td width="105%" style="color: black; border-style: none; background-color: #FFFFEF" height="19" colspan="6">
        <p align="center"><input type="submit" value="Sale Policy" name="B1"></td>
    </tr>
    </table>
  </form>
  <br>
  </center>
</div>

</body>

</html>