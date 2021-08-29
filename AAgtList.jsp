<html>
<body>

<%// include file="nlogo.jsp" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean12" class="ABean.KMVBean"/>
<%
System.out.println("....jsp kb12..AAgtList...1");

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
                   System.out.println("....jsp..KBean12....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean12.setCk(s);
                    break;
                }
          }
%>

<jsp:getProperty name="KBean12" property="agent2"/>
<%! ResultSet rs12;%>
<%
rs12=KBean12.rs;

System.out.println("...jsp kb12...2");

%>




<H1><center>Agent List  for  Agent No.  <% out.print(""+s+ "  ");%>  [ Branch No. <% out.print(""+KBean12.brno) ;%>] </center></H1>




<p>&nbsp;</p>




<p>&nbsp;</p>
<Table  Caption="Agent List" cols=5 width="100%" border=3 cellspacing="1">
<TR><TD><b>AgentNo</b></TD>
<TD><b>FirstName</b></TD>
<TD><b>LastName</b></TD>

<TD><b>PolicyType</b></TD>
<TD><b>BranchNo</b></TD>
</TR>

<%
while(rs12.next())
{
%>
<TR><TD><%out.println(rs12.getString(1));%>&nbsp;</TD>
<TD><%out.println(rs12.getString(2));%>&nbsp;</TD>
<TD><%out.println(rs12.getString(3));%>&nbsp;</TD>

<TD><%out.println(rs12.getString(6));%>&nbsp;</TD>
<TD><%out.println(rs12.getString(7));%>&nbsp;</TD>
</TR>

<%
}
%>
</Table>
</body>
</html>