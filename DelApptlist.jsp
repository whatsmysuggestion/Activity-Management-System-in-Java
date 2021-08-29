<html>
<body>

<%@ include file="nlogo.jsp" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean18" class="ABean.KMVBean"/>
<%
System.out.println("....jsp kb18..DelApptList...1");

%>
<%! String s,s1,apid;%>
<%! int count;%>
<%!  Cookie cok4;%>
<%! ResultSet rs18;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("ano"))
                { 
                   System.out.println("....jsp..KBean18....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean18.setCk(s);
                    break;
                }
          }

  apid= request.getParameter("apid");
    
  System.out.println("....jsp..KBean18...apid=" +apid);

 KBean18.getdelApptList(apid);
 

 if(KBean18.match==0){
  out.println("Please Enter Correct Id " );%>
  
  <p>  
    <p>
  <form  action ="DelApptForm.jsp">
   <center><input type="submit" name="BACK " value="BACK to Form"   >  </center>
 </form>
  
<% }else  if(KBean18.match==2)
  {
  out.println("Unauthorised control. Appointment Id "+apid+" is not with Agent No. "+s );%>
  
  <p>  
    <p>
  <form  action ="DelApptForm.jsp">
   <center><input type="submit" name="BACK " value="BACK to Form"   >  </center>
 </form>
  
<% }else if(KBean18.match==1)
{
 cok4= new Cookie("apid",apid);
          response.addCookie(cok4);
         rs18=KBean18.rs;
          rs18.next();

System.out.println("...jsp kb18...2");

%>




<H1><center>Appointment to be deleted for  Agent No  <% out.print(""+s); %></center></H1>
<Table  Caption="Appt List" cols=5 width="100%" border=2 >
<TR><TD>Appointment ID</TD>
<TD>AGNO</TD>
<TD>Date</TD>
<TD>Time</TD>
<TD>Customer Name</TD>
</TR>

<TD><%out.println(rs18.getString(1));%></TD>
<TD><%out.println(rs18.getString(2));%></TD>
<TD><%out.println(rs18.getString(3));%></TD>
<TD><%out.println(rs18.getString(4));%></TD>
<TD><%out.println(rs18.getString(5));%></TD>

</TR>


</Table>

<p>  
  <p>
<form  action ="DelAppt.jsp">
 <center><input type="submit" name="del " value="Delete This Appointment"   >  </center>
 </form>



<p>  
  <p>
<form  action ="agtask.jsp">
 <center><input type="submit" name="BACK " value="BACK to Task Menu"   >  </center>
 </form>



<%} %>


</body>
</html>