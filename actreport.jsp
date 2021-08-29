<html><head>
</head> 
<body bgcolor = "#abcdefff" onLoad=document.loginform.cstname.focus();>


<%@ include file="newlogo.jsp" %>
 
 
<center> <B><h1>Activity Reports</h1></B></center>
   
 <form method="post">    <center>
<br><a href="AAgtList.jsp" target=_parent> <h3>DailyReports</h3></a>

<a href="CstList.jsp"  target=_parent> <h3> Weekly Reports</h3></a>
<select name=d1><script>
for(int i=1;i<32;i++){
<option value='+i+'>'+i+'</option>
}</script></select>


<a href="ApptListForm.jsp"  target=_parent> <h3> Monthly Reports</h3></a>


   </Center><br>
 
 
 </form><form  action ="agtask.jsp">
   <Center><input type="submit" name="BACK " value="BACK to Task Menu"   >   </Center>
 </form>
  


</body>
</html>