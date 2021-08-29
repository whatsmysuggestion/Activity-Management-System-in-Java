<%@ page import="java.sql.*"%>

<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>
</head>

<body>
<%
	String apno = request.getParameter("apid");
	try 
	{
		boolean found = false;
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
		PreparedStatement pst = con.prepareStatement("DELETE * from appt where apid=?");
		pst.setString(1, apno);
		int rs = pst.executeUpdate();
//		response.sendRedirect("ApptDetails.jsp");
	}
    catch(Exception e)
    {
    	out.println(e);
    }
%>
<jsp:forward page="ApptMesg.jsp" />
</body>

</html>