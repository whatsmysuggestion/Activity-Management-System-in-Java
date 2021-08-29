<%@ page import="java.sql.*"%>
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Customer Policy Details</title>
<script type="text/javascript" language="JavaScript" src="jscript/popcalendar.js"></script>
</head>

<body>
<%
	String ano = (String)session.getAttribute("uname");
	try 
	{
		boolean found = false;
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
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
       <input type="text" name="csno" size="20" value="<%= show?cno:""%>"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" align="right">&nbsp;Name&nbsp;&nbsp;&nbsp; </td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <input type="text" name="csname" value="<%= show?strname:""%>" size="20"></td>
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
       <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="21" valign="top" colspan="5" align="center">&nbsp;
       </td>
     </tr>
     <%
     	}
     %>
   </table>
   <br>
	<form name="loginform" method=post action="SavePolicy.jsp">
	<input type="hidden" name="csno" value="<%= cno%>">
	<table border="0" cellpadding="0" cellspacing="0" style="border-bottom:1.5pt solid black; border-collapse: collapse; border-left-style:none; border-right-style:none; border-top-style:none; background-color:silver" bordercolor="#111111" width="70%" id="AutoNumber3" fpstyle="9,011111000">
     <tr>
       <td width="547" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" colspan="5" align="left" height="30">&nbsp; 
       Customer Policy Details</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15">Policy No</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input type="text" name="policyno" size="20"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       Policy Date</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input type="text" name="pdate" value="" size="17" readonly><a onClick="javascript:showCalendar(this, loginform.pdate, 'dd-mm-yyyy',0,400,450)" href="#"><img height="18" alt="Calendar" src="images/calendar.gif" width="18" border="0"></a></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15">No of Years</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input type="text" name="years" value="" size="20"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       Policy Amount</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input name="pamt" value="" size="20"></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15">Payment Mode</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <select size="1" name="mode">
       <option>Monthly</option>
       <option selected>Quarterly</option>
       <option>Yearly</option>
       </select></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       Premium Amount</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input name="premium" value="" size="20"></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">
       <p align="center">
 
		<input type="submit" name="submit" value="SUBMIT"  ></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">
       <p align="center">
 		<input type="Reset"name="reset"value="RESET"></td>
     </tr>
   </table>
	</form>
   <%
   		}catch(Exception e){
   			out.println(e);
   		}
   %>	
</body>

</html>