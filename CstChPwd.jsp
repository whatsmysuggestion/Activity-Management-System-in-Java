 <html>



<%@ include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean21" class="ABean.KMVBean"/>
<%
System.out.println("....jsp.kB21..SetTarget....1");


%>
<%! String s,s1, logname,logpwd;%>
<%! int count;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("cno"))
                { 
                   System.out.println("....jsp..KBean21....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    System.out.println("....jsp..KBean21....s=cookie value=" +s);
                    KBean21.setCk(s);
                    break;
                }
          } 
   
    
    logname=request.getParameter("logname");
    logpwd=request.getParameter("logpwd");
    
    
    
    
    System.out.println(".new pwd entered "+logpwd);  
  
    
KBean21.setCstPwd(logname,logpwd);
System.out.println("....jsp.kB21...2");


if(KBean21.match==1){
out.println(" Password Changed"); %> 

<form  action ="mgtask.jsp">
 <center><input type="submit" name="BACK " value="BACK to Task Menu"   >  </center>
 </form>
 <p> <p> <p>



<% }
          %>
   <form  action ="CstChPwdForm.jsp">
    <center><input type="submit" name="BACK " value="BACK to Change Password Form"   >  </center>
 </form>
   
   

<p>
<p>
<p>



</html>