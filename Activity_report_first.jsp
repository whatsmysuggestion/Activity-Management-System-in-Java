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
<p align="right"><b>Agent ID : <%=ano%></b></p>
  <div align="center">
    <center>
	<form name="frm" action="Activity_report.jsp" method=post>
    <table border="0" cellpadding="0" cellspacing="0" width="75%" id="AutoNumber1" style="border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: silver" fpstyle="9,011111000">
      <tr class="tth">
        <td colspan="5" height="35"><p align="center"><font face="Verdana">Select Period</font></td>
      </tr>
      <tr class="ttb">
        <td width="101%" colspan="5">&nbsp;
        </td>
      </tr>
      <tr class="ttb">
        <td width="20%">
        <p align="right"><b>From&nbsp;&nbsp;&nbsp;&nbsp; </b></td>
        <td width="20%"><input type="text" name="from" size="15" readonly><a onClick="javascript:showCalendar(this, frm.from, 'mm-dd-yyyy',0,200,200)" href="#"><img height="18" alt="Calendar" src="images/calendar.gif" width="18" border="0"></a></td>
        <td width="20%">
        <p align="right"><b>To&nbsp;&nbsp;&nbsp; </b></td>
        <td width="20%"><input type="text" name="to" size="15" readonly><a onClick="javascript:showCalendar(this, frm.to, 'mm-dd-yyyy',0,200,400)" href="#"><img height="18" alt="Calendar" src="images/calendar.gif" width="18" border="0"></a></td>
        <td width="21%">&nbsp;</td>
      </tr>
      <tr class="ttb">
        <td width="101%" colspan="5">&nbsp;</td>
      </tr>
      <tr class="ttb">
        <td width="101%" colspan="5">
        <p align="center">
        <input type="submit" value="View Activities" name="B1"></td>
      </tr>
    </table>
	</form>
    </center>
</div>
<br>
</body>

</html>