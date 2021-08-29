<%@ page import="java.sql.*"%>

<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<script type="text/javascript" language="JavaScript" src="jscript/popcalendar.js"></script>

<title>New Page 1</title>
<style>
.tth { font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon }
.ttb { color: black; border-style: none; background-color: #FFFFEF }
</style>
</head>

<body>
<%
	String ano = (String)session.getAttribute("uname");

%>
<form name="frm">
<p align="right"><b>Agent ID : <%=ano%></b></p>
  <br>
<%


	util.UtilDate ud = new util.UtilDate();

	boolean show = false, val = true;
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	if(from != null && to != null)
		show = true;
	String msg = "";
	if(show)
	{
		if(ud.before(from, to))
			msg = "[ <font face=\"Verdana\" color=\"#FFFF00\">" + from + " - " + to + "</font> ]" ;
		else
			msg = " [ <font face=\"Verdana\" color=\"#FFFF00\"><i>From</i> date should be before <i>to</i> date.</font> ]";
	}
	if(from.equals("") || to.equals(""))
		val = false;
	if(show && !val)
		msg = " [ <font face=\"Verdana\" color=\"#FFFF00\">Select <i>from</i> and <i>to</i> dates.</font> ]";

	String s1, s2, s3, s4, s5, s6, pd;
	s1 = s2 = s3 = s4 = s5 = s6 = pd = "";
	try
	{
		String q = "SELECT CustPolicy.pdate, CustPolicy.policyno, CST.FirstName, CST.LastName, CST.CSNO, CustPolicy.years, CustPolicy.mode, CustPolicy.premium FROM CST INNER JOIN CustPolicy ON CST.CSNO = CustPolicy.csno WHERE CST.AGNO=?";
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn");			
		PreparedStatement pst = con.prepareStatement(q);
		pst.setString(1, ano);
		ResultSet rscd = pst.executeQuery();
%>
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="100%" id="AutoNumber2" height="49">
    <tr class="tth">
      <td width="104%" height="29" colspan="6" align="center">
      <font face="Verdana">Report <%= msg %></font></td>
    </tr>
    <tr class="ttb">
      <td width="100%" height="19" colspan="6">&nbsp;</td>
    </tr>
    <tr class="ttb">
      <td width="16%" height="19"><b>Policy ID</b></td>
      <td width="16%" height="20%"><b>Customer Name</b></td>
      <td width="17%" height="19"><b>Policy Date</b></td>
      <td width="17%" height="19"><b>Years</b></td>
      <td width="17%" height="19"><b>Mode</b></td>
      <td width="17%" height="19"><b>Premium</b></td>
    </tr>
<%
	while(val && rscd.next())
	{
		pd = rscd.getString(1);
		s1 = rscd.getString(2);
		s2 = rscd.getString(3) + " " + rscd.getString(4) + " [" + rscd.getString(5) + "]";
		s3 = rscd.getString(6);
		s4 = rscd.getString(7);
		s5 = rscd.getString(8);

		if(ud.before(from, pd) && ud.before(pd, to))
		{
%>
    <tr class="ttb">
      <td width="16%" height="19">&nbsp;<%= s1%></td>
      <td width="16%" height="20%">&nbsp;<%= s2%></td>
      <td width="17%" height="19">&nbsp;<%= pd%></td>
      <td width="17%" height="19">&nbsp;<%= s3%></td>
      <td width="17%" height="19">&nbsp;<%= s4%></td>
      <td width="17%" height="19">&nbsp;<%= s5%></td>
    </tr>
<%
		}
	}
%>
    <tr class="ttb">
      <td width="16%" height="19" colspan=6>&nbsp;</td>
	</tr>
  </table>
  </center>
</div>
<%
	}catch(Exception e){
   		out.println("Ooh : " + e);
   	}
	
%>
</form>
</body>

</html>