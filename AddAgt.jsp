<html>
<%@ include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean9"  scope="session"  class="ABean.KMVBean"/>
<%
System.out.println("....jsp.kB9..AddAgt.....1");


%>
<%! String s,s1,agfname,aglname,aglogname,agpwd,agptype,agemail,agaddr,agph;%>
<%! int count,count1;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("mno"))
                { 
                   System.out.println("....jsp..KBean9....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    
                    KBean9.setCk(s);
                    break;
                }
          } 
   
    
       	agfname=request.getParameter("agfname");
       	aglname=request.getParameter("aglname");
    	aglogname=request.getParameter("aglogname");
    	agpwd=request.getParameter("agpwd");
    	agptype=request.getParameter("agptype");
    	agemail=request.getParameter("agemail");
    	agaddr=request.getParameter("agaddr");
    	agph=request.getParameter("agph");

   
    
    System.out.println(".Agt .first name entered "+agfname);  
  
    
   KBean9.setAgent(agfname,aglname,aglogname,agpwd,agptype,agemail,agaddr,agph);
   System.out.println("....jsp.kB9...2");


if(KBean9.match==1){
out.println(" New Agent  is added.Update Complete"); %> 
<a href="mgtask.jsp" > Back to Task Menu  </a>
<% }

else {out.println(" Update not Complete ");%>

&nbsp;&nbsp;&nbsp;&nbsp; <a href="NewAgt.jsp" >Back to Add Agent Form</a>

<%}%>


</html>
