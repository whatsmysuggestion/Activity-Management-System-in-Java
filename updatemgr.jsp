<html><head>
<script language="JavaScript"> 
function funk2()
{

     document.loginform.mfname.value=" ";
    document.loginform.mlname.value=" ";
     document.loginform.mlogname.value=" ";
     document.loginform.mpwd.value=" ";
    document.loginform.memail.value=" ";
     document.loginform.maddr.value=" ";    
     document.loginform.mph.value=" ";
}
function fun1()
    {
     
     var brno=document.loginform.brno.value;
    
     if(brno=="") 
           { 
           alert("Please enter BranchNo CORRECTLY");
           document.loginform.brno.focus();
           return false; 
      }
  
   
    }
</script></head> 
<body bgcolor = "#abcdefff"  onLoad=document.loginform.brno.focus();>


<%@ include file="newlogo.jsp" %>

<jsp:useBean id="KBean6"  scope="session" class="ABean.KMVBean"/>
 <% KBean6.match=0; %>
 
 <%@ page import="java.sql.*" %>
 <jsp:useBean id="KBean6A" class="ABean.KMVBean"/>
 
 <%! String s,s1,a;%>

 <%! int count; %>
 <%
    Cookie [] coks=request.getCookies();
    
     for(count=0;count<coks.length;count++)
         {
           s1=coks[count].getName();
         
                if (s1.equals("zno"))
                 { 
                    System.out.println("....jsp..KBean6A....s1=cookie name=" +s1);
                     s=coks[count].getValue();
                     KBean6A.setCk(s);
                     break;
                 }
           }
   %>  
   <jsp:getProperty name="KBean6A" property="branch"/>
   <%! ResultSet rs6A;%>
   <%
   rs6A=KBean6A.rs;
   
   System.out.println("...jsp ..KBean6A..2");
   
%>

 
 
<center> <h1> Replace Manager </h1></center>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1()"   action="updatemgr1.jsp" target=_parent>
 <p> 
 
 <p>
 Enter  BranchNo:&nbsp;&nbsp;&nbsp;<select name="brno">
                                          <option>--</option>
                                          <%   while(rs6A.next())
					  	  {   a=rs6A.getString(1);  %>
					  	  
					  	    <option value=<%out.println(a);%> > <%out.println(a);%> </option>
					  
					   <%} %>
                                         
                                          </select>
 <p>

<p> 
 
 <p><p>
 <input type="submit" name="submit" value="SUBMIT"  >
 &nbsp;&nbsp;&nbsp;
 <input type="Reset"name="reset"value="RESET" onclick()="funk2">
 
</form>
<form  action ="zmgtask.jsp">
 &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="BACK " value="BACK to Task Menu"   > 
 </form>

</body>
</html>