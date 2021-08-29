<%@ page import="java.sql.*"%>

<html><head>
<script type="text/javascript" language="JavaScript" src="jscript/popcalendar.js"></script>
<script language="JavaScript"> 
function fun1()
    {
     
 
      var csfname=document.loginform.csfname.value;
      var cslname=document.loginform.cslname.value;
       var cslogname=document.loginform.cslogname.value;
       var cspwd=document.loginform.cspwd.value;
       var csemail=document.loginform.csemail.value;
        var csaddr=document.loginform.csaddr.value;
         var csph=document.loginform.csph.value;
     
    
    
     if(csfname =="") 
      { 
      alert("Please enter a valid Customer FirstName");
      document.loginform.csfname.focus(); 
      return false; 
      }
      
       if(cslname=="") 
            { 
            alert("Please enter a valid Customer LastName");
            document.loginform.cslname.focus(); 
            return false; 
      }
       if(cslogname=="") 
            { 
            alert("Please enter a valid Customer LoginName");
            document.loginform.cslogname.focus(); 
            return false; 
      }
    if(cspwd=="") 
      { 
      alert("Please enter a valid Customer Password");
      document.loginform.cspwd.focus(); 
      return false; 
      }  
            
         
        
       if(csemail=="") 
            { 
            alert("Please enter a valid EmailId");
            document.loginform.csemail.focus(); 
            return false; 
      }  
      
       var i=0;
     	var j=0;
      	var k=0;
            for(i=0;i<csemail.length;i++)
            	{
            	if(csemail.charAt(i)==".")
            	{
            	++j;
            	}
            	if(csemail.charAt(i)=="@")
            	{
            	++k;
            	}
            
            	}
            
            
            	if(j>2||k>1)
            	{
            	alert("Please Enter Valid Email Id");
            	document.loginform.csemail.focus();
            	return false;
            	}
            
            
            
            	i=0;j=0,k=0;
            
            	for(i=0;i<csemail.length;i++)
            	{
            	if(csemail.charAt(i)==".")
            	{
            	j=i;
            	break;
            	}
            	if(csemail.charAt(i)=="@")
            	{
            	k=i;
            	}
            
            	}
            
            	if(((j-k)<2)||(k==0)||(csemail.length==j))
            	{
            	alert("Please Enter Valid Email Id");
            	document.loginform.csemail.focus();
            	return false;
            	}                                                      
      
       if(csaddr=="") 
            { 
            alert("Please enter a valid Address");
            document.loginform.csaddr.focus(); 
            return false; 
      }  
       if(csph=="" || isNaN(csph)) 
            { 
            alert("Please enter a valid PhoneNo");
            document.loginform.csph.focus(); 
            return false; 
      }        
      
     else
     return true;
    }
</script></head> 
<body bgcolor = "#abcdefff"    onLoad=document.loginform.csfname.focus();>


<jsp:useBean id="KBean14"  scope="session" class="ABean.KMVBean" />
<% KBean14.match=0;%>
 
 <%@ include file="nlogo.jsp" %>
 <h3 align="center">New Customer Details</h3>
<%
	String ano = (String)session.getAttribute("uname");
	response.setHeader("save", "1");
	String enqid = request.getParameter("enqid");
	boolean enq = false;
	ResultSet rs = null;
	//2, 3, 7, 8, 9
	if(enqid!=null)
	{
		enq = true;
		try 
		{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	        Connection con=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
	        String q = "SELECT EnqDetails.EnqfName, EnqDetails.Enqlname, EnqDetails.email, EnqDetails.address, EnqDetails.phone FROM EnqDetails where eno=?";
	        PreparedStatement ps = con.prepareStatement(q);
	        ps.setString(1,enqid);
	        rs = ps.executeQuery();
	        if(!rs.next())
	        {
	        	enq = false;
	        }
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
%>
 <form name="loginform" method="post" onSubmit="return fun1()"   action="AddCst.jsp" target=_parent>
 <input type="hidden" name="agno" value="<%=ano%>">
<%
	if(enq)
	out.println("<input type=\"hidden\" name=\"enqid\" value=\"" + enqid + "\">");
%>
  <div align="center">
   <center>
   <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:1.5pt solid black; border-collapse: collapse; border-left-style:none; border-right-style:none; border-top-style:none; background-color:silver" bordercolor="#111111" width="70%" id="AutoNumber1" fpstyle="9,011111000" height="133">
     <tr>
       <td width="547" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" colspan="5" align="left" height="30">&nbsp;Customer Personal Details</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20" valign="top">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <p style="margin-left: 15">First Name</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <input type="text" name="csfname" size="20" value="<%= enq?rs.getString(1):""%>"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">Last Name</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">
       <input type="text" name="cslname" value="<%= enq?rs.getString(2):""%>" size="20"></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <p style="margin-left: 15">Login Name</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%"><input type="text" name="cslogname" value="" size="20"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">Password</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%"><input type="password" name="cspwd" value="" size="20"></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <p style="margin-left: 15">Email-ID</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <input type="text" name="csemail" value="<%= enq?rs.getString(3):""%>" size="20"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">Address</td>
       <td width="148" rowspan="2" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <textarea rows="2" name="csaddr" cols="20"><%= enq?rs.getString(4):""%></textarea></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <p style="margin-left: 15">Phone No</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">
       <input type="text" name="csph" value="<%= enq?rs.getString(5):""%>" size="20"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20%">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20%" valign="top">&nbsp;</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21" valign="top">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21" valign="top">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
     </tr>
   </table>
   </center>
 </div>
   
  <div align="center">
    <center>
   <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:1.5pt solid black; border-collapse: collapse; border-left-style:none; border-right-style:none; border-top-style:none; background-color:silver" bordercolor="#111111" width="70%" id="AutoNumber2" fpstyle="9,011111000">
     <tr>
       <td width="547" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" colspan="5" align="left" height="30">&nbsp;        Customer Policy Details</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15">Policy No</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input type="text" name="policyno" size="20"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">       Policy Date</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input type="text" name="pdate" value="" size="17" readonly><a onClick="javascript:showCalendar(this, loginform.pdate, 'mm-dd-yyyy',0,400,650)" href="#"><img height="18" alt="Calendar" src="images/calendar.gif" width="18" border="0"></a></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15">No of Years</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input type="text" name="years" value="" size="20"></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       Policy Amount</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input name="pamt" value="" size="20"></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <p style="margin-left: 15">Payment Mode</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <select size="1" name="mode">
       <option>Monthly</option>
       <option selected>Quarterly</option>
       <option>Yearly</option>
       </select></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       Premium Amount</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
       <input name="premium" value="" size="20"></td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
     </tr>
     <tr>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">
       <p style="margin-left: 15"></td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">
       <p align="center">
 
 <input type="submit" name="submit" value="SUBMIT"  ></td>
       <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
       <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">
       <p align="center">
 <input type="Reset"name="reset"value="RESET"></td>
     </tr>
   </table>
    </center>
 </div>
 </form>
<br> 
 <form  action ="agtask.jsp">
 	<p align="center">
 	<input type="submit" value="BACK to Task Menu"> </p>
 </form>
  


</body>
</html>