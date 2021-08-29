<html>

<%@ include file="nlogo.jsp" %>


<%@ page import="java.sql.*,ABean.KMVBean" %>

<jsp:useBean id="KBean4"  scope="session" class="ABean.KMVBean" />

<%
System.out.println("....jsp.kB4....1");
%>

<%! String s,s1,a,c;%>

<%! int count;%>
<%! Cookie cok1;%>
<%
   Cookie []coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
       
               if (s1.equals("zno"))
                { 
                   System.out.println("....jsp..KBean4....s1=cookie name=" +s1);

                    s=coks[count].getValue();

                    KBean4.setCk(s);

                    break;
                }
          }
   


   
    a=request.getParameter("bname");
  
    c=request.getParameter("baddr");
	
    
  System.out.println("..bname = "+a);   
    
  
KBean4.setBranch(a,c);

System.out.println("....jsp.kB4...2");
if(KBean4.match==1)
{
 
out.println("Update completed New Branch  " + a + "  is added <BR><BR>");

cok1= new Cookie("brno",""+KBean4.brno);
          response.addCookie(cok1);

 %>
<a href="NewMgr.jsp" > Click here to add New Manager for this new Branch </a>

<%
}
else
{out.println("Update not completed <BR><BR>");
 %> 
&nbsp;&nbsp;&nbsp; <a href="NewBR.jsp"  >BACK to Add New Branch Form</a>
<%}%>
  

<p>
<p>
<p>


</html>