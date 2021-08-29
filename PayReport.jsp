<%@ page import="java.sql.*"%>
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Customer Personal Details</title>
</head>

<body>
<%!
	public String getPremiumStatus(String policyno)
	{
		String status = "";
		try
		{
			System.out.println("pno : " + policyno);
			util.UtilDate ud = new util.UtilDate();

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
			Statement st = con.createStatement();
			//ResultSet rs = st.executeQuery("SELECT [CustPolicy].[policyno], [CustPolicy].[pdate], [Payment].[paydate], [Payment].[payment], CustPolicy.mode FROM (CST LEFT JOIN CustPolicy ON [CST].[CSNO]=[CustPolicy].[csno]) LEFT JOIN Payment ON [CustPolicy].[policyno]=[Payment].[policyid] WHERE CustPolicy.policyno='" + policyno +"'");
			ResultSet rs = st.executeQuery("SELECT paydate FROM payment WHERE policyid='" + policyno +"'");


			if(rs.next())
			{
/*				spno = rs.getString(1);
				spdate = rs.getString(2);
				spaydate = rs.getString(3);
				spamt = rs.getString(4);
				smode = rs.getString(5);

				int minc=0;
				if(smode.equals("Monthly"))
					minc = 1;
				if(smode.equals("Quarterly"))
					minc = 3;
				if(smode.equals("Yearly"))
					minc = 12;*/
					status = "Paid";
			}
			else
				status = "Amount Due";
		}
		catch(Exception e)
		{
  			System.out.println("status : "+e);
		}
		return status;
	}
%>

