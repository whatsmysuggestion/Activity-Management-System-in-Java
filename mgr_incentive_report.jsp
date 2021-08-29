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

<%
		String mgno = (String)session.getAttribute("uname");
		try
		{
			util.UtilDate ud = new util.UtilDate();

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con = DriverManager.getConnection("jdbc:odbc:kmvdsn","Administrator","");			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT AGT.AGNO, AGT.FirstName, AGT.LastName, AGT.Target FROM (BR LEFT JOIN AGT ON BR.BRNO = AGT.BRNO) INNER JOIN MGR ON BR.BRNO = MGR.BRNO WHERE MGR.MGNO='"+ mgno + "'");
			String s1, s2, s3, s4, s5, s6, s7;
			s1 = s2 = s3 = s4 = s5 = s6 = s7 = "";
			boolean found = false;
%>
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; background-color: silver; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black" bordercolor="#111111" width="90%" id="AutoNumber3" fpstyle="9,011111000">
    <tr>
      <td width="281" style="font-weight: bold; color: white; background-color: maroon; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black" colspan="3" align="left" height="30">&nbsp;
        Incentive Report</td>
      <td width="240" style="font-weight: bold; color: white; background-color: maroon; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black" colspan="3" align="left" height="30"></td>
    </tr>
    <tr>
      <td style="color: black; background-color: #FFFFEF; border-style: none" height="20" width="72">
        <p style="margin-left: 0"><b>&nbsp;Agent No</b></td>
      <td style="color: black; background-color: #FFFFEF; border-style: none" height="20" width="180"><b>Agent Name</b></td>
      <td style="color: black; background-color: #FFFFEF; border-style: none" height="20" colspan="2" width="105"><b>Target</b></td>
      <td style="color: black; background-color: #FFFFEF; border-style: none" height="20" width="82"><b>Policy Sold</b></td>
      <td style="color: black; background-color: #FFFFEF; border-style: none" height="20" width="82"><b>Incentive</b></td>
    </tr>
    <tr>
      <td style="color: black; background-color: #FFFFEF; border-style: none" height="20" width="521" colspan="6">
      </td>
    </tr>
<%
	while(rs.next())
	{
		found = true;
		s1 = rs.getString(1);
		s2 = rs.getString(2) + " " + rs.getString(3);
		s3 = rs.getString(4);
%>
    <tr>
      <td style="color: black; background-color: #FFFFEF; border-style: none" height="20" width="72"><%= found?s1:"" %></td>
      <td style="color: black; background-color: #FFFFEF; border-style: none" height="20" width="180"><%= found?s2:"" %></td>
      <td style="color: black; background-color: #FFFFEF; border-style: none" height="20" colspan="2" width="105"><%= found?s3:"" %></td>
      <td style="color: black; background-color: #FFFFEF; border-style: none" height="20" width="82"><%= found?""+policySold(s1):"" %></td>
      <td style="color: black; background-color: #FFFFEF; border-style: none" height="20" width="82"><%= found?""+getIncentive(s1, s3, new Integer(policySold(s1)).toString()):"" %></td>
    </tr>
<%
	}
%>
    <tr>
      <td width="72" style="color: black; background-color: #FFFFEF; border-style: none" height="21">
        <p style="margin-left: 15"></td>
      <td width="180" style="color: black; background-color: #FFFFEF; border-style: none" height="21">&nbsp;</td>
      <td width="105" style="color: black; background-color: #FFFFEF; border-style: none" height="21" colspan="2">&nbsp;</td>
      <td width="82" style="color: black; background-color: #FFFFEF; border-style: none" height="21">&nbsp;</td>
      <td width="82" style="color: black; background-color: #FFFFEF; border-style: none" height="21">&nbsp;</td>
    </tr>
    <tr>
      <td width="521" style="color: black; background-color: #FFFFEF; border-style: none" height="21" colspan="6">
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
