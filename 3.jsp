<%@ page import="java.sql.*" %>
<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>SELECT AGT</title>
<style>
.thead	{	font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon	}
.tbody	{	color: black; border-style: none; background-color: #FFFFEF	}
.tbh 	{ 	font-weight: bold; color: white; border-style: none; background-color: black }
.tbb	{ 	color: white; border-left-style: none; border-right-style: none; border-top: .75pt solid aqua; border-bottom-style: none; background-color: teal }
</style>

</head>

<body>
<%!
	public boolean before(String s1, String s2)
	{
		/**
			s1 in "mm/dd/yyyy"
			s2 in "mm/dd/yyyy"
			s3 in "mm-dd-yyyy"
		*/
		boolean flag = false;
		java.util.Date dd1 = new java.util.Date(getDateStr(s1));
		java.util.Date dd2 = new java.util.Date(getDateStr(s2));
		java.util.Date ddd = new java.util.Date(s3.replaceAll("-", "/"));

		if(dd1.before(ddd) && ddd.before(dd2))
			inrange = true;
		if(dd1.equals(ddd) || dd2.equals(ddd))
			inrange = true;

		return inrange;
	}	
	
	public int policySold(String agno)
	{
		int policysold = 0;
		try
		{
			util.UtilDate ud = new util.UtilDate();

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT AGT.AGNO, AGT.FirstName, AGT.LastName, AGT.TargetSetDate, AGT.TargetDate, CustPolicy.pdate, CustPolicy.mode, CST.FirstName, CST.LastName FROM (AGT INNER JOIN CST ON AGT.AGNO = CST.AGNO) LEFT JOIN CustPolicy ON CST.CSNO = CustPolicy.csno where agt.agno='"+ agno + "'");
			String s1, s2, s3, s4, s5, s6, s7;
			s1 = s2 = s3 = s4 = s5 = s6 = s7 = "";

			while(rs.next())
			{
//				s1 = rs.getString(1);
//				s2 = rs.getString(2) + " " + rs.getString(3);
				s3 = rs.getString(4);
				s4 = rs.getString(5);
				s5 = rs.getString(6);
//				s6 = rs.getString(7);
//				s7 = rs.getString(8) + " " + rs.getString(9);

				int minc=0;
				if(s6.equals("Monthly"))
					minc = 1;
				if(s6.equals("Quarterly"))
					minc = 3;
				if(s6.equals("Yearly"))
					minc = 12;

				if(ud.inRange(s3, s4, s5))
					policysold++;
			}
		}
		catch(Exception e)
		{
  			System.out.println(e);
		}
		return policysold;
	}
%>
<%
	util.UtilDate ud = new util.UtilDate();
	try 
	{
		boolean found = false;
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","Administrator","");			
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT AGT.AGNO, AGT.FirstName, AGT.LastName, AGT.TargetSetDate, AGT.TargetDate, CustPolicy.pdate, CustPolicy.mode, CST.FirstName, CST.LastName FROM (AGT INNER JOIN CST ON AGT.AGNO = CST.AGNO) LEFT JOIN CustPolicy ON CST.CSNO = CustPolicy.csno where agt.agno='AG001'");
		String s1, s2, s3, s4, s5, s6, s7;
		s1 = s2 = s3 = s4 = s5 = s6 = s7 = "";
%>

<hr>
<%= "01-05-2006".indexOf("-")%>
<hr>
<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border: 1.5pt solid teal" fpstyle="8,011111100">
    <tr  class="tbh">
      <td width="10%">AGNO</td>
      <td width="10%">Name</td>
      <td width="10%">T Set Date</td>
      <td width="10%">T Date</td>
      <td width="10%">Policy Date</td>
      <td width="7%">Mode</td>
      <td width="10%">Due Date</td>
      <td width="10%">In Range</td>
    </tr>
<%
	java.util.Date d1, d2;
	d1 = d2 = null;
	while(rs.next())
	{
		s1 = rs.getString(1);
		s2 = rs.getString(2) + " " + rs.getString(3);
		s3 = rs.getString(4);
		s4 = rs.getString(5);
		s5 = rs.getString(6);
		s6 = rs.getString(7);
		s7 = rs.getString(8) + " " + rs.getString(9);

		int minc=0;
		if(s6.equals("Monthly"))
			minc = 1;
		if(s6.equals("Quarterly"))
			minc = 3;
		if(s6.equals("Yearly"))
			minc = 12;

		boolean inrange = ud.inRange(s3, s4, s5);
		String due = ud.addMonth(s5.replaceAll("-", "/"), minc);
/*		java.util.Date dd1 = new java.util.Date(getDateStr(s3));
		java.util.Date dd2 = new java.util.Date(getDateStr(s4));
		java.util.Date ddd = new java.util.Date(s5.replaceAll("-", "/"));

		if(dd1.before(ddd) && ddd.before(dd2))
			inrange = true;
		if(dd1.equals(ddd) || dd2.equals(ddd))
			inrange = true;*/
%>
    <tr class="tbb">
      <td width="10%">&nbsp;<%= s1 + " [" + s2 + "]" %></td>
      <td width="10%">&nbsp;<%= s7 %></td>
      <td width="10%">&nbsp;<%= s3 %></td>
      <td width="10%">&nbsp;<%= s4 %></td>
      <td width="10%">&nbsp;<%= s5 %></td>
      <td width="7%">&nbsp;<%= s6 %></td>
      <td width="10%">&nbsp;<%= due %></td>
      <td width="10%">&nbsp;<%= inrange %></td>
    </tr>
<%
	}
%>
  </table>
  </center>
</div>

<%
	}catch(Exception e)
	{
  		out.println(e);
	}
//getDateStr(new java.util.Date(addMonth(getDateStr(s3), minc)).toString())
%>
</body>
<%= new java.util.Date("15/23/2006")%><br>
</html>
<%= ud.getDateStr("Thu Jul 06 00:00:00 GMT+05:30 2006") %>
<br>
<%= policySold("AG001")%><br>
<%= policySold("AG002")%>


