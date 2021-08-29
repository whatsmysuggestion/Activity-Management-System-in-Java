<html><head>
<script language="JavaScript"> 
function fun1()
    {
     
     
            var apptyear=document.loginform.apptyear.value;
    	   var apptmth=document.loginform.apptmth.value;
    	   var apptdt=document.loginform.apptdt.value;
      
     
     
     if(apptyear == "" ) 
               { 
               alert("Please choose a  Year!");
               document.loginform.apptyear.focus(); 
               return false; 
            }
     
           if(apptmth=="" ) 
	                 { 
	                 alert("Please choose a  Month!");
	                 document.loginform.apptmth.focus(); 
	                 return false; 
           }
           
            if(apptdt=="" ) 
	                  { 
	                  alert("Please choose a  Date!");
	                  document.loginform.apptdt.focus(); 
	                  return false; 
           }
          
                  
          
          
          if((apptmth=="February")&&(apptdt=="31"||apptdt=="30"||apptdt=="29"))
    	{
    	alert("Please enter valid date in FEB!");
    	document.loginform.apptdt.focus();
    	return false;
    	}
    
    	if((apptmth=="April" || apptmth=="June" || apptmth=="September" || apptmth=="November" ) && apptdt=="31" )
    	{
    	alert("Please enter valid Date(This month has only 30 days)");
    	document.loginform.apptdt.focus();
    	return false;
    	}
    
       
         else
         return true;
        }
    
       

</script>
</head> 
<body bgcolor="#abcdefff"  onLoad=document.loginform.apptyear.focus();>


<%@ include file="newlogo.jsp" %>
 
 
 <center><h1>View Appointment Details for Chosen Date</h1></center>
 
 
 
 <form name="loginform" method="Get" onSubmit="return fun1()"   action="ApptList.jsp"  target=_parent>
 <p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
 <Center>
 
 
 Year:<select name="apptyear">
 <option value="">--</option>
 <option value="2005">2005</option>
 <option value="2006">2006</option>
 </select>
 
 
 Month<select name="apptmth">
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
 Date:<select name="apptdt">
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

 </Center>
  
  
  
  
  <p><p><p>
  
 
  
 <center><input type="submit" name="submit" value="SUBMIT"  >
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="Reset"name="reset"value="RESET"></center>
 
 
 </form>

 


<form  action ="agtask.jsp">
 <center><input type="submit" name="BACK " value="BACK to Task Menu"   >  </center>
 </form>


</body>
</html>