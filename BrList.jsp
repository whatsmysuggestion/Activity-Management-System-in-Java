<html>
<body  bgcolor="#abcdefff">
<%//@ include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean2" class="ABean.KMVBean"/>

<%
	String zmno = (String) session.getAttribute("ucode");
	ResultSet rs = KBean2.getBranchDetails(zmno);
%>


<H1><center>Branch List for  Zonal Manager No  <%= zmno %></center></H1>
<Table  Caption="Manager List" cols=5 width="100%" border=2>
<TR><TD>Branch No</TD>
<TD>Branch Name</TD>
<TD>Address</TD>
<TD>Manager Name</TD>
</TR>

<%
	boolean found = false;
	while(rs.next())
	{
		found = true;
%>
	<TR>
		<TD><%= rs.getString(1)%>&nbsp;</TD>
		<TD><%= rs.getString(2)%>&nbsp;</TD>
		<TD><%= rs.getString(3)%>&nbsp;</TD>
		<TD><%= rs.getString(4) + " " + rs.getString(5) + " [" + rs.getString(6) + "]" %>&nbsp;</TD>
	</TR>
<%
	}
	if(!found)
	{
%>
	<TR>
		<TD colspan=4> 
        <p align="center">No Data Found </TD>
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