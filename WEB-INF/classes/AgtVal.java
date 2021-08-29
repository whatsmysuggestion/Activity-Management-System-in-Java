import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class AgtVal extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html");

		PrintWriter p=res.getWriter();
		String a="",b="";

//		System.out.println("1---come to agtVal sevlet");
		String uvalue=req.getParameter("uname");
		String pvalue=req.getParameter("upwd");
		// Database Connection

		Connection agtCon=null;
		Statement stmt=null;
		ResultSet rs=null;
		String ano=null;
		try{

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			agtCon=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");

			//Class.forName("oracle.jdbc.OracleDriver");
			//agtCon=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:burman","scott","tiger");

			stmt=agtCon.createStatement();
			rs=stmt.executeQuery("Select * from AGT ");

			rs.next();

			do
			{
				ano=rs.getString(1);
				a=rs.getString(4);
				b=rs.getString(5);
			}while(((!uvalue.equals(a))||(!pvalue.equals(b)))&&(rs.next()));

			if ((uvalue.equals(a))&&(pvalue.equals(b)) && ano!="")
			{
//				System.out.println("3....Match found");
//				System.out.println("ano = " +ano);

				Cookie cok3= new Cookie("ano",ano);
				res.addCookie(cok3);

//				System.out.println("goto agtask.jsp");
				req.getSession().setAttribute("uname",ano);
				RequestDispatcher dispatcher=req.getRequestDispatcher("agtask.jsp");
				dispatcher.forward(req,res);
			}
			else
			{
				System.out.println("3....Match not found ;goto same page");
				res.sendRedirect("agt.jsp");
			}

			agtCon.close();
			stmt.close();
		}catch(Exception ex){ }
	}
}