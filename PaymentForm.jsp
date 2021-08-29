<%@ page import="java.sql.*"%>
<html>

<head>
<script type="text/javascript" language="JavaScript" src="jscript/popcalendar.js"></script>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Customer Policy Details</title>
</head>

<%!
	public String getDuePremiumDate(Connection con, String policyid, String pdate, String pmode)
	{
		String duedate = "";
		int period = 0;
		if(pmode.equals("Monthly"))
			period = 1;
		else if(pmode.equals("Quarterly"))
			period = 3;
		else if(pmode.equals("Yearly"))
			period = 12;
		String strd = pdate.replaceAll("-", "/");
		java.util.Date dd = new java.util.Date(strd);//"05/23/1982"
		int d = 0, m=0, y=0;
		d = dd.getDate();
		m = (dd.getMonth()+period)+1;
		y = dd.getYear();
//		System.out.println();
		return "" + m + "-" + d + "-" + y;//dd.toString();
	}
%>
<body>
<%
	String ano = (String)session.getAttribute("uname");
	util.UtilDate ud = new util.UtilDate();

	try 
	{
		boolean found = false;
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
%>
<center>
<p align="right"><b>Agent ID : <%=ano%></b></p>
<h3 align="right"><font size="3"><a target="main" href="PolicyDetails.jsp"> 
Policy Details</a></font></h3>
  <%
  	boolean show = true, policy=true;;
  	String cno = request.getParameter("cno");
  	String pno = request.getParameter("policyid");

  	if(cno==null)
  		show = false;
  	if(pno==null)
  		policy = false;

	String strcno="", strname="", stremail="", stradd="", strph="";
	String pdate="", noy="", pamt="", pmode="", pmtdue="";

	if(show)
	{
		PreparedStatement pst = con.prepareStatement("SELECT CST.CSNO, CST.FirstName, CST.LastName, CST.Email, CST.Address, CST.Phone FROM CST where csno=?");
		pst.setString(1, cno);
		ResultSet rscd = pst.executeQuery();
		if(rscd.next())
		{
			strcno = rscd.getString(1);
			strname = rscd.getString(2) + " " + rscd.getString(3);
			stremail = rscd.getString(4);
			stradd = rscd.getString(5);
			strph = rscd.getString(6);
		}
	}
  %>

   <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:1.5pt solid black; border-collapse: collapse; border-left-style:none; border-right-style:none; border-top-style:none; background-color:silver" bordercolor="#111111" width="70%" id="AutoNumber2" fpstyle="9,011111000" height="133">
     <tr>
       <td width="274" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" colspan="3" align="left" height="30">&nbsp; 
       Customer Personal Details</td>
       <td width="273" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" colspan="3" align="left" height="30">
       <p align="right">Policy No
       <input type="text" name="policyno" size="10" value="<%= pno %>" readonly>&nbsp; </td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20" colspan="2">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <p style="margin-left: 15">Customer No</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <input type="text" name="csno" size="20" value="<%= show?cno:""%>" readonly></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" colspan="2">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" align="right">
       &nbsp;Name&nbsp;&nbsp;&nbsp; </td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <input type="text" name="csname" value="<%= show?strname:""%>" size="20" readonly></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <p style="margin-left: 15">Email-ID</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <input type="text" name="csemail" value="<%= show?stremail:""%>" size="20" readonly></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" colspan="2">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" align="right">
       &nbsp;Address&nbsp;&nbsp;&nbsp; </td>
       <td width="148" rowspan="2" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <textarea rows="2" name="csaddr" cols="20" readonly><%= show?stradd:""%></textarea></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <p style="margin-left: 15">Phone No</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <input type="text" name="csph" value="<%= show?strph:""%>" size="20" readonly></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" colspan="2">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">&nbsp;</td>
     </tr>
     <%
     	if(show)
     	{
     %>
     <tr>
       <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="21" valign="top" colspan="6" align="center">&nbsp;
       </td>
     </tr>
     <%
     	}
     %>
   </table>
   <br>
	<form name="loginform" method=post action="SavePayment.jsp">
	<input type="hidden" name="pno" value="<%= pno%>">
	<input type="hidden" name="cust" value="<%= cno%>">

<%
//	String pdate="", noy="", pamt="", pmode="", pmtdue="";
	int minc=0;

	if(policy)
	{
		PreparedStatement pst = con.prepareStatement("SELECT * FROM CustPolicy where policyno=?");
		pst.setString(1, pno);
		ResultSet rscd = pst.executeQuery();
		if(rscd.next())
		{
			pdate = rscd.getString(3);
			noy = rscd.getString(4);
			pamt = rscd.getString(5);
			pmode = rscd.getString(6);
			pmtdue = rscd.getString(7);
		}

		if(pmode.equals("Monthly"))
			minc = 1;
		if(pmode.equals("Quarterly"))
			minc = 3;
		if(pmode.equals("Yearly"))
			minc = 12;

	}
%>
	<table border="0" cellpadding="0" cellspacing="0" style="border-bottom:1.5pt solid black; border-collapse: collapse; border-left-style:none; border-right-style:none; border-top-style:none; background-color:silver" bordercolor="#111111" width="70%" id="AutoNumber3" fpstyle="9,011111000">
     <tr>
       <td width="274" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" colspan="3" align="left" height="30">&nbsp; 
       Customer Policy Details </td>
       <td width="273" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" colspan="3" align="left" height="30">
       <font color="#FFFF00">NOTE : </font></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20" colspan="2">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15">Policy Date</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input type="text" name="pdate" value="<%= pdate %>" size="17" readonly></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20" colspan="2">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       Policy Amount</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input name="pamt" value="<%= pamt %>" size="17" readonly></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15">No of Years</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input type="text" name="years" value="<%= noy %>" size="17" readonly></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20" colspan="2">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       Payment Mode</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input name="premium1" value="<%= pmode %>" size="17" readonly></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15">Due Date</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input name="duedate" size="17" value="<%= ud.addMonth(pdate, minc)%>"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20" colspan="2">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       Premium Due</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input name="premium" value="<%= pmtdue %>" size="17" readonly></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15">Payment Date</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input name="duedate" size="17" value="<%= ud.getDateStr(new java.util.Date().toString()) %>" ></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20" colspan="2">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       Payment</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input name="payment" size="17" value="<%= pmtdue %>"></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="21" colspan="2">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
     </tr>
     <tr>
       <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="21" colspan="6">
       <p align="center">
 
		<input type="submit" name="submit" value="SUBMIT"  ></td>
     </tr>
   </table>
	</form>
	<form method="POST" action="Payment.jsp">
		<input type="hidden" name="cno" value="<%= cno%>">
		<input type="submit" value="Back" name="B1"></p>
	</form>
   <%
   		}catch(Exception e){
   			out.println(e);
   		}
   %>
</body>

</html>