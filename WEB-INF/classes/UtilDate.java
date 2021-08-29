package util;
public class UtilDate
{
	public boolean inRange(String s1, String s2, String s3)
	{
		/**
			s1 in "mm/dd/yyyy"
			s2 in "mm/dd/yyyy"
			s3 in "mm-dd-yyyy"
		*/
		boolean inrange = false;
		java.util.Date dd1 = new java.util.Date(getDateStr(s1));
		java.util.Date dd2 = new java.util.Date(getDateStr(s2));
		java.util.Date ddd = new java.util.Date(s3.replaceAll("-", "/"));

		if(dd1.before(ddd) && ddd.before(dd2))
			inrange = true;
		if(dd1.equals(ddd) || dd2.equals(ddd))
			inrange = true;

		return inrange;
	}
	public boolean before(String s1, String s2)
	{
		boolean res = false;
		try
		{
			java.util.Date dd1, dd2;

			/* Checking - in the String
			*	if present replace to /
			*/
			if(s1.indexOf("-") == -1)
				dd1 = new java.util.Date(s1);
			else
				dd1 = new java.util.Date(s1.replaceAll("-", "/"));

			if(s2.indexOf("-") == -1)
				dd2 = new java.util.Date(s2);
			else
				dd2 = new java.util.Date(s2.replaceAll("-", "/"));

			if(dd1.before(dd2))
				res = true;
		}
		catch(Exception e)
		{
			System.out.println("Before Err : " + e);
		}
		return res;
	}
	public String addMonth(String s, int m)
	{
		/**This function takes the date as the Ist arg ("mm/dd/yyyy") and
		adds the second arg to the months*/
		java.util.Date d = null;
		try
		{
			d = new java.util.Date(s);
		}
		catch(Exception e)
		{
			try
			{
				d = new java.util.Date(s.replaceAll("-", "/"));
			}
			catch(Exception e1){}
		}
		String str = (d.getMonth() + ++m) + "/" + d.getDate() + "/" + (1900 + d.getYear());
		return getDateStr(new java.util.Date(str).toString());
	}
	public String getDateStr(String s)
	{
		/**This function converts String "Tue Jan 03 00:00:00 GMT+05:30 2006" into
		String of "mm/dd/yyyy" format*/
		String res = "";
		String sm, sd, sy;
		sm = sd = sy = "";
		int i = s.length();
		java.util.StringTokenizer str = new java.util.StringTokenizer(s, " ");
		str.nextToken();
		sm = str.nextToken();
		sd = str.nextToken();
		sy = s.substring(i-4);

		return getMonth(sm) + "/" + sd + "/" + sy;
	}
	public int getMonth(String s)
	{
		int m = 0;
		if(s.equalsIgnoreCase("Jan"))
			m = 1;
		else if(s.equalsIgnoreCase("Feb"))
			m = 2;
		else if(s.equalsIgnoreCase("Mar"))
			m = 3;
		else if(s.equalsIgnoreCase("Apr"))
			m = 4;
		else if(s.equalsIgnoreCase("May"))
			m = 5;
		else if(s.equalsIgnoreCase("Jun"))
			m = 6;
		else if(s.equalsIgnoreCase("Jul"))
			m = 7;
		else if(s.equalsIgnoreCase("Aug"))
			m = 8;
		else if(s.equalsIgnoreCase("Sep"))
			m = 9;
		else if(s.equalsIgnoreCase("Oct"))
			m = 10;
		else if(s.equalsIgnoreCase("Nov"))
			m = 11;
		else if(s.equalsIgnoreCase("Dec"))
			m = 12;

		return m;
	}
}