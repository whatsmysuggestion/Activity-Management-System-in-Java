import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class MgrVal extends HttpServlet
{
  public String mno;
  public Cookie cok2;

		public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
     	{

	   res.setContentType("text/html");

	   PrintWriter p=res.getWriter();


        String a="",b="";

  System.out.println("1---come to mgrVal sevlet");



 	String uvalue=req.getParameter("uname");

	String pvalue=req.getParameter("upwd");


// Database Connection

   	Connection mgrCon=null;
	Statement stmt=null;
	ResultSet rs=null;

	try{

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	mgrCon=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");

	//Class.forName("oracle.jdbc.OracleDriver");
    //mgrCon=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:burman","scott","tiger");

	stmt=mgrCon.createStatement();
	rs=stmt.executeQuery("Select * from MGR ");

	System.out.println("2---Connection made");


       rs.next();
	do
	{
		mno=rs.getString(1);

		a=rs.getString(4);

		b=rs.getString(5);

	}while(((!uvalue.equals(a))||(!pvalue.equals(b)))&&(rs.next()));




	if ((uvalue.equals(a))&&(pvalue.equals(b)) && mno!="")
        {
           System.out.println("3....Match found");
           System.out.println(a);   System.out.println(b);
           req.getSession().setAttribute("uname", mno);

          cok2= new Cookie("mno",mno);
          res.addCookie(cok2);

	       System.out.println("goto mgtask.jsp");
	      RequestDispatcher dispatcher=req.getRequestDispatcher("/mgtask.jsp");
           dispatcher.forward(req,res);
         }

        else {
		System.out.println("3....Match not found ;goto same page");
		res.sendRedirect("http://localhost:8012/Ams/mgr.jsp");
             }

	mgrCon.close();
	stmt.close();

	}catch(Exception ex){ }



	}


}