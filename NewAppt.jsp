<html>
<body>

<%@ include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean16" scope="session" class="ABean.KMVBean"/>
<%
System.out.println("....jsp kb16..NewAppt...1");

%>
<%! String s,s1,apptdt,apptmth,apptyear,appttime,cstname;%>
<%! int count;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("ano"))
                { 
                   System.out.println("....jsp..KBean16....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean16.setCk(s);
                    break;
                }
          }

       apptdt= request.getParameter("apptdt");
      apptmth= request.getParameter("apptmth");
      apptyear= request.getParameter("apptyear");
      appttime= request.getParameter("appttime");
     cstname= request.getParameter("cstname");
  System.out.println(cstname);
  
 KBean16.setAppt(apptdt,apptmth,apptyear,appttime,cstname);%>
 
 <center>
  <% 
 if(KBean16.match==1) {
 out.println(" New Appointment  is added. <BR>" +cstname + " on   " + apptdt +" "+ apptmth+" "+ apptyear +" "+ "at  "  + appttime); %> </Center>
  </form><form  action ="agtask.jsp">
    <Center><input type="submit" name="BACK " value="BACK to Task Menu"   >   </Center>
  </form>
  
  <% }
    else if (KBean16.match==2) {out.println(" Appointment not made. This Date and Time are already occupied ");%>
    </form><form  action ="NewApptForm.jsp">
      <Center><input type="submit" name="BACK " value="Make a New Appointment"   >   </Center>
  </form>
  
  
 <% }
  else {
      out.println(" Appointment not made. Enter a date after today ");%>
  </form><form  action ="NewApptForm.jsp">
    <Center><input type="submit" name="BACK " value="Make a New Appointment"   >   </Center>
  </form>
  

 
 <%}%>




</body>
</html>