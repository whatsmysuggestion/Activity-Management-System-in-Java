import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class CustVal extends HttpServlet
{
  public String cno;
  public Cookie cok5;

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html");
		PrintWriter p=res.getWriter();
		String a="",b="";
		System.out.println("1---come to CustVal servlet");

		String uvalue=req.getParameter("uname");
		String pvalue=req.getParameter("upwd");

		// Database Connection

		Connection custCon=null;
		Statement stmt=null;
		ResultSet rs=null;

		try{

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			custCon=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");

			//Class.forName("oracle.jdbc.OracleDriver");
			//custCon=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:burman","scott","tiger");

			stmt=custCon.createStatement();
			rs=stmt.executeQuery("Select * from CST ");

//			System.out.println("2---Connection made");

			rs.next();
			do
			{
				cno=rs.getString(1);
				a=rs.getString(4);
				b=rs.getString(5);
			}while(((!uvalue.equals(a))||(!pvalue.equals(b)))&&(rs.next()));

			if ((uvalue.equals(a))&&(pvalue.equals(b)) && cno!="")
			{
//				System.out.println("3....Match found");
//				System.out.println(a);   System.out.println(b);
				System.out.println("cno = " +cno);

				cok5= new Cookie("cno",cno);
				res.addCookie(cok5);

//				System.out.println("goto csttask.jsp");
                req.getSession().setAttribute("uname", cno);;
				RequestDispatcher dispatcher=req.getRequestDispatcher("/csttask.jsp");
				dispatcher.forward(req,res);
			}
			else
			{
				System.out.println("3....Match not found ;goto same page");
				res.sendRedirect("cst.jsp");
			}

			custCon.close();
			stmt.close();
		}catch(Exception ex){ }
	}
}