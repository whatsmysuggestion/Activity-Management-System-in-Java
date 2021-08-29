<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>
<Script>
	var id=0;
	function callFun()
	{
		id = frm.D1.selectedIndex
		frm.ind.value=id
	}
	function getId()
	{
		return id
	}
</script>

</head>

<body>
<hr>
<%
	String s = request.getParameter("D1");
	String i = request.getParameter("ind");
%>
<form method="POST" action="1.jsp" name="frm">
  <br>
  <p><select size="1" name="D1" onChange="callFun()">
  <option>1</option>
  <option>2</option>
  <option>3</option>
  </select></p>
  <p><input type="text" name="T1" size="20" value="<%= s!=null?s:""%>"></p>
  <p>
<script>
	id=frm.D1.selectedIndex
	document.write("Print <input type=hidden name=ind value=" + id + ">");
</script>
  <input type="submit" value="Submit" name="B1"></p>
</form>
<%= "=>" + "<script>document.write(\"<input type=text name=ind value=\" + id + \">)</script>"%>
</body>

</html>