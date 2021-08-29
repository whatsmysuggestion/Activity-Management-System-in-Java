<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>
</head>

<body>
<jsp:useBean id="KBean2" class="ABean.KMVBean"/>
<%
	String zmno = (String)session.getAttribute("ucode");
	String target = request.getParameter("target");
	String inc = request.getParameter("inc");
	
	KBean2.updateIncentive(zmno, target, inc);
	response.sendRedirect("incentive.jsp");
%>
</body>

</html>