<%
	util.UtilDate ud = new util.UtilDate();

	String ano = (String)session.getAttribute("uname");
	try 
	{
		boolean found = false;
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","Administrator","");			
//		Statement st = con.createStatement();
//		ResultSet rsclist = st.executeQuery("select csno, firstname, lastname from cst where agno='" + ano + "'");
%>
<center>
<p align="right"><b>Agent ID : <%=ano%></b></p>
<h3 align="right"><font size="3"><a target="main" href="PolicyDetails.jsp"> Policy Details</a></font></h3>
  <%
  	boolean show = true;
  	String cno = request.getParameter("cno");
  	if(cno==null || cno.equals("Select Customer"))
  		show = false;

	String strcno="", strname="", stremail="", stradd="", strph="";
  	
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
       <td width="547" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" colspan="5" align="left" height="30">&nbsp; 
       Customer Personal Details</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <p style="margin-left: 15">Customer No</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <input type="text" name="custno" size="20" value="<%= show?cno:""%>"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" align="right">&nbsp;Name&nbsp;&nbsp;&nbsp; </td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <input type="text" name="cslname" value="<%= show?strname:""%>" size="20"></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <p style="margin-left: 15">Email-ID</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <input type="text" name="csemail" value="<%= show?stremail:""%>" size="20"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" align="right">&nbsp;Address&nbsp;&nbsp;&nbsp; </td>
       <td width="148" rowspan="2" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <textarea rows="2" name="csaddr" cols="20"><%= show?stradd:""%></textarea></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <p style="margin-left: 15">Phone No</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <input type="text" name="csph" value="<%= show?strph:""%>" size="20"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">&nbsp;</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21" valign="top">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21" valign="top">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
     </tr>
     <%
     	if(show)
     	{
     %>
     <tr>
       <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="21" valign="top" colspan="5" align="center">
       <a href="AddPolicy.jsp?cno=<%=cno%>">Add Policy</a> | <a href="Payment.jsp?cno=<%=cno%>">Payment</a></td>
     </tr>
     <%
     	}
     %>
   </table>
   <br>
   <%
	   ResultSet rspd = null;
   		if(show)
   		{
			PreparedStatement pst = con.prepareStatement("SELECT * FROM CustPolicy where csno=?");
			pst.setString(1, cno);
			rspd = pst.executeQuery();
		}
   %>
   <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; background-color: silver; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black" bordercolor="#111111" width="672" id="AutoNumber3" fpstyle="9,011111000" height="86">
     <tr>
       <td width="536" style="font-weight: bold; color: white; background-color: maroon; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black" align="left" height="1" colspan="6">&nbsp;Policy Details</td>
       <td width="66" style="font-weight: bold; color: white; background-color: maroon; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black" align="left" height="1"></td>
       <td width="70" style="font-weight: bold; color: white; background-color: maroon; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black" align="left" height="1"></td>
     </tr>
     <tr>
       <td width="80" style="color: black; background-color: #FFFFEF; border-style: none" height="20" align="center"><p style="margin-left: 15"><b>Policy No</b></td>
       <td width="92" style="color: black; background-color: #FFFFEF; border-style: none" height="20" align="center"><b>Date</b></td>
       <td width="84" style="color: black; background-color: #FFFFEF; border-style: none" height="20" align="center"><b>No of Years</b></td>
       <td width="124" style="color: black; background-color: #FFFFEF; border-style: none" height="20" align="center"><b>Policy Amount</b></td>
       <td width="76" style="color: black; background-color: #FFFFEF; border-style: none" height="20" align="center"><b>Mode</b></td>
       <td width="80" style="color: black; background-color: #FFFFEF; border-style: none" height="20" align="center"><b>Premium</b></td>
       <td width="66" style="color: black; background-color: #FFFFEF; border-style: none" height="20" align="center"><b>Due date</b></td>
       <td width="70" style="color: black; background-color: #FFFFEF; border-style: none" height="20" align="center"><b>Status</b></td>
     </tr>
       <form method="POST" action="PaymentForm.jsp">
       	<input type="hidden" name="cno" value="<%= cno%>">
     <%
     	while(rspd !=null && rspd.next())
     	{
     		String policyid = rspd.getString(1);
     		String pdate = rspd.getString(3);
     		String s1, s2, s3, s4, s5, s6, s7;
     		s1 = s2 = s3 = s4 = s5 = s6 = s7 = "";
     		s1 = rspd.getString(4);
     		s2 = rspd.getString(5);
     		s3 = rspd.getString(6);
     		s4 = rspd.getString(7);
			int period = 0;
			if(s3.equals("Monthly"))
				period = 1;
			else if(s3.equals("Quarterly"))
				period = 3;
			else if(s3.equals("Yearly"))
				period = 12;
			s5 = ud.addMonth(pdate, period);
			if(ud.before(ud.getDateStr(new java.util.Date().toString()), s5))
			{
				s7 = getPremiumStatus(policyid);
			}
			else
				s7 = "Paid";
     %>
     <tr>
       <td width="672" style="color: black; background-color: #FFFFEF; border-style: none" height="20" align="center" colspan="8">
       </td>
     </tr>
     <tr>
       <td width="80" style="color: black; background-color: #FFFFEF; border-style: none" height="21" align="center">
       <p style="margin-left: 15"><%=policyid%></td>
       <td width="92" style="color: black; background-color: #FFFFEF; border-style: none" height="21" align="center">
       <%=pdate%></td>
       <td width="84" style="color: black; background-color: #FFFFEF; border-style: none" height="21" align="center">
       <%= s1%></td>
       <td width="124" style="color: black; background-color: #FFFFEF; border-style: none" height="21" align="center">
       <%= s2%></td>
       <td width="76" style="color: black; background-color: #FFFFEF; border-style: none" height="21" align="center">
       <%= s3%></td>
       <td width="80" style="color: black; background-color: #FFFFEF; border-style: none" height="21" align="center">
       <%= s4%></td>
       <td width="66" style="color: black; background-color: #FFFFEF; border-style: none" height="21" align="center">
       <%= s5%></td>
       <td width="70" style="color: black; background-color: #FFFFEF; border-style: none" height="21" align="center">
       <%= s7%></td>
     </tr>
     <%
     	}
     %>

     </form>
     <tr>
       <td width="672" style="color: black; background-color: #FFFFEF; border-style: none" height="21" align="center" colspan="8">&nbsp;
       </td>
     </tr>
     </table>
   <%
   		}catch(Exception e){
   			out.println(e);
   		}
   %>
   <%// ud.getDateStr(new java.util.Date().toString())%>
</body>

</html>