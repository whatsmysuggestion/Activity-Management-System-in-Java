<%@ page import="java.sql.*"%>

<html>

<%@ include file="nlogo.jsp" %>

<%! String s,s1,csfname,cslname,cslogname,cspwd,csemail,csaddr,csph;%>
<%
	String mg = (String) request.getHeader("save");
/*	if(mg==null || (! mg.equals("1")))
		response.sendRedirect("CustForm.jsp");*/
%>
<jsp:useBean id="cust" class="ABean.Customer" scope="request"/>
<jsp:setProperty name="cust" property="*" />

<jsp:useBean id="cp" class="ABean.CustPolicy" scope="request"/>
<jsp:setProperty name="cp" property="*" />
<%
	String enqid = request.getParameter("enqid");
	Connection con = null;

	try 
	{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");			
	}
	catch(Exception e)
	{
		out.println(e);
	}

	con.setAutoCommit(false);
	boolean cres = false, pres = false;
	if(cust.save())
		cres = true;

	if(cres && (enqid != null))
	{
		try 
		{
			Statement st = con.createStatement();
			st.executeUpdate("update EnqDetails set status=\"Complete\" where eno=" + enqid);
		}
		catch(Exception e)
		{
			out.println("some : " + e);
		}
	}
	cp.setCsno(cust.getCsno());
	System.out.println("P C N : " + cp.getCsno());

	if(cp.save())
		pres = true;
	con.commit();
%>
<p align="center"><%= cres?"Customer Details Saved.":"Customer save error."%>
<p align="center"><%= pres?"Policy Details Saved.":"Policy save error."%>
<br>
</p>
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" width="60%" id="AutoNumber1" style="border-collapse: collapse; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: silver" fpstyle="9,011111100" bordercolor="#111111">
    <tr>
      <td width="37%" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon">
      Customer Details</td>
      <td width="63%" style="font-weight: bold; color: white; border-left-style: none; border-right-style: none; border-top-style: none; border-bottom: 1.5pt solid black; background-color: maroon">&nbsp;</td>
    </tr>
    <tr>
      <td width="37%" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15">Customer No</td>
      <td width="63%" style="color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15"><%= cres?cust.getCsno():"" %></td>
    </tr>
    <tr>
      <td width="37%" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15">Customer Name</td>
      <td width="63%" style="color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15"><%= cres?(cust.getCsfname() + " " + cust.getCslname()):"" %></td>
    </tr>
    <tr>
      <td width="37%" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15">Policy No</td>
      <td width="63%" style="color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15"><%= pres?cp.getPolicyno():""%></td>
    </tr>
    <tr>
      <td width="37%" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15">Policy Date</td>
      <td width="63%" style="color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15"><%= pres?cp.getPdate():""%></td>
    </tr>
    <tr>
      <td width="37%" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15">Policy Amount</td>
      <td width="63%" style="color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15"><%= pres?""+cp.getPamt():""%></td>
    </tr>
    <tr>
      <td width="37%" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15">Mode of Payment</td>
      <td width="63%" style="color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15"><%= pres?cp.getMode():""%></td>
    </tr>
    <tr>
      <td width="37%" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15">Premium Amount</td>
      <td width="63%" style="color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15"><%= pres?""+cp.getPremium():""%></td>
    </tr>
    <tr>
      <td width="37%" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15">No of Years</td>
      <td width="63%" style="color: black; border-style: none; background-color: #FFFFEF" height="25">
      <p style="margin-left: 15"><%= pres?""+cp.getYears():""%></td>
    </tr>
    <tr>
      <td width="37%" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25">&nbsp;</td>
      <td width="63%" style="color: black; border-style: none; background-color: #FFFFEF" height="25">&nbsp;</td>
    </tr>
    <tr>
      <td width="100%" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25" colspan="2">
      <p align="center">
	<a href="agtask.jsp" > Back to Task Menu  </a>
      </td>
    </tr>
    <tr>
      <td width="100%" style="font-weight: bold; color: black; border-style: none; background-color: #FFFFEF" height="25" colspan="2">
      <p align="center"><a href="CustForm.jsp" >Back to New Customer Form</a></td>
    </tr>
  </table>
  </center>
</div>