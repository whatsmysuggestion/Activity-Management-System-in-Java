<html>
<body>

<%@ include file="nlogo.jsp" %>
<%@ page import="java.sql.*" %>

<%
System.out.println("daily report1");

%>
<%! String s,s1,apptdt,apptmth,apptyear;%>
<%

              try {
 java.util.Date  today=new  java.util.Date();
          System.out.println("Todays date =today=   "+ today);
			String today1=today.toString().trim();
                         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");
 	Statement st=con.createStatement();
System.out.println("daily report1");
ResultSet rs=st.executeQuery("select * from agt where TargetSetDate='"+today1+"'");

System.out.println(rs.next());
}catch(Exception e){}
%>





</body>
</html>