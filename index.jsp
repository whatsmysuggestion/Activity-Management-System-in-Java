<%@ page import = "ABean.KMVBean"%>
<%
	session.invalidate();
%>
<html>

<title>Activity Management System</title>


<jsp:useBean id="KBean10" class="ABean.KMVBean"/>

<%! String i;%>

<% i="";
   KBean10.setCk(i); %>


<frameset name="iframe" rows="30%,70%" border=0 frameborder=0>

<frame src="nlogo.jsp" scrolling=no></frame>


<frameset name="iframe1" cols="50%,50%" border=0>

<frame src="imenu.jsp" target=_parent ></frame>

<frame src="welcome1.jsp"></frame>

</frameset>


</frameset>


</body>
</html>