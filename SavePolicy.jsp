<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>
</head>

<body>
<jsp:useBean id="cp" class="ABean.CustPolicy" scope="request"/>
<jsp:setProperty name="cp" property="*" />
<%
	System.out.println("P C N : " + cp.getCsno());
	cp.save();
//	response.sendRedirect("CustList.jsp");
	String s = "PolicyDetails.jsp?cust=" + cp.getCsno();
	System.out.println(s);
%>
<jsp:forward page="<%=s %>" />
</body>

</html>