<html>

<%@ include file="nlogo.jsp" %>

<%@ page import="java.sql.*,java.util.Date" %>
<jsp:useBean id="KBean10" class="ABean.KMVBean"/>
<%
System.out.println("....jsp.kB10..SetTarget....1");


%>
<%! String s,s1, agno,agtarget,agtargetdt,agtargetmth,agtargetyear;%>
<%! int count,count1;%>

<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("mno"))
                { 
                   System.out.println("....jsp..KBean10....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    System.out.println("....jsp..KBean10....s=cookie value=" +s);
                    KBean10.setCk(s);
                    break;
                }
          } 
   
    
    agno=request.getParameter("agno");
    agtarget=request.getParameter("agtarget");
    agtargetdt=request.getParameter("agtargetdt");
    agtargetmth=request.getParameter("agtargetmth");
    agtargetyear=request.getParameter("agtargetyear");
    
    
    
    
    System.out.println(".Agt .Target entered "+agtarget);  
    System.out.println(".Agt .Target date entered "+agtargetdt);  
  System.out.println(".Agt .Target month entered "+agtargetmth);  
  System.out.println(".Agt .Target year entered "+agtargetyear);  
    
KBean10.setAgTarget(agno,agtarget,agtargetdt,agtargetmth,agtargetyear);
System.out.println("....jsp.kB10...2");


if(KBean10.match==1){
out.println(" Target SET"); %> 

<form  action ="mgtask.jsp">
 <center><input type="submit" name="BACK " value="BACK to Task Menu"   >  </center>
 </form>
 <p> <p> <p>



<% }else if(KBean10.match==2) {
     out.println(" Target  Not SET. Choose a date after today");}
     else{out.println(" Target  Not SET.");
     }
          %>
   <form  action ="NewAgTarget.jsp">
    <center><input type="submit" name="BACK " value="BACK to Set Target "   >  </center>
 </form>
   
   

<p>
<p>
<p>



</html>