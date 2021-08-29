import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class ZmgrVal extends HttpServlet
{
  public String zmno;
  public Cookie cok;

		public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
     	{

	   res.setContentType("text/html");

	   PrintWriter p=res.getWriter();


        String a="",b="";

       System.out.println("1---come to servlet");



 	  String uvalue=req.getParameter("uname");

	  String pvalue=req.getParameter("upwd");


// Database Connection

   	Connection zmgrCon=null;
	Statement stmt=null;
	ResultSet rs=null;

	try{

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	zmgrCon=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");

//   Class.forName("oracle.jdbc.OracleDriver");
   //zmgrCon=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:burman","scott","tiger");

	System.out.println("2---Connection made");
	stmt=zmgrCon.createStatement();
	rs=stmt.executeQuery("Select * from ZMGR ");




       rs.next();

	do
	{
		zmno=rs.getString(1);

		a=rs.getString(4);

		b=rs.getString(5);

	}while(((!uvalue.equals(a))||(!pvalue.equals(b)))&&(rs.next()));




	if ((uvalue.equals(a))&&(pvalue.equals(b)) && zmno!="")
        {
           System.out.println("3....Match found");
           System.out.println(a);   System.out.println(b);
          System.out.println("zmno =" +zmno);
          req.getSession().setAttribute("ucode",zmno);
         // p.println("input type=\"hidden\" name=\"zno\" value=\"+zmno\"");
          cok= new Cookie("zno",""+zmno);
          res.addCookie(cok);

	       System.out.println("goto zmgtask.jsp");
	      RequestDispatcher dispatcher=req.getRequestDispatcher("/zmgtask.jsp");
           dispatcher.forward(req,res);
         }

        else {
		System.out.println("3....Match not found ;goto same page");
		res.sendRedirect("http://localhost:8012/Ams/zmgr.jsp");
             }

	zmgrCon.close();
	stmt.close();

	}catch(Exception ex){ System.out.println("Exception" +ex);}



	}


}
