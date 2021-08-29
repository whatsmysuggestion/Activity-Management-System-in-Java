<html>
<body bgcolor="#abcdefff">

<%//@ include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean3" class="ABean.KMVBean"/>
<%
System.out.println("...JSP..KB3.....1");

%>
<%! String s,s1;%>
<%! int count;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("zno"))
                { 
                   System.out.println("....jsp..KBean3....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean3.setCk(s);
                    break;
                }
          }
   

 %>

<jsp:getProperty name="KBean3" property="agent"/>
<%! ResultSet rs3;%>
<%
rs3=KBean3.rs;

System.out.println("..JSP..KB3....2");

%>




<H1><center>Agent List  for  Zonal Manager No  <% out.print(""+s);%></center></H1>
<Table  Caption="Agent List" cols=5 width="100%" border=2>
<TR><TD>AgentNo</TD>
<TD>FirstName</TD>
<TD>LastName</TD>
<TD>LoginName</TD>
<TD>PolicyType</TD>
<TD>BranchNo</TD>
<TD>PoliciesSold</TD>
</TR>

<%
while(rs3.next())
{
%>
<TR><TD><%out.println(rs3.getString(1));%>&nbsp;</TD>
<TD><%out.println(rs3.getString(2));%>&nbsp;</TD>
<TD><%out.println(rs3.getString(3));%>&nbsp;</TD>
<TD><%out.println(rs3.getString(4));%>&nbsp;</TD>
<TD><%out.println(rs3.getString(6));%>&nbsp;</TD>
<TD><%out.println(rs3.getString(7));%>&nbsp;</TD>
<TD><%out.println(rs3.getString(13));%>&nbsp;</TD>
</TR>

<%
}
%>
</Table>

<p>  
  <p>
<a target="_parent" href="zmgtask.jsp"  > BACK </a>
</body>
</html>