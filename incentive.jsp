<html>
<head></head> 
<body bgcolor = "#abcdefff" >

<%@ page import="java.sql.*" %>
<%@ include file="newlogo.jsp" %>

<jsp:useBean id="KBean2" class="ABean.KMVBean"/>
 
<center> <h2> Incentive Details</h2></center>
<!--webbot BOT="GeneratedScript" PREVIEW=" " startspan --><script Language="JavaScript" Type="text/javascript"><!--
function FrontPage_Form1_Validator(theForm)
{

  var checkOK = "0123456789-.,";
  var checkStr = theForm.target.value;
  var allValid = true;
  var validGroups = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    if (ch == ".")
    {
      allNum += ".";
      decPoints++;
    }
    else if (ch == "," && decPoints != 0)
    {
      validGroups = false;
      break;
    }
    else if (ch != ",")
      allNum += ch;
  }
  if (!allValid)
  {
    alert("Please enter only digit characters in the \"target\" field.");
    theForm.target.focus();
    return (false);
  }

  if (decPoints > 1 || !validGroups)
  {
    alert("Please enter a valid number in the \"target\" field.");
    theForm.target.focus();
    return (false);
  }

  var chkVal = allNum;
  var prsVal = parseFloat(allNum);
  if (chkVal != "" && !(prsVal > "0"))
  {
    alert("Please enter a value greater than \"0\" in the \"target\" field.");
    theForm.target.focus();
    return (false);
  }

  var checkOK = "0123456789-.,";
  var checkStr = theForm.inc.value;
  var allValid = true;
  var validGroups = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    if (ch == ".")
    {
      allNum += ".";
      decPoints++;
    }
    else if (ch == "," && decPoints != 0)
    {
      validGroups = false;
      break;
    }
    else if (ch != ",")
      allNum += ch;
  }
  if (!allValid)
  {
    alert("Please enter only digit characters in the \"inc\" field.");
    theForm.inc.focus();
    return (false);
  }

  if (decPoints > 1 || !validGroups)
  {
    alert("Please enter a valid number in the \"inc\" field.");
    theForm.inc.focus();
    return (false);
  }

  var chkVal = allNum;
  var prsVal = parseFloat(allNum);
  if (chkVal != "" && !(prsVal > "0"))
  {
    alert("Please enter a value greater than \"0\" in the \"inc\" field.");
    theForm.inc.focus();
    return (false);
  }
  return (true);
}
//--></script><!--webbot BOT="GeneratedScript" endspan --><form name="FrontPage_Form1" method="post" action="saveInc.jsp" target=_parent onsubmit="return FrontPage_Form1_Validator(this)" language="JavaScript">
<div align="center">
  <center><br>
  <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:1.5pt solid black; border-left-style:none; border-right-style:none; border-top-style:none; background-color:silver" width="60%" id="AutoNumber1" fpstyle="9,011111010" height="152">
    <tr>
      <td width="50%" style="border-bottom:1.5pt solid black; font-weight: bold; color: white; background-color: maroon; border-left-style:none; border-right-style:none; border-top-style:none" align="center" height="31">
      Target</td>
      <td width="50%" style="border-bottom:1.5pt solid black; font-weight: bold; color: white; background-color: maroon; border-left-style:none; border-right-style:none; border-top-style:none" align="center" height="31">
      Incentive</td>
    </tr>
    <tr>
      <td width="50%" style="border-style: none; color:black; background-color:#FFFFEF" height="25" align="center">&nbsp;</td>
      <td width="50%" style="border-style: none; color:black; background-color:#FFFFEF" height="25" align="center">&nbsp;</td>
    </tr>
    <%
		String zmno = (String)session.getAttribute("ucode");
    	ResultSet rs = KBean2.getIncentiveDetails(zmno);
    	int i=1;
    	while(rs.next())
    	{
    		String co="";
    		if(i%2!=0)
    			co="FFFFEF";
    		else
    			co="FFFFFF";
    %>
    <tr>
      <td width="50%" style="border-style: none; color:black; background-color:#<%=co%>" height="25" align="center">&nbsp;<%= rs.getString(2) + " %" %></td>
      <td width="50%" style="border-style: none; color:black; background-color:#<%=co%>" height="25" align="center">&nbsp;<%= rs.getString(3) + " Rs" %></td>
    </tr>
    <%
	    	i++;
    	}
    	//End 
    %>
    <tr>
      <td width="50%" style="border-style: none; color:black; background-color:#FFFFEF" height="25">
      <p align="center">
      <!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." s-validation-constraint="Greater than" s-validation-value="0" --><input type="text" name="target" size="10"> 
      %</td>
      <td width="50%" style="border-style: none; color:black; background-color:#FFFFEF" height="25">
      <p align="center">
      <!--webbot bot="Validation" s-data-type="Number" s-number-separators=",." s-validation-constraint="Greater than" s-validation-value="0" --><input type="text" name="inc" size="10"> 
      Rs</td>
    </tr>
    <tr>
      <td width="50%" style="border-style: none; color:black; background-color:#FFFFEF" height="25">&nbsp;</td>
      <td width="50%" style="border-style: none; color:black; background-color:#FFFFEF" height="25">&nbsp;</td>
    </tr>
    <tr>
      <td width="50%" align="center" style="border-style: none; color:black; background-color:#FFFFEF" height="26">
	<input type="submit" name="submit" value="Update"  ></td>
      <td width="50%" align="center" style="border-style: none; color:black; background-color:#FFFFEF" height="26">
	<input type="reset" name="reset" value="Reset"></td>
    </tr>
  </table>
  </center>
</div>
&nbsp;</form>

<form action ="zmgtask.jsp" target="_parent">
	<p align="center">
	<input type="submit" value="BACK to Task Menu"   > </p>
</form>

</body>
</html>