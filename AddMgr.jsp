<html>
<%@ include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean5"  scope="session"  class="ABean.KMVBean"/>

 <%
System.out.println("....jsp.kB5....1");

%>

<%! String s,s1,b1,c1,d1,e1,f1,g1,h1,i1,i;%>

<%! int count,count1;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("zno"))
                { 
                   System.out.println("....jsp..KBean5....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean5.setCk(s);
                    break;
                }
          }
   

for(count1=0;count1<coks.length;count1++)
        {
          i=coks[count1].getName();
        
               if (i.equals("brno"))
                { 
                   System.out.println("....jsp..KBean5....i=cookie name=" +i);
                    i1=coks[count1].getValue();
                    System.out.println("....jsp..KBean5....i1=cookievalue=new br= " +i1);
                    break;
                }
          }
   

   
  
    b1=request.getParameter("mfname");
    c1=request.getParameter("mlname");
    d1=request.getParameter("mlogname");
   e1=request.getParameter("mpwd");
    f1=request.getParameter("memail");
    g1=request.getParameter("maddr");
    h1=request.getParameter("mph");	
    System.out.println("....jsp.kB5...3");
    
 
  
    System.out.println("..firstname enetered =mfname ="+ b1);  
   
    
 KBean5.setMgr(b1,c1,d1,e1,f1,g1,h1,i1); 

System.out.println("....jsp.kB5...4");
if(KBean5.match==1){
out.println(" New Manager is added"); 


%> 


<a href="zmgtask.jsp" > Back to Task Menu  </a>
<% }

else {out.println(" New Manager not added ");%>

&nbsp;&nbsp; <a href="NewMgr.jsp" >Back to Add Manager Form</a>
<P><P><P><P>
<a href="zmgtask.jsp"  > BACK </a>

<%}%>




<p>
<p>
<p>



</html>