<html>
<jsp:useBean id="KBean2" class="ABean.KMVBean"/>
<%
	String zmno = (String)session.getAttribute("ucode");
	String na = KBean2.getZMgrName(zmno);
%>
<table width =100% height="100%"  border=0 >
<tr align="center">
	<td>
    <h2>Welcome to  Zonal Manager Task Page </h2>
	<h2><%= (zmno==null)?"":(na + " [" + zmno + "]")%></h2>
	</td>
</tr>
</table>

</html>