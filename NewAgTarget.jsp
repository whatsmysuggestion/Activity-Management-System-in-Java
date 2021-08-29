<html><head>
<script language="JavaScript"> 
function fun1()
    {
     
     var agno=document.loginform.agno.value;
     var agtarget=document.loginform.agtarget.value;
     
     var agtargetyear=document.loginform.agtargetyear.value;
     var agtargetmth=document.loginform.agtargetmth.value;
    var agtargetdt=document.loginform.agtargetdt.value;
     
    if(agno=="" ) 
          { 
          alert("Please enter a valid Agent NO");
          document.loginform.agno.focus(); 
          return false; 
      }
     
     
     if(agtarget=="" || isNaN(agtarget)) 
      { 
      alert("Please enter a valid target");
      document.loginform.agtarget.focus();
      return false; 
      }
     
     if(agtargetdt =="" ) 
           { 
           alert("Please enter a valid target date");
           document.loginform.agtargetdt.focus();
           return false; 
           }
     
        else
         return true;
    }
</script></head> 
<body bgcolor="#abcdefff" onLoad=document.loginform.agno.focus();>

<jsp:useBean id="KBean10"  scope="session" class="ABean.KMVBean" />
<% KBean10.match=0;%>


<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean10A" class="ABean.KMVBean"/>

<%! String s,s1,a;%>
<% a=" "; %>
<%! int count; %>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("mno"))
                { 
                   System.out.println("....jsp..KBean10A....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean10A.setCk(s);
                    break;
                }
          }
  %>  
  <jsp:getProperty name="KBean10A" property="agent1"/>
  <%! ResultSet rs10A;%>
  <%
  rs10A=KBean10A.rs;
  
  System.out.println("...jsp ..KBean10A..2");
  
%>


<%@ include file="nlogo.jsp" %>
 
 
 <center> <h1>SET NEW TARGET FOR AGENT</h1></center>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1()"   action="SetAgTarget.jsp"  target=_parent>
 <p>
 
  <center>Select Agent No: <select name="agno">
                                           <option>--</option>
                                           <%   while(rs10A.next())
 					  	  {   a=rs10A.getString(1);  %>
 					  	  
 					  	    <option value=<%out.println(a);%> > <%out.println(a);%> </option>
 					  
 					   <%} %>
                                          
                                           </select>
 
 </center>
 
 <p><p>
 <center>Enter Target :&nbsp;<input type="text" name="agtarget" value="" size="10"></center>
 
 
 <p><p>
 
  <center>Enter Target Date :<p>
  
  Year:<select name="agtargetyear">
      <option value="">--</option>
      <option value="2005">2005</option>
      <option value="2006">2006</option>
      </select>
      
      
      Month<select name="agtargetmth">
      <option value="">--</option>
      <option value="January">January</option>
      <option value="February">February</option>
      <option value="March">March</option>
      <option value="April">April</option>
      <option value="May">May</option>
      <option value="June">June</option>
      <option value="July">July</option>
      <option value="August">August</option>
      <option value="September">September</option>
      <option value="October">October</option>
      <option value="November">November</option>
      <option value="December">December</option>
      </select>
      
      
      
      &nbsp;
      Date:<select name="agtargetdt">
      <option value="">--</option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      <option value="05">05</option>
      <option value="06">06</option>
      <option value="07">07</option>
      <option value="08">08</option>
      <option value="09">09</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
      <option value="15">15</option>
      <option value="16">16</option>
      <option value="17">17</option>
      <option value="18">18</option>
      <option value="19">19</option>
      <option value="20">20</option>
      <option value="21">21</option>
      <option value="22">22</option>
      <option value="23">23</option>
      <option value="24">24</option>
      <option value="25">25</option>
      <option value="26">26</option>
      <option value="27">27</option>
      <option value="28">28</option>
      <option value="29">29</option>
      <option value="30">30</option>
      <option value="31">31</option>
      </select>
    
  
  
  <p>
 <p><p>
 
  <center> <input type="submit" name="submit" value="SUBMIT"  >
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="Reset"name="reset"value="RESET"> </center>
 
 
 
 </form>
 
 <form  action ="mgtask.jsp">
  <center><input type="submit" name="BACK " value="BACK to Task Menu"   >  </center>
 </form>

</body>
</html>