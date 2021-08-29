<%@ page import="java.sql.*"%>
<%!
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
%>
<html>
<body bgcolor = "#abcdefff">
<b><center><h1>

<%
		int Eno=Integer.parseInt(request.getParameter("eno"));
		String Ename=request.getParameter("edate");
		String Etype=request.getParameter("emsg");	
		String Edate=request.getParameter("estatus");					

		try 
		{
                           	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	                          con=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
			pst=con.prepareStatement("insert into EDReport values(?,?,?,?)");
			pst.setInt(1,Eno);
			pst.setString(2,Ename);
			pst.setString(3,Etype);
			pst.setString(4,Edate);
						
			int ct=pst.executeUpdate();
			if(ct==1)
			{
				out.println("To add More Enquiry Click Here...");
%>
<a href="CustEnqDetail.jsp">BACK</a>
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