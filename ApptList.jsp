<html>
<body>

<%@ include file="nlogo.jsp" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean15" class="ABean.KMVBean"/>
<%
System.out.println("....jsp kb15..ApptList...1");

%>
<%! String s,s1,apptdt,apptmth,apptyear;%>
<%! int count;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("ano"))
                { 
                   System.out.println("....jsp..KBean15....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean15.setCk(s);
                    break;
                }
          }

  apptdt= request.getParameter("apptdt");
    apptmth= request.getParameter("apptmth");
      apptyear= request.getParameter("apptyear");
  
  
  System.out.println("....jsp..KBean15...apptdt entered=" +apptdt);

 KBean15.getApptList(apptdt,apptmth,apptyear);%>


<%! ResultSet rs15;%>
<%
rs15=KBean15.rs;

System.out.println("...jsp kb15...2");

%>




<H1><center>Appointment List  for  Agent No  <% out.print(""+s);%> for  <% out.print(" " + apptdt +" "+ apptmth+" "+ apptyear);%></center></H1>
<Table  Caption="Appt List" cols=5 width="100%" border=2 >
<TR><TD>Appointment ID</TD>
<TD>AGNO</TD>
<TD>Date</TD>
<TD>Time</TD>
<TD>Customer Name</TD>
</TR>

<%
while(rs15.next())
{
%>
<TR><TD><%out.println(rs15.getString(1));%></TD>
<TD><%out.println(rs15.getString(2));%></TD>
<TD><%out.println(rs15.getString(3));%></TD>
<TD><%out.println(rs15.getString(4));%></TD>
<TD><%out.println(rs15.getString(5));%></TD>

</TR>

<%
}
%>
</Table>

<p>  
  <p>
<form  action ="agtask.jsp">
 <center><input type="submit" name="BACK " value="BACK to Task Menu"   >  </center>
 </form>


<p>  
  <p>
  <p>  
  <p>

<form  action ="NewApptForm.jsp">
 <center><input type="submit" name="BACK " value="Make a New Appointment "   >  </center>
 </form>




</body>
</html>