<html>
<body bgcolor="#abcdefff">

<%// include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean1" class="ABean.KMVBean"/>
<%
System.out.println("...jsp..KBean1.....1");

%>

<jsp:getProperty name="KBean1" property="zmgr"/>
<%! ResultSet rs1;%>
<%
rs1=KBean1.rs;

System.out.println(".jsp..KBean1.....2"); %>
<H1><center>ZonalManager List </center></H1>
<Table  Caption="ZonalManager List"  width="100%" border=2>
<TR><TD>ZmgrNo</TD>
<TD>FirstName</TD>
<TD>LastName</TD>
<TD>LoginName</TD>
</TR>

<%
while(rs1.next())
{
%>
<TR><TD><%out.println(rs1.getString(1));%>&nbsp;</TD>
<TD><%out.println(rs1.getString(2));%>&nbsp;</TD>
<TD><%out.println(rs1.getString(3));%>&nbsp;</TD>
<TD><%out.println(rs1.getString(4));%>&nbsp;</TD>
</TR>

<%
}
%>
</Table>

<p>  
  <p>
<a target="_parent" href="zmgtask.jsp"  > BACK </a>
</body>
</html>