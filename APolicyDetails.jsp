<html>
<body>
<%
             System.out.println("*************************");
             
             %>
             
   <%@ include file="nlogo.jsp" %>          

<%@ page import="java.sql.*" %>

<jsp:useBean id="KBean17" class="ABean.KMVBean"/>

      
<%
System.out.println("....jsp kb17..APolicyDeatils..1");

%>
<%! String s,s1, ptype;%>
<%! int count;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("ano"))
                { 
                   System.out.println("....jsp..KBean17....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean17.setCk(s);
                    break;
                }
          }
%>

<jsp:getProperty name="KBean17" property="policy"/>

<%
 
   KBean17.rs.next();
   ptype= KBean17.rs.getString(1);

System.out.println("Ptype  = "+ptype);

if (ptype.equals("JRK")){ 
                                      System.out.println("Ptype matched = "+ptype);%> 
                                     
                                <jsp:forward  page="/Janaraksha.jsp" /> 
                              <%}

 if (ptype.equals("NJR")){ 
                                        System.out.println("Ptype matched = "+ptype);%>                                    
                                      
                                   
                                    <jsp:forward  page="/NewJanaraksha.jsp" /> 
                                   
                                   <%}
 
 if (ptype.equals("JCH")){ 
                                      System.out.println("Ptype matched = "+ptype);%> 
                                   
                                     <jsp:forward  page="/JeevanChhaya.jsp" /> 
                                  
                                  <%}

 if  (ptype.equals("JSK")) { 
                                         System.out.println("Ptype matched = "+ptype);%> 
                                       
                                       <jsp:forward  page="/JeevanSukanya.jsp" />  
                                       
                                    <% }
                                

System.out.println("...jsp kb17...2");

%>


</body>
</html>


