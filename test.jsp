<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>New Page 1</title>
</head>

<body>
<%!
	public boolean before(String s1, String s2, JspWriter out) throws Exception
	{
		boolean res = false;
		try
		{
			java.util.Date dd1, dd2;

			/* Checking - in the String 
			*	if present replace to /
			*/
			if(s1.indexOf("-") == -1)
				dd1 = new java.util.Date(s1);
			else
				dd1 = new java.util.Date(s1.replaceAll("-", "/"));

			if(s2.indexOf("-") == -1)
				dd2 = new java.util.Date(s2);
			else
				dd2 = new java.util.Date(s2.replaceAll("-", "/"));

			if(dd1.before(dd2))
				res = true;
		}
		catch(Exception e)
		{
			out.println("Err : " + e);
		}
		return res;
	}
%>
<%= "05/06/2006".indexOf("-")%>
<%
	String s1 = "04/06/2006";
	String s2 = "05-05-2006";
%>
<br><%= s1%>&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp; <%= new java.util.Date(s1) %>
<br><%= s2%>&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp; <%= new java.util.Date(s2.replaceAll("-", "/")) %>
<br><%= before(s1, s2, out) %>
</body>

</html>
