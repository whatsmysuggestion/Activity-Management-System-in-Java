<%@ page import="java.sql.*"%>
<%!
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
%>
<%
	String ano = (String)session.getAttribute("uname");
%>
<html>
<body bgcolor = "#abcdefff">
<%@ include file="nlogo.jsp" %>
<b><center><h1>

<%
		int Eno=Integer.parseInt(request.getParameter("eno"));
		String Ename=request.getParameter("ename");
		String Elname=request.getParameter("elname");
		String Etype=request.getParameter("typeEnq");	
		String Edate=request.getParameter("doenq");
		String contactno=request.getParameter("contactno");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		
		try 
		{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	        con=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
			pst=con.prepareStatement("insert into EnqDetails values(?,?,?,?,?,?,?,?,?,?)");
			pst.setInt(1,Eno);
			pst.setString(2,Ename);
			pst.setString(3,Elname);
			pst.setString(4,Etype);
			pst.setString(5,Edate);
			pst.setString(6,ano);
			pst.setString(7,email);
			pst.setString(8,address);
			pst.setString(9,contactno);
			pst.setString(10,"Processing");

			int ct=pst.executeUpdate();
			if(ct==1)
			{
				out.println("To add More Enquiry Click Here...");
%>
					<a href="CustEnq.jsp">BACK</a>
<%
			}
		}
		catch(Exception e)
		{
		
			out.println("Error:"+e);
		}
%>
</center></b>
</body>
</html>
