<%@ page import="java.sql.*"%>
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Customer Personal Details</title>
<script type="text/javascript" language="JavaScript" src="jscript/popcalendar.js"></script>
<style>
.th1	{	font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom-style: none; background-color: maroon" align="center" height="1" width="89" }
.td1	{	font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" align="center" height="1" width="149"	}

.thead { font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon }
</style>
</head>

<body>
<%
	String action = request.getParameter("submit");
	String ano = (String)session.getAttribute("uname");
	try 
	{
		//boolean found = false;
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
%>
<center>
<p align="right"><b>Agent ID : <%=ano%></b></p>
<h3>Activity Report<br>
  </h3>
  <form action="Activity.jsp" method="post" name="frm">
   <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:1.5pt solid black; border-collapse: collapse; border-left-style:none; border-right-style:none; border-top-style:none; background-color:silver" bordercolor="#111111" width="496" id="AutoNumber1" fpstyle="9,011111000" height="26">
<!--     <tr style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom-style: none; background-color: maroon" align="center" height="1" width="496">
       <td>From</td>
       <td><input type="text" name="fromdate" size="15" readonly><a onclick="javascript:showCalendar(this, frm.fromdate, 'dd-mm-yyyy',0,400,450)" href="#"><img height="18" alt="Calendar" src="images/calendar.gif" width="18" border="0"></a></td>
       <td>To</td>
       <td><input type="text" name="todate" size="15" readonly><a onclick="javascript:showCalendar(this, frm.todate, 'dd-mm-yyyy',0,400,450)" href="#"><img height="18" alt="Calendar" src="images/calendar.gif" width="18" border="0"></a></td>
     </tr> -->
     <tr>
       <td width="40%" height="20" bgcolor="#800000">&nbsp;
       </td>
       </tr>
     <tr>
       <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">
       <p style="margin-left: 15" align="center"></td>
       </tr>
     <tr>
       <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">
       <p align="center">
       <input type="submit" value="View Appointment" name="submit"></td>
       </tr>
     <tr>
       <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">&nbsp;       </td>
     </tr>
     <tr>
       <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">
       <p align="center"><input type="submit" value="View Enquiries" name="submit"></td>
     </tr>
     <tr>
       <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">&nbsp;       </td>
     </tr>
     <tr>
       <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">
       <p align="center">
       <input type="submit" value="View Policy Sold" name="submit"></td>
     </tr>
     <tr>
       <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">&nbsp;       </td>
     </tr>
   </table>
   </form>
   <br>
  <b>

  <%
	if(action != null && action.equals("View Appointment"))
	{
	  	boolean found = false;
		PreparedStatement pst = con.prepareStatement("SELECT CSName, apdate, time FROM appt where agno=?");
		pst.setString(1, ano);
		ResultSet rs = pst.executeQuery();
  %> 

  <!-- Appointment Details-->

  <font color="#0000FF">Appointment Details</font>
  <br>&nbsp;</b>
  <table border="0" cellpadding="0" cellspacing="0" width="85%" id="AutoNumber4" style="border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: silver; border-collapse:collapse" fpstyle="9,011111000" bordercolor="#111111" height="78">
    <tr class="thead">
      <td width="280" height="21">Customer Name</td>
      <td width="156" height="21">Date</td>
      <td width="169" height="21">Time</td>
    </tr>
    <tr>
      <td width="605" style="color: black; border-style: none; background-color: #FFFFEF" colspan="3" height="19">&nbsp;      </td>
    </tr>
    <%
    	while(rs.next())
    	{
    		found = true;
    %>
    <tr>
      <td width="280" style="color: black; border-style: none; background-color: #FFFFEF" height="19">&nbsp;<%= rs.getString(1) %></td>
      <td width="156" style="color: black; border-style: none; background-color: #FFFFEF" height="19">&nbsp;<%= rs.getString(2) %></td>
      <td width="169" style="color: black; border-style: none; background-color: #FFFFEF" height="19">&nbsp;<%= rs.getString(3) %></td>
    </tr>
    <%
    	}
    	if(!found)
    	{
    %>
    <tr>
      <td width="605" style="color: black; border-style: none; background-color: #FFFFEF" colspan="3" height="19">
      <p align="center">No Record Found</td>
    </tr>
    <%
    	}
    %>
    </table>
    <%
    	}//End of Appointment
    %>
   <br>
   <b>
   <%
	if(action != null && action.equals("View Enquiries"))
	{
	  	boolean found = false;
		PreparedStatement pst = con.prepareStatement("SELECT * FROM EnqDetails where agno=?");
		pst.setString(1, ano);
		ResultSet rs = pst.executeQuery();
   %> 

  <!-- Enquiry Details-->

   <font color="#0000FF">Enquiry Details </font>
   <br></b>&nbsp;
   <table border="0" cellpadding="0" cellspacing="0" width="85%" id="AutoNumber5" style="border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: silver; border-collapse:collapse" fpstyle="9,011111000" bordercolor="#111111">
    <tr>
      <td width="25%" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon">      
      Enquiry Number</td>
      <td width="25%" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon">      
      Name</td>
      <td width="17%" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon">      
      Enquiry Type</td>
      <td width="33%" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon">      
      Date</td>
    </tr>
    <tr>
      <td width="682" style="color: black; border-style: none; background-color: #FFFFEF" colspan="4">&nbsp;</td>
    </tr>
    <%
    	while(rs.next())
    	{
    		found = true;
    %>
    <tr>
      <td width="25%" style="color: black; border-style: none; background-color: #FFFFEF">&nbsp;<%= rs.getString(1) %></td>
      <td width="25%" style="color: black; border-style: none; background-color: #FFFFEF">&nbsp;<%= rs.getString(2) %></td>
      <td width="17%" style="color: black; border-style: none; background-color: #FFFFEF">&nbsp;<%= rs.getString(3) %></td>
      <td width="33%" style="color: black; border-style: none; background-color: #FFFFEF">&nbsp;<%= rs.getString(4) %></td>
    </tr>
    <%
    	}
    	if(!found)
    	{
    %>
    <tr>
      <td width="605" style="color: black; border-style: none; background-color: #FFFFEF" colspan="4" height="19">
      <p align="center">No Record Found</td>
    </tr>
    <%
    	}
    %>
  </table>
  <%
  	}//End of Enquiry
  %>
  <!-- Policy Details-->

	<%
		if(action != null && action.equals("View Policy Sold"))
		{
			PreparedStatement pst = con.prepareStatement("SELECT CST.FirstName, CST.LastName, CST.CSNO, CustPolicy.policyno, CustPolicy.pdate, CustPolicy.years, CustPolicy.pamt, CustPolicy.mode, CustPolicy.premium FROM CST LEFT JOIN CustPolicy ON CST.CSNO = CustPolicy.csno where CST.agno=?");
			pst.setString(1, ano);
			ResultSet rspd = pst.executeQuery();
	%>
	<br><font color="#0000FF"><b>Policy Details<br></b></font>&nbsp;
   <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:1.5pt solid black; border-collapse: collapse; border-left-style:none; border-right-style:none; border-top-style:none; background-color:silver" bordercolor="#111111" width="85%" id="AutoNumber3" fpstyle="9,011111000" height="84">
     <tr>
       <td width="20%" style="border-bottom:1.5pt solid black; color: white; background-color: maroon; font-weight:bold; border-left-style:none; border-right-style:none; border-top-style:none" height="20" align="center">
       Customer Name</td>
       <td width="99" style="border-bottom:1.5pt solid black; color: white; background-color: maroon; font-weight:bold; border-left-style:none; border-right-style:none; border-top-style:none" height="20" align="center">
       <p>Policy No</td>
       <td width="99" style="border-bottom:1.5pt solid black; color: white; background-color: maroon; font-weight:bold; border-left-style:none; border-right-style:none; border-top-style:none" height="20" align="center">
       Date</td>
       <td width="99" style="border-bottom:1.5pt solid black; color: white; background-color: maroon; font-weight:bold; border-left-style:none; border-right-style:none; border-top-style:none" height="20" align="center">
       No of Years</td>
       <td width="99" style="border-bottom:1.5pt solid black; color: white; background-color: maroon; font-weight:bold; border-left-style:none; border-right-style:none; border-top-style:none" height="20" align="center">
       Policy Amount</td>
       <td width="100" style="border-bottom:1.5pt solid black; color: white; background-color: maroon; font-weight:bold; border-left-style:none; border-right-style:none; border-top-style:none" height="20" align="center">
       Mode</td>
       <td width="100" style="border-bottom:1.5pt solid black; color: white; background-color: maroon; font-weight:bold; border-left-style:none; border-right-style:none; border-top-style:none" height="20" align="center">
       Premium</td>
     </tr>
     <%
     	while(rspd !=null && rspd.next())
     	{
     		String s1="";
     %>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <%=rspd.getString(1) + " " + rspd.getString(2) + " [" + rspd.getString(3) + "]"%></td>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <p style="margin-left: 15"><%= (s1=rspd.getString(4))!=null?s1:"-"%></td>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <%= (s1=rspd.getString(5))!=null?s1:"-"%></td>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <%= (s1=rspd.getString(6))!=null?s1:"-"%></td>
       <td width="99" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <%= (s1=rspd.getString(7))!=null?s1:"-"%></td>
       <td width="100" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <%= (s1=rspd.getString(8))!=null?s1:"-"%></td>
       <td width="100" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center">
       <%= (s1=rspd.getString(9))!=null?s1:"-"%></td>
     </tr>
     <%
     	}
     %>
     <tr>
       <td width="1192" style="color: black; border-style: none; background-color: #FFFFEF" height="21" align="center" colspan="7">&nbsp;       </td>
     </tr>
     </table>
   <%
   		}//End of Policy
   		}catch(Exception e){
   			out.println(e);
   		}
   %>
</body>

</html>