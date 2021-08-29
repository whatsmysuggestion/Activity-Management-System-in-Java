<html>
<body  bgcolor="#abcdefff">
<%// include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean2" class="ABean.KMVBean"/>

<%
System.out.println("....jsp..KBean2...1");

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
                   System.out.println("....jsp..KBean2....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean2.setCk(s);
                    break;
                }
          }
 %>

<jsp:getProperty name="KBean2" property="mgr"/>
<%! ResultSet rs2;%>
<%
rs2=KBean2.rs;

System.out.println("..jsp..KBean2.....2");

%>




<H1><center>Manager List for  Zonal Manager No  <% out.print(""+s);%></center></H1>
<Table  Caption="Manager List" cols=5 width="100%" border=2>
<TR><TD>MgrNo</TD>
<TD>FirstName</TD>
<TD>LastName</TD>
<TD>LoginName</TD>
<TD>BranchNo</TD>
</TR>

<%
while(rs2.next())
{
%>
<TR><TD><%out.println(rs2.getString(1));%>&nbsp;</TD>
<TD><%out.println(rs2.getString(2));%>&nbsp;</TD>
<TD><%out.println(rs2.getString(3));%>&nbsp;</TD>
<TD><%out.println(rs2.getString(4));%>&nbsp;</TD>
<TD><%out.println(rs2.getString(9));%>&nbsp;</TD>
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