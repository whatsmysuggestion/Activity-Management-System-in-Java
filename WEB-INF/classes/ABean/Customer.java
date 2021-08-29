package ABean;
import java.sql.*;
import java.util.*;

public class Customer
{
    String csfname, cslname, cslogname, cspwd, csemail, csaddr, csph, agno, csno;
    Connection con;
    public Customer()
    {
        try
        {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");
        }
        catch(Exception e)
        {
            System.out.println("Customer Const Error : " + e);
        }
    }
    public void setCsno(String s1)      {      this.csno = s1;       }
    public void setCsfname(String s1)   {      this.csfname = s1;    }
    public void setCslname(String s1)   {      this.cslname = s1;    }
    public void setCslogname(String s1) {      this.cslogname = s1;  }
    public void setCspwd(String s1)     {      this.cspwd = s1;      }
    public void setCsemail(String s1)   {      this.csemail = s1;    }
    public void setCsaddr(String s1)    {      this.csaddr = s1;     }
    public void setCsph(String s1)      {      this.csph = s1;       }
    public void setAgno(String s1)      {      this.agno = s1;       }

    public String getCsno()      {      return this.csno;       }
    public String getCsfname()   {      return this.csfname;    }
    public String getCslname()   {      return this.cslname;    }
    public String getCslogname() {      return this.cslogname;  }
    public String getCspwd()     {      return this.cspwd;      }
    public String getCsemail()   {      return this.csemail;    }
    public String getCsaddr()    {      return this.csaddr;     }
    public String getCsph()      {      return this.csph;       }
    public String getAgno()      {      return this.agno;       }

    public boolean save()
    {
        boolean res = false;
        String query = "insert into cst values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String csno = getNewCustomerNo();
/*        System.out.println("New cc : " + csno);
        System.out.print(csno + ";");
        System.out.print(csfname + ";");
        System.out.print(cslname + ";");
        System.out.print(cslogname + ";");
        System.out.print(cspwd + ";");
        System.out.print(csemail + ";");
        System.out.print(csaddr + ";");
        System.out.print(csph + ";");
        System.out.print(agno + ";");
*/
        try
        {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, csno);
            ps.setString(2, csfname);
            ps.setString(3, cslname);
            ps.setString(4, cslogname);
            ps.setString(5, cspwd);
            ps.setString(6, csemail);
            ps.setString(7, csaddr);
            ps.setString(8, csph);
            ps.setString(9, agno);
            int i = ps.executeUpdate();
            if(i==1)
                res = true;
            setCsno(csno);
        }
        catch(Exception e)
        {
            System.out.println("Customer save Error : " + e);
        }
        return res;
    }

	public String getNewCustomerNo()
	{
		String newcc = "";
		try
		{
			String query = "select max(csno) from cst";
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
				newcc = "CS001";
			}
			if(!first)
			{
				if(str == null)
				{
    				newcc = "CS001";
				}
				else
				{
					String ns = str.substring(2);
					int i = Integer.parseInt(ns);
					newcc = "CS" + getStr(++i);
				}
			}
		}
		catch(SQLException se)
		{
			System.out.println("New cc Error : " + se);
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