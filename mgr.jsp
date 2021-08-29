
<%@ page import = "ABean.KMVBean"%>

<html>

<title>login page</title>


<jsp:useBean id="KBean10" class="ABean.KMVBean"/>

<%! String i;%>

<% i="";
   KBean10.setCk(i); %>


<frameset name="iframe" rows="30%,70%" border=0>

<frame src="nlogo.jsp" scrolling=no></frame>


<frameset name="iframe1" cols="50%,50%" border=0>

<Frame src="mgrlogin.jsp" ></frame>
<Frame src="welcomemgr.jsp"></frame>

</frameset>


</frameset>


</body>
</html>