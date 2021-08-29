<html><head>
<script language="JavaScript"> 
function fun1()
    {
     
     var agtno=document.loginform.agtno.value;
     
     
    if(agtno=="" ) 
          { 
          alert("Please select a valid Agent NO");
          document.loginform.agtno.focus(); 
          return false; 
      }
     
     
     
        else
         return true;
    }
</script></head> 
<body bgcolor="#abcdefff"  onLoad=document.loginform.agtno.focus();>


<jsp:useBean id="KBean11"  scope="session" class="ABean.KMVBean" />
<% KBean11.match=0;%>


<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean11A" class="ABean.KMVBean"/>

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
                   System.out.println("....jsp..KBean11A....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean11A.setCk(s);
                    break;
                }
          }
  %>  
  <jsp:getProperty name="KBean11A" property="agent1"/>
  <%! ResultSet rs11A;%>
  <%
  rs11A=KBean11A.rs;
  
  System.out.println("...jsp ..KBean11A..2");
  
%>

<%@ include file="nlogo.jsp" %>

 
 <center><h1>Agent Performance </h1></center>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1()"   action="AgtPerfm1.jsp"  target=_parent>
 <p><p><p>
 
 
 <center>Select Agent No: <select name="agtno">
                                          <option>--</option>
                                          <%   while(rs11A.next())
					  	  {   a=rs11A.getString(1);  %>
					  	  
					  	    <option value=<%out.println(a);%> > <%out.println(a);%> </option>
					  
					   <%} %>
                                         
                                          </select>

 </center>


  
  <p><p><p><p><p><p>
 
 
 
 
 
 
  
 <center><input type="submit" name="submit" value="SUBMIT"  >
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="Reset"name="reset"value="RESET"></center>
 
 
 </form>

 


<form  action ="mgtask.jsp">
 <center><input type="submit" name="BACK " value="BACK to Task Menu"   >  </center>
 </form>


</body>
</html>