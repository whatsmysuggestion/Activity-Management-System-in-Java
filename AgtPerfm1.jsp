<html>
<body>
<%@ include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean11" class="ABean.KMVBean"/>
<%
System.out.println("....jsp kb11..AgtPerfm...1");

%>
<%! String s,s1,agno;%>
<%! int count;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("mno"))
                { 
                   System.out.println("....jsp..KBean11....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean11.setCk(s);
                    break;
                }
          }
     agno= request.getParameter("agtno");
     System.out.println("....jsp..KBean11...agno entered =" +agno);

     KBean11.getAgtperfm(agno);%>
 
<%! ResultSet rs11;%>
<%
rs11=KBean11.rs;

System.out.println("...jsp kb11...2");

 %>




<H1><center>Agent List  for  Manager No  <% out.print(""+s);%></center></H1>
<Table  Caption="Agent List" cols=8 width="100%" border=2>
<TR><TD>AgentNo</TD>
<TD>BranchNo</TD>
<TD>Target</TD>
<TD>TargetDate</TD>
<TD>Target Set Date</TD>
<TD>PoliciesSold</TD>

</TR>

<%
while(rs11.next())
{
%>
<TR><TD><%out.println(rs11.getString(1));%></TD>

<TD><%out.println(rs11.getString(7));%></TD>
<TD><%out.println(rs11.getString(11));%></TD>
<TD><%out.println(rs11.getString(12));%></TD>
<TD><%out.println(rs11.getString(13));%></TD>
<TD><%out.println(rs11.getString(14));%></TD>

</TR>
<%}%>
</Table>

<p>  
  <p>
<form  action ="mgtask.jsp">
 <center><input type="submit" name="BACK " value="BACK to Task Menu"   >  </center>
 </form>
  <p>  
  <p>

<form  action ="AgtPerformForm.jsp">
 <center><input type="submit" name="BACK " value="Back to Agent Performance Form"   >  </center>
 </form>

   

</body>
</html>