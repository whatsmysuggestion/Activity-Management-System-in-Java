<html><head>
<script language="JavaScript"> 
function fun1()
    {
     
     var apid=document.loginform.apid.value;
     
     
    if(apid=="" ) 
          { 
          alert("Please select a valid Appointment Id");
          document.loginform.apid.focus(); 
          return false; 
      }
     
     
     
        else
         return true;
    }
</script></head> 
<body bgcolor="#abcdefff"  onLoad=document.loginform.apid.focus();>


<jsp:useBean id="KBean18"  scope="session" class="ABean.KMVBean" />
<% KBean18.match=0;%>


<%@ include file="nlogo.jsp" %>

 
 <center><h1>Retrieve appointment to be deleted </h1></center>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1()"   action="DelApptlist.jsp"  target=_parent>
 <p><p><p>
 
 
 <center>Enter Appointment Id: &nbsp;&nbsp;&nbsp;<input type="text" name="apid" value=""  >

 </center>


  
  <p><p><p><p><p><p>
 
 
 
 
 
 
  
 <center><input type="submit" name="submit" value="SUBMIT"  >
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="Reset"name="reset"value="RESET"></center>
 
 
 </form>

 


<form  action ="agtask.jsp">
 <center><input type="submit" name="BACK " value="BACK to Task Menu"   >  </center>
 </form>


</body>
</html>