<%@ page import="java.sql.*" %>
<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>
<style>
.thead	{	font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon	}
.tbody	{	color: black; border-style: none; background-color: #FFFFEF	}
</style>
</head>

<%!
	public String getShortDate(java.util.Date d)
	{
		String str = "";
		int id = d.getDate();
		int im = d.getMonth();
		int iy = d.getYear();
		iy += 1900;			
		
		return ++im + "/" + id + "/" + iy;
	}
	public String addMonth(String s, int m)
	{
		/**This function takes the date as the Ist arg ("mm/dd/yyyy") and 
		adds the second arg to the months*/

		java.util.Date d = new java.util.Date(s);
		String str = (d.getMonth() + m) + "/" + d.getDate() + "/" + (1900 + d.getYear());
		return str;
	}
	public String getDateStr(String s)
	{
		/**This function converts String "Tue Jan 03 00:00:00 GMT+05:30 2006" into
		String of "mm/dd/yyyy" format*/
		String res = "";
		String sm, sd, sy;
		sm = sd = sy = "";
		int i = s.length();
		java.util.StringTokenizer str = new java.util.StringTokenizer(s, " ");
		str.nextToken();
		sm = str.nextToken();
		sd = str.nextToken();
		sy = s.substring(i-4);

		return getMonth(sm) + "/" + sd + "/" + sy;
	}

	public java.util.Date getDate(String s)
	{
		/**This function converts String "Tue Jan 03 00:00:00 GMT+05:30 2006" into java.util.Date
		or String with "mm/dd/yyyy" format*/
		String res = "";
		String sm, sd, sy;
		sm = sd = sy = "";
		int i = s.length();
		java.util.StringTokenizer str = new java.util.StringTokenizer(s, " ");
		str.nextToken();
		sm = str.nextToken();
		sd = str.nextToken();
		sy = s.substring(i-4);

		return new java.util.Date(getMonth(sm) + "/" + sd + "/" + sy);
	}
	public int getMonth(String s)
	{
		int m = 0;
		if(s.equalsIgnoreCase("Jan"))
			m = 1;
		else if(s.equalsIgnoreCase("Feb"))
			m = 2;
		else if(s.equalsIgnoreCase("Mar"))
			m = 3;
		else if(s.equalsIgnoreCase("Apr"))
			m = 4;
		else if(s.equalsIgnoreCase("May"))
			m = 5;
		else if(s.equalsIgnoreCase("Jun"))
			m = 6;
		else if(s.equalsIgnoreCase("Jul"))
			m = 7;
		else if(s.equalsIgnoreCase("Aug"))
			m = 8;
		else if(s.equalsIgnoreCase("Sep"))
			m = 9;
		else if(s.equalsIgnoreCase("Oct"))
			m = 10;
		else if(s.equalsIgnoreCase("Nov"))
			m = 11;
		else if(s.equalsIgnoreCase("Dec"))
			m = 12;

		return m;
	}
%>
<body>
<%
	try 
	{
		boolean found = false;
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select firstName, lastName, targetDate, targetSetDate from AGT");
		String s1, s2, s3, s4, s5;
		s1 = s2 = s3 = s4 = s5 = "";
		java.util.StringTokenizer str = null;
%>
<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1" style="border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: silver" fpstyle="9,011111000">
    <tr class="thead">
      <td width="25%" height="35">Agent Name</td>
      <td width="25%" height="35">Target Date </td>
      <td width="25%" height="35">Target Set Date</td>
      <td width="25%" height="35">&nbsp;</td>    
    </tr>
<%
	java.util.Date d1, d2;
	d1 = d2 = null;
	while(rs.next())
	{
		s1 = rs.getString(1) + " " + rs.getString(2);
		s2 = rs.getString(3);
		s3 = rs.getString(4);
		d1 = getDate(s2);
		d2 = getDate(s3);
%>
    <tr class="tbody">
      <td width="25%" height="30"><%= s1 %>&nbsp;</td>
      <td width="25%" height="30"><%= s2 %></td>
      <td width="25%" height="30"><%= s3 %></td>
      <td width="25%" height="30"><%= getDate(s2) %></td>
    </tr>
<%
	}
%>
  </table>
  </center>
</div>
&nbsp;
<%
	}catch(Exception e)
	{
  		out.println(e);
	}

%>
</body>
<%= getShortDate(new java.util.Date())%><br>
<%= new java.util.Date(106,5,23)%><br>
<%= new java.util.Date(getShortDate(new java.util.Date()))%><br>
=><%= new java.util.Date("05/23/2006")%><br>
<%= new java.sql.Date(98,5,15)%><br>
<%= new java.sql.Date(98,5,15).getDate()%><br>
<hr>
06-16-2006
</html>