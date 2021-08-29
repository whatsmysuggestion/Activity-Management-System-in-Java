<html><head>
</head> 
<body bgcolor = "#abcdefff" onLoad=document.loginform.cstname.focus();>


<%@ include file="nlogo.jsp" %>
 
 
<center> <B><h1>View Reports</h1></B></center>
   
 <form method="post">    <center>
<br><a href="AAgtList.jsp" target=_parent> <h3>Activity Reports</h3></a>

<a href="CstList.jsp"  target=_parent> <h3> Customer Reports</h3></a>

<a href="ApptListForm.jsp"  target=_parent> <h3> Appointment Reports</h3></a>


   </Center><br>
 
 
 </form><form  action ="agtask.jsp">
   <Center><input type="submit" name="BACK " value="BACK to Task Menu"   >   </Center>
 </form>
  


</body>
</html>