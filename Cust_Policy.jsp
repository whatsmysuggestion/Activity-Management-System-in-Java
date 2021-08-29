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
<%
	String cno = (String)session.getAttribute("uname");
	try 
	{
		boolean found = false;
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
		Statement st = con.createStatement();
//		ResultSet rsclist = st.executeQuery("select csno, firstname, lastname from cst where agno='" + ano + "'");
%>
<center>
<p align="right"><b>Customer ID : <%=cno%></b></p>
   <br>
  <%
  	boolean show = true;
//  	String cno = request.getParameter("cust");
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
       </td>
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
   <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:1.5pt solid black; border-collapse: collapse; border-left-style:none; border-right-style:none; border-top-style:none; background-color:silver" bordercolor="#111111" width="85%" id="AutoNumber3" fpstyle="9,011111000" height="86">
     <tr>
       <td width="496" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" colspan="6" align="left" height="1">&nbsp; 
       Policy Details</td>
     </tr>
     <tr>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="20" align="center">
       <p style="margin-left: 15"><b>Policy No</b></td>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="20" align="center">
       <b>Date</b></td>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="20" align="center">
       <b>No of Years</b></td>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="20" align="center">
       <b>Policy Amount</b></td>
       <td width="100" style="color: black; border-style: none; background-color: #FFFFEF" height="20" align="center">
       <b>Mode</b></td>
       <td width="100" style="color: black; border-style: none; background-color: #FFFFEF" height="20" align="center">
       <b>Premium</b></td>
     </tr>
     <%
     	while(rspd !=null && rspd.next())
     	{
     %>
     <tr>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <p style="margin-left: 15"><%=rspd.getString(1)%></td>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <%=rspd.getString(3)%></td>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <%=rspd.getString(4)%></td>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <%=rspd.getString(5)%></td>
       <td width="100" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <%=rspd.getString(6)%></td>
       <td width="100" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <%=rspd.getString(7)%></td>
     </tr>
     <%
     	}
     %>
     <tr>
       <td width="596" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center" colspan="6">&nbsp;
       </td>
     </tr>
     </table>
   <%
   		}catch(Exception e){
   			out.println(e);
   		}
   %>
</body>

</html>