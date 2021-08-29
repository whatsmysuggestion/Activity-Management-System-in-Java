<%@ page import="java.sql.*,java.util.Vector" %>
<html>
<body>
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

<%@ include file="nlogo.jsp" %>

<%@ page import="java.sql.*" %>
<jsp:useBean id="KBean8" class="ABean.KMVBean"/>
<%
System.out.println("....jsp kb8..MAgtList...1");

%>
<%! String s,s1;%>
<%! int count;%>
<%
   Cookie [] coks=request.getCookies();
   
    for(count=0;count<coks.length;count++)
        {
          s1=coks[count].getName();
        
               if (s1.equals("mno"))
                { 
                   System.out.println("....jsp..KBean8....s1=cookie name=" +s1);
                    s=coks[count].getValue();
                    KBean8.setCk(s);
                    break;
                }
          }
%>

<jsp:getProperty name="KBean8" property="agent1"/>
<%! ResultSet rs8;%>
<%
rs8=KBean8.rs;

System.out.println("...jsp kb8...2");

%>



<%
		String mgno = (String)session.getAttribute("uname");
%>
<H1><center>Agent List  for  Manager No  <% out.print(""+s);%></center></H1>
<br>
<%= mgno%>
<Table  Caption="Agent List" cols=5 width="100%" border=2>
<TR><TD>AgentNo</TD>
<TD>FirstName</TD>
<TD>LastName</TD>
<TD>PolicyType</TD>
<TD>BranchNo</TD>
<TD>Target</TD>
<TD>Target Date</TD>
<TD>Target Set Date</TD>

<TD>Policies Sold</TD>
</TR>

<%
while(rs8.next())
{
	String ano = rs8.getString(1);
%>
<TR><TD><%= ano%></TD>
<TD><%out.println(rs8.getString(2));%></TD>
<TD><%out.println(rs8.getString(3));%></TD>

<TD><%out.println(rs8.getString(6));%></TD>
<TD><%out.println(rs8.getString(7));%></TD>
<TD><%out.println(rs8.getString(11));%></TD>
<TD><%out.println(rs8.getString(12));%></TD>
<TD><%out.println(rs8.getString(13));%></TD>
<TD><%= policySold(ano) %></TD>
</TR>

<%
}
%>
</Table>

<p>  
  <p>
<a href="mgtask.jsp"  > BACK </a>
</body>
</html>