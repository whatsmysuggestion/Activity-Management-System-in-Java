<%@ page import="java.sql.*, java.util.Vector" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Incentive Report</title>
</head>

<body>
<%
	String ano = (String)session.getAttribute("uname");
%>
<%!
	public String getIncentive(String agno, String target, String psold)
	{
		String incentive = "";
		int inc = 0;
//		System.out.println("1 =>" + Integer.parseInt(psold) + ";" + target);
		float per = (Float.parseFloat(psold) / Float.parseFloat(target))*100;
		try
		{
			util.UtilDate ud = new util.UtilDate();

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT incentive.target, incentive.incentive FROM (ZMGR INNER JOIN incentive ON ZMGR.ZMGNO = incentive.zmgno) LEFT JOIN (BR LEFT JOIN AGT ON BR.BRNO = AGT.BRNO) ON ZMGR.ZMGNO = BR.ZMGNO WHERE AGT.AGNO='"+ agno + "' ORDER BY incentive.target");
			//int per, amt;
			//per = amt = 0;
			Vector vper = new Vector();
			Vector vamt = new Vector();

			while(rs.next())
			{
				vper.add(new Integer(rs.getInt(1)).toString());
				vamt.add(new Integer(rs.getInt(2)).toString());
			}
			for(int i=0; i<vper.size(); i++)
			{
				if(i<vper.size()-1)
				{
//					System.out.println("=>" + (String)vper.get(i) + ";" + (String)vper.get(i+1) + ";" + per);
					if( per >= Integer.parseInt((String)vper.get(i)) && per <= Integer.parseInt((String)vper.get(i+1)))
					{
						inc = (int)(Integer.parseInt((String)vamt.get(i)));
						break;
					}
				}
			}
			if(inc>0)
				incentive = new Integer(inc).toString();
			else
				incentive = "No Incentive";
		}
		catch(Exception e)
		{
  			System.out.println("inc : "+e);
		}
		return incentive;
	}
	public int policySold(String agno)
	{
		int policysold = 0;
		try
		{
			util.UtilDate ud = new util.UtilDate();

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","Administrator","");			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT AGT.AGNO, AGT.FirstName, AGT.LastName, AGT.TargetSetDate, AGT.TargetDate, CustPolicy.pdate, CustPolicy.mode, CST.FirstName, CST.LastName FROM (AGT INNER JOIN CST ON AGT.AGNO = CST.AGNO) LEFT JOIN CustPolicy ON CST.CSNO = CustPolicy.csno where agt.agno='"+ agno + "'");
			String s1, s2, s3, s4, s5, s6, s7;
			s1 = s2 = s3 = s4 = s5 = s6 = s7 = "";

			while(rs.next())
			{
//				s1 = rs.getString(1);
//				s2 = rs.getString(2) + " " + rs.getString(3);
				s3 = rs.getString(4);
				s4 = rs.getString(5);
				s5 = rs.getString(6);
//				s6 = rs.getString(7);
//				s7 = rs.getString(8) + " " + rs.getString(9);

				int minc=0;
				if(s6.equals("Monthly"))
					minc = 1;
				if(s6.equals("Quarterly"))
					minc = 3;
				if(s6.equals("Yearly"))
					minc = 12;

				if(ud.inRange(s3, s4, s5))
					policysold++;
			}
		}
		catch(Exception e)
		{
  			System.out.println("sold : "+e);
		}
		return policysold;
	}
%>

<p align="right"><b>Agent ID : <%=ano%></b></p>
<%
		try
		{
			util.UtilDate ud = new util.UtilDate();

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","Administrator","");			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT FirstName, LastName, Target, TargetDate, TargetSetDate FROM AGT WHERE agno='"+ ano + "'");
			String s1, s2, s3, s4, s5, s6, s7;
			s1 = s2 = s3 = s4 = s5 = s6 = s7 = "";
			boolean found = false;
			if(rs.next())
			{
				found = true;
				s1 = rs.getString(1) + " " + rs.getString(2);
				s2 = rs.getString(3);
				s3 = rs.getString(4);
				s4 = rs.getString(5);
			}

%>
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-bottom:1.5pt solid black; border-collapse: collapse; border-left-style:none; border-right-style:none; border-top-style:none; background-color:silver" bordercolor="#111111" width="70%" id="AutoNumber3" fpstyle="9,011111000">
    <tr>
      <td width="274" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" colspan="3" align="left" height="30">&nbsp;
        Incentive Report</td>
      <td width="273" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon" colspan="3" align="left" height="30"></td>
    </tr>
    <tr>
      <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
        <p style="margin-left: 15"></td>
      <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
      <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20" colspan="2">&nbsp;</td>
      <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
      <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20">&nbsp;</td>
    </tr>
    <tr>
      <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
        <p style="margin-left: 15">Name</td>
      <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20"><input type="text" name="agname" value="<%= found?s1:"" %>" size="17" readonly></td>
      <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20" colspan="2">&nbsp;</td>
      <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">Target</td>
      <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20"><input name="target" value="<%= found?s2:"" %>" size="17" readonly></td>
    </tr>
    <tr>
      <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
        <p style="margin-left: 15">Target From</td>
      <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20"><input type="text" name="from" value="<%= found?ud.getDateStr(s3):"" %>" size="17" readonly></td>
      <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20" colspan="2">&nbsp;</td>
      <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">Target
        To </td>
      <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20"><input name="to" value="<%= found?ud.getDateStr(s4):"" %>" size="17" readonly></td>
    </tr>
    <tr>
      <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">
        <p style="margin-left: 15">Policy Sold</td>
      <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20"><input name="sold" size="17" value="<%= policySold(ano) %>"></td>
      <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="20" colspan="2">&nbsp;</td>
      <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="20">Incentive</td>
      <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="20"><input name="inc" value="<%= getIncentive(ano, s2, new Integer(policySold(ano)).toString()) %>" size="17" readonly></td>
    </tr>
    <tr>
      <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">
        <p style="margin-left: 15"></td>
      <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
      <td width="40" style="color: black; border-style: none; background-color: #FFFFEF" height="21" colspan="2">&nbsp;</td>
      <td width="20%" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
      <td width="148" style="color: black; border-style: none; background-color: #FFFFEF" height="21">&nbsp;</td>
    </tr>
    <tr>
      <td width="40%" style="color: black; border-style: none; background-color: #FFFFEF" height="21" colspan="6">
        <p align="center"></td>
    </tr>
  </table>
  </center>
</div>
<%
		}//End of Try
		catch(Exception e)
		{
  			System.out.println("1"+e);
		}
%>
</body>

</html>
