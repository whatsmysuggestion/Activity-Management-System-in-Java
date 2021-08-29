<html>
<body>

<%@ include file="nlogo.jsp" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean13" class="ABean.KMVBean"/>
<%
System.out.println("....jsp kb13..CSTList...1");

%>
<%! String s,s1;%>
<%! int count;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("ano"))
                { 
                   System.out.println("....jsp..KBean13....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean13.setCk(s);
                    break;
                }
          }
%>

<jsp:getProperty name="KBean13" property="cst"/>
<%! ResultSet rs13;%>
<%
rs13=KBean13.rs;

System.out.println("...jsp kb13...2");

%>




<H1><center>Customer List  for  Agent No  <% out.print(""+s);%></center></H1>
<Table  Caption="Customer List" cols=5 width="100%" border=2>
<TR><TD>CustomerNo</TD>
<TD>FirstName</TD>
<TD>LastName</TD>

<TD>PolicyNo</TD>
</TR>

<%
while(rs13.next())
{
%>
<TR><TD><%out.println(rs13.getString(1));%></TD>
<TD><%out.println(rs13.getString(2));%></TD>
<TD><%out.println(rs13.getString(3));%></TD>

<TD><%out.println(rs13.getString(7));%></TD>
</TR>

<%
}
%>
</Table>

<p>  
  <p>
<a href="agtask.jsp"  > BACK </a>
</body>
</html>