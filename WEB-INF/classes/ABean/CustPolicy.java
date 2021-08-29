package ABean;
import java.sql.*;
import java.util.*;

public class CustPolicy
{
    String csno, policyno, pdate, mode;
    float years, pamt, premium;
    Connection con;
    public CustPolicy()
    {
        try
        {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con=DriverManager.getConnection("jdbc:odbc:kmvdsn","Administrator","");
        }
        catch(Exception e)
        {
            System.out.println("Policy Const Error : " + e);
        }
    }
    public void setCsno(String s1)     {      this.csno = s1;       }
    public void setPolicyno(String s1) {      this.policyno = s1;   }
    public void setPdate(String s1)    {      this.pdate = s1;      }
    public void setYears(float s1)     {      this.years = s1;      }
    public void setPamt(float s1)      {      this.pamt = s1;       }
    public void setMode(String s1)     {      this.mode = s1;       }
    public void setPremium(float s1)   {      this.premium = s1;    }

    public String getCsno()      {      return this.csno;           }
    public String getPolicyno()  {      return this.policyno;       }
    public String getPdate()     {      return this.pdate;          }
    public float getYears()      {      return this.years;          }
    public float getPamt()       {      return this.pamt;           }
    public String getMode()      {      return this.mode;           }
    public float getPremium()    {      return this.premium;        }

    public boolean save()
    {
        boolean res = false;
        String query = "insert into CustPolicy values(?, ?, ?, ?, ?, ?, ?)";
        //String pno = getNewPolicyNo();
        try
        {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, policyno);
            ps.setString(2, csno);
            ps.setString(3, pdate);
            ps.setFloat(4, years);
            ps.setFloat(5, pamt);
            ps.setString(6, mode);
            ps.setFloat(7, premium);
            int i = ps.executeUpdate();
            if(i==1)
                res = true;
        }
        catch(Exception e)
        {
            System.out.println("Policy save Error : " + e);
        }
        return res;
    }

	public String getNewPolicyNo()
	{
		String newcc = "";
		try
		{
			String query = "select max(Policyno) from CustPolicy";
			PreparedStatement pstat = con.prepareStatement(query);
			ResultSet rs = pstat.executeQuery();
			String str = "";
			boolean first = true;
			if(rs.next())
			{
				first = false;
	    		str = rs.getString(1);
			}
			else
			{
				newcc = "PS001";
			}
			if(!first)
			{
				if(str == null)
				{
    				newcc = "PS001";
				}
				else
				{
					String ns = str.substring(2);
					int i = Integer.parseInt(ns);
					newcc = "PS" + getStr(++i);
				}
			}
		}
		catch(SQLException se)
		{
			System.out.println("New plno Error : " + se);
		}
		//System.out.println("new code : " + newpc);
		return newcc;
	}
	public String getStr(int i)
	{
		String s = "";

		if(i<10)
			s = "00" + i;
		else if(i<100)
			s = "0" + i;
		else
			s = "" + i;
		return s;
	}
}