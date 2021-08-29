<html>

<%@ include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean6" scope="session" class="ABean.KMVBean"/>

 <%
System.out.println("....jsp.kB6....1");

%>

<%! String s,s1,i1,b1,c1,d1,e1,f1,g1,h1;%>



<%! int count,count1;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("zno"))
                { 
                   System.out.println("....jsp..KBean6....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean6.setCk(s);
                    break;
                }
          }
   
   
      i1=request.getParameter("brno");
      b1=request.getParameter("mfname");
	
      c1=request.getParameter("mlname");
      d1=request.getParameter("mlogname");
     e1=request.getParameter("mpwd");
     f1=request.getParameter("memail");
     g1=request.getParameter("maddr");
     h1=request.getParameter("mph");	
     System.out.println("....jsp.kB6...3");
    
 
  System.out.println("..brno entered  ="+ i1);
    System.out.println("..mfname entered = "+ b1);  
    
    
 KBean6.setRepMgr(b1,c1,d1,e1,f1,g1,h1,i1); 

System.out.println("....jsp.kB6.....4");

if(KBean6.match==1){
out.println(" Replacement Complete"); %> 
<a href="zmgtask.jsp" > Back to Task Menu  </a>
<% }

else if  (KBean6.match==2) {out.println (" Unauthorised Attempt to Replace Manager<br>");
                                             out.println ( "Branch No. out of Scope of Zonal Manager No. "+ s+ "<br>");
                                             %>
                                             <a href="RepMgrForm.jsp" > Back to Replace Manager Form</a>
<% }else 
{out.println(" Replacement not complete");%>

<a href="RepMgrForm.jsp" > Back to Replace Manager Form</a>

<%}%>




<p>
<p>
<p>



</html>