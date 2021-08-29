<html>
<head></head>
<body>
<%
	session.setAttribute("uname", request.getParameter("uname"));
%>
<fieldset ><legend> <h4>Zonal Manager Task Menu </h4></legend>

<p><a target="main" href="ZmgrList.jsp">Zonal Manager List</a>
<p><a target="main" href="MgrList.jsp">Manager List</a>
<p><a target="main" href="BrList.jsp">Branch List</a>
<p><a href="NewBR.jsp"  target=_parent>Add New Branch</a>
<p><a href="ZAgtList.jsp" target=main>Agent List</a>
<p><a href="updatemgr.jsp"  target=_parent>Replace Manager</a>
<p><a href="incentive.jsp" target=_parent>Incentive Details</a>
<p><a href="ZPolicyMenu.jsp" target=_parent>Policy Details</a>
<p><a href="index.jsp"  target=_parent>Logout</a>

</fieldset> </h4>

</body>
</html>