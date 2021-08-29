<%@ page import="java.sql.*"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>New Page 1</title>
</head>

<body>
<%
	String ano = (String)session.getAttribute("uname");
	try 
	{
		String s1 = request.getParameter("pno");
		String s2 = request.getParameter("duedate");
		String s3 = request.getParameter("pdate");
		String s4 = request.getParameter("payment");


		boolean found = false;
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
		PreparedStatement ps = con.prepareStatement("insert into payment values (?,?,?,?)");
		ps.setString(1, s1);
		ps.setString(2, s2);
		ps.setString(3, s3);
		ps.setString(4, s4);
		ps.executeUpdate();
%>

<%
	}catch(Exception e){
		out.println(e);
	}
%>
<jsp:forward page="PolicyDetails.jsp" />
</body>

</html>
