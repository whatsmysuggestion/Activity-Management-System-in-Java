<html>
<body>

<%@ include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean7" class="ABean.KMVBean"/>
<%
System.out.println("....jsp..KBean7...1");

%>
<%! String s,s1;%>
<%! int count;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("mno"))
                { 
                   System.out.println("....jsp..KBean7....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean7.setCk(s);
                    break;
                }
          }
   

 %>

<jsp:getProperty name="KBean7" property="mgr1"/>
<%! ResultSet rs7;%>
<%
rs7=KBean7.rs;

System.out.println("..jsp..KBean7.....2");

%>




<H1><center>Manager List for Manager No.  <% out.print(""+s+" ");%> [Zone No. <% out.print(KBean7.zmno1.substring(2));%>]</center></H1>
<Table  Caption="Manager List" cols=5 width="100%" border=2>
<TR><TD>MgrNo</TD>
<TD>FirstName</TD>
<TD>LastName</TD>
<TD>LoginName</TD>
<TD>BranchNo</TD>
</TR>

<%
while(rs7.next())
{
%>
<TR><TD><%out.println(rs7.getString(1));%></TD>
<TD><%out.println(rs7.getString(2));%></TD>
<TD><%out.println(rs7.getString(3));%></TD>
<TD><%out.println(rs7.getString(4));%></TD>
<TD><%out.println(rs7.getString(9));%></TD>
</TR>

<%
}
%>
</Table>

<p>  
  <p>
<a href="mgtask.jsp"  > BACK </a>
</body>
</html>