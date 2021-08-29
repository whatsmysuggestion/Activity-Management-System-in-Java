package ABean;
import java.sql.*;
import java.util.*;

public class KMVBean
    {
     public Connection con;
     public Statement st;
     public ResultSet rs;
     public String ss=" hello";
     public String ck;

     public int match=0;
	 public String brno;
	 public String zmno1;



//  CONSTRUCTOR
     public KMVBean()
          {
              try {
                         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                           con=DriverManager.getConnection("jdbc:odbc:kmvdsn","scott","tiger");

                       // Class.forName("oracle.jdbc.OracleDriver");
                        //con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:burman","scott","tiger");
                        st=con.createStatement();
                       System.out.println("KMVBean...Connection made");

                    } catch(Exception e) { System.out.println(e); }
           }

public Connection getConnection()
{
	return con;
}


//SETTING login COOKIE VALUE

            public void setCk(String s1)
               {
				       ck=s1;
				       System.out.println("CKVALUE...."+ck);
			 }

	   public String getCk()
		       {
				    return "";
				    }


//INSERTING IN ZONAL MANAGER TABLE
     public void setZmgr(String ZMGNO,String FirstName,String LastName,String LoginName,String LoginPwd)
             {
                try {
                       st.executeUpdate("insert into ZMGR values("+ZMGNO+",'"+FirstName+"', '"+LastName+"','"+LoginName+"','"+LoginPwd+"') ");
                     con.setAutoCommit(true);

                    } catch(Exception e) { System.out.println(e); }
              }

//RETRIEVING FROM ZONAL MANAGER TABLE
     public String getZmgr()
           {
               try {
                  rs=st.executeQuery("select * from ZMGR");
         	        } catch(Exception e) { System.out.println("Exce..."+e); }
		         return ("");
            }




//INSERTING INTO  MANAGER TABLE
      public void setMgr(String FirstName,String LastName,String LoginName,String Loginpwd,String EmailID,String Address,String PhoneNo,String BrNO)
           {
                  try{
                            String mno1,mno2 ,mrno;
					      int mno=0;int max=0;
  			   	         ResultSet	rsx=st.executeQuery("Select * from MGR ");
					        rsx.next();
							do
								{
									mno1=rsx.getString(1);
					     		    mno2=mno1.substring(2);
							    	mno=Integer.parseInt(mno2);
									 if (max<mno){max=mno;}
						      }  while (rsx.next());

					         if (match==0){
					           System.out.println(" max mgrno .=  ..."+max);
				                int mrn=max+1;
					         System.out.println(" new mgrno .=  ..."+mrn);
						       mrno="MG00"+mrn;

                               st.executeUpdate("insert into MGR values('"+mrno+"','"+FirstName+"', '"+LastName+"','"+LoginName+"','"+Loginpwd+"','"+EmailID+"','"+Address+"','"+PhoneNo+"','"+BrNO+"') ");
							    con.setAutoCommit(true);
							    match=1;}

                             } catch(Exception e) { System.out.println(e); }
			              }

//RETRIEVING FROM  MANAGER TABLE for zonal manager
			   public String getMgr()
			        {
			            try {

				            rs=st.executeQuery("select MGR.* from MGR , BR where MGR.BRNO=BR.BRNO AND BR.ZMGNO='"+ck+"'");
				        	} catch(Exception e) { System.out.println("Exce..."+e); }
					         return ("");
                   }

//RETRIEVING FROM  MANAGER TABLE for Manger
	   public String getMgr1()
	     {
	       try {
                ResultSet rsx= st.executeQuery("select BR.ZMGNO from BR,MGR where MGR.BRNO=BR.BRNO AND MGR.MGNO='"+ck+"'");

                  rsx.next();
				  zmno1=rsx.getString(1);


                System.out.println(".zmno of logged in MGR "+ zmno1 );

                 rs=st.executeQuery("select MGR.* from MGR , BR where MGR.BRNO=BR.BRNO AND BR.ZMGNO='"+zmno1+"'");

			} catch(Exception e) { System.out.println("Exce..."+e); }
					         return ("");
          }

    public void setMgr1() {}


// REPLACING MANAGER FOR A BRANCH

public void setRepMgr(String FirstName,String LastName,String LoginName,String Loginpwd,String EmailID,String Address,String PhoneNo,String BrNO)
	    {
		         try {


                                 if (match==0)
                                  {   ResultSet rsx= st.executeQuery("Select * from MGR where BRNO ='"+BrNO+"'");
					                  rsx.next();


					                 String MgNo=rsx.getString(1);

                                     System.out.println("manager no to be replaced =  "+MgNo);
                                     System.out.println("br no to be replaced="+BrNO);

							          st.executeUpdate("update  MGR set  FirstName='"+FirstName+"', LastName='"+LastName+"',LoginName='"+LoginName+"', LoginPwd='"+Loginpwd+"', EmailID='"+EmailID+"',Address='"+Address+"',PhoneNo='"+PhoneNo+"'    where MGNO ='"+MgNo+"' ");

							          con.setAutoCommit(true);
							          match=1;
							      }



			} catch(Exception e) { System.out.println("Exce..."+e); }

          }




//RETRIEVING FROM AGENT TABLE for zonal manager

	     public String getAgent()
			       {
			            try {

				          	rs=st.executeQuery("select AGT.* from AGT , BR where AGT.BRNO=BR.BRNO AND BR.ZMGNO='"+ck+"'");

					       	} catch(Exception e) { System.out.println("Exce..."+e); }
						       return ("");
					  }

//INSERTING INTO AGENT TABLE for manager

   public void setAgent(String FirstName,String LastName,String LoginName,String LoginPwd, String PType, String EMailID,String Address,String PhoneNo)
      {
	     try {

		        String agno1,agno2 ,agno; int agn=0; int max=0;
			  ResultSet	rsx=st.executeQuery("Select * from AGT ");
			  rsx.next();
			do
			 {

			  agno1=rsx.getString(1);
			  agno2=agno1.substring(2);
			  agn=Integer.parseInt(agno2);

			   if (max<agn){max=agn;}

		      }  while (rsx.next());

	     if (match==0)
	              {
				      System.out.println(" max agtno .=  ..."+max);
			         agn=max+1;

		              agno="AG00"+agn;
		              System.out.println(" new agtno .=  ..."+agno);

                      ResultSet rsy=st.executeQuery("select BRNO from MGR where MGNO='"+ck+"'");
                       rsy.next();
                      String agbrno=rsy.getString(1);

				     System.out.println("new agt brno= " +agbrno);

						java.util.Date  today=new  java.util.Date();
			         System.out.println("Todays date =today=   "+ today);
			        String today1=today.toString();

                      st.executeUpdate("insert into AGT values('"+agno+"','"+FirstName+"', '"+LastName+"','"+LoginName+"','"+LoginPwd+"','"+PType+"','"+agbrno+"','"+EMailID+"','"+Address+"','"+PhoneNo+"',"+0+","+0+",'"+today1+"',"+0+") ");
			         con.setAutoCommit(true);
			         match=1;
			     }

	        } catch(Exception e) { System.out.println(e); }
        }



//RETRIEVING FROM AGENT TABLE for  manager

  public String getAgent1()
		 {
	           try {

						rs=st.executeQuery("select AGT.* from AGT , MGR where AGT.BRNO=MGR.BRNO AND MGR.MGNO='"+ck+"'");

                   } catch(Exception e) { System.out.println("Exce..."+e); }
					  						       return ("");
					  					  }

// Setting Target for Agent

public void setAgTarget(String agno,String agtarget,String agtargetdt,String agtargetmth,String agtargetyear)
 {
	 try{
			int agtargetmth1=0;
             int agtarget1=Integer.parseInt(agtarget);

             int agtargetdt1=Integer.parseInt(agtargetdt);
             int agtargetyear2=Integer.parseInt(agtargetyear);
				 int agtargetyear1=agtargetyear2-1900;


             if(agtargetmth.equals("January")){agtargetmth1=0;}
            if(agtargetmth.equals("February")){agtargetmth1=1;}
            if(agtargetmth.equals("March")){agtargetmth1=2;}

            if(agtargetmth.equals("April")){agtargetmth1=3;}
            if(agtargetmth.equals("May")){agtargetmth1=4;}
            if(agtargetmth.equals("June")){agtargetmth1=5;}

           if(agtargetmth.equals("July")){agtargetmth1=6;}
           if(agtargetmth.equals("August")){agtargetmth1=7;}
          if(agtargetmth.equals("September")){agtargetmth1=8;}

           if(agtargetmth.equals("October")){agtargetmth1=9;}
           if(agtargetmth.equals("November")){agtargetmth1=10;}
           if(agtargetmth.equals("December")){agtargetmth1=11;}



           java.util.Date agtargetdate=new  java.util.Date(agtargetyear1,agtargetmth1,agtargetdt1);
			System.out.println("Target date =agtargetdate=   "+ agtargetdate);

          java.util.Date  today=new  java.util.Date();
          System.out.println("Todays date =today=   "+ today);
			String today1=today.toString();
          if(today.before(agtargetdate)&&match==0)
            {
            String agtargetdate1=agtargetdate.toString();
	        st.executeUpdate("update  AGT set Target="+agtarget1+", TargetDate='"+agtargetdate1+"',TargetSetDate='"+today1+"' where AGNO ='"+agno+"' ");
	        con.setAutoCommit(true);
            match=1;
	      }
	   else{
		   match=2;
	       }


	     } catch(Exception e) { System.out.println(e); }


	 }

// Retrieval of AGent Performance
  public String getAgtperfm(String agno)
  {
	  try{


                  	rs= st.executeQuery("select * from AGT where AGNO='"+agno+"'");


          } catch (Exception e) { System.out.println(e); }
                 	return "";

	}



	//RETRIEVING FROM AGENT TABLE for  Agent

	public String getAgent2()
						  			       {
						  			            try {
													ResultSet rsx=st.executeQuery("select BRNO from AGT  where AGNO='"+ck+"'");
													rsx.next();
													brno= rsx.getString(1);

													System.out.println("br no of logged in agent="+brno);
	                                   				rs=st.executeQuery("select * from AGT where BRNO='"+brno+"'");

						  					       	} catch(Exception e) { System.out.println("Exce..."+e); }
						  						       return ("");
					  					  }



//RETRIEVING FROM Customer TABLE for  Agent

	public String getCst()
						  			       {
						  			            try {

	                                   				rs=st.executeQuery("select * from CST where AGNO='"+ck+"'");

						  					       	} catch(Exception e) { System.out.println("Exce..."+e); }
						  						       return ("");
					  					  }


//INSERTING INTO Customer TABLE by  Agent

public void setCst(String FirstName,String LastName,String LoginName,String LoginPwd, String EMailID,String Address,String PhoneNo)
{
	try
	{
		String csno2,csno1,csno="",pno="";ResultSet rsx,rsy,rsz,rsa;
		int max=0; int cno;
		System.out.println("match=  "+match);
		if (match==0)
		{
			//calculate total policies sold (new)

			rsy=st.executeQuery("select PType,PoliciesSold from AGT where AGNO='"+ck+"'");
			rsy.next();
			String ptype = rsy.getString(1);
			System.out.println("AG/CS Ptype= "+ptype);
			String psold1=rsy.getString(2);
			int   psold=Integer.parseInt(psold1) +1;
			System.out.println("AG Policies Sold (new)= "+psold);

			// calculate new policy no.
			rsz=st.executeQuery("select  COUNT(PType)  from CST  where PType='"+ptype+"'");
			if (rsz.next())
			{
				String row1=rsz.getString(1);
				int row=Integer.parseInt(row1);
				System.out.println("no of rows =" +row);
				pno = ptype +"00"+ (row+1);
				System.out.println("New PNO = " +pno);
			}

			//calculate new customer no
			rsx=st.executeQuery("select CSNO  from CST ");
			if (rsx.next())
			{
				do
				{
					csno1=rsx.getString(1);
					csno2=csno1.substring(2);
					cno=Integer.parseInt(csno2);
					if (max<cno) {max=cno;}
				}  while (rsx.next());
				System.out.println(" max CSNO .=  ..."+max);
			}

			csno="CS00"+(max+1);
			System.out.println(" new CSNO .=  ..."+csno);

			//check if customer is new or existing
			rsa=st.executeQuery("select CSNO  from CST where FirstName='"+FirstName+"'  AND LastName='"+LastName+"'  ");
			if( rsa.next())
			{
				csno=rsa.getString (1);
				System.out.println(" old/new CSNO .=  ..."+csno);
			}


			// update CST table
			st.executeUpdate("insert into CST values('"+csno+"','"+FirstName+"', '"+LastName+"','"+LoginName+"','"+LoginPwd+"','"+ptype+"','"+pno+"','"+ck+"','"+EMailID+"','"+Address+"','"+PhoneNo+"') ");
			con.setAutoCommit(true);

			// update AGT table,policiessold column

			st.executeUpdate("update  AGT set PoliciesSold="+psold+" where AGNO ='"+ck+"' ");
			con.setAutoCommit(true);
			match=1;
		}

	} catch(Exception e) { System.out.println("Exce..."+e); }
}


//RETRIEVING FROM APPointment TABLE for AGent


public String getApptList( String apptdt,String apptmth,String apptyear)
    {
        try {
				String apdate;
				int apptdt1,apptmth1=0,apptyear1;

				  apptdt1=Integer.parseInt(apptdt);
                  apptyear1=Integer.parseInt(apptyear);
                   apptyear1=apptyear1-1900;

             if(apptmth.equals("January")){apptmth1=0;}
          if(apptmth.equals("February")){apptmth1=1;}
          if(apptmth.equals("March")){apptmth1=2;}
         if(apptmth.equals("April")){apptmth1=3;}
          if(apptmth.equals("May")){apptmth1=4;}
          if(apptmth.equals("June")){apptmth1=5;}
          if(apptmth.equals("July")){apptmth1=6;}
          if(apptmth.equals("August")){apptmth1=7;}
         if(apptmth.equals("September")){apptmth1=8;}
         if(apptmth.equals("October")){apptmth1=9;}
          if(apptmth.equals("November")){apptmth1=10;}
          if(apptmth.equals("December")){apptmth1=11;}

       java.util.Date apptdate=new  java.util.Date(apptyear1,apptmth1,apptdt1);
      	System.out.println("Appointment List date =apptdate=   "+ apptdate);
     String apptdate1=apptdate.toString();
 		rs=st.executeQuery("select * from APPT where AGNO='"+ck+"' AND  APDate='"+apptdate1+"'");

       	} catch(Exception e) { System.out.println("Exce..."+e); }
	   return ("");
 }


//RETRIEVING FROM APPointment TABLE by AGent for deleting


public String getdelApptList( String apid)
						  			       {
						  			            try {

	                                   	     	     ResultSet		rsx=st.executeQuery("select AGNO from APPT where APID='"+apid+"'");
	                                   	     	     boolean boo=rsx.next();
	                                 				 if(boo)
	                                   				{

														           String agno=rsx.getString(1);

	                                   				               if(agno.equals(ck))
	                                   				               {
														                rs=st.executeQuery("select * from APPT where APID='"+apid+"'");
														                match=1;
											     	                }	else{match=2;}

												}else{match =0;}


						  					       	} catch(Exception e) { System.out.println("Exce..."+e); }
						  						       return ("");
					  					  }

//Deleting APPointment already retrieved by AGent

public void setdelAppt(String aid)
						  			       {
						  			            try {

	                                   				st.executeUpdate("delete  from APPT where APID='"+aid+"'");
	                                   				con.setAutoCommit(true);
	                                   				match=1;

						  					       	} catch(Exception e) { System.out.println("Exce..."+e); }

					  					  }


//INSERTING INTO APPT TABLE by Agent


  public void setAppt(String apptdt,String apptmth,String apptyear,String appttime,String csname)
  {
                try {
                           String apno,apno1,apno2,apdate,aptime;  int x=0; int max=0;
                           int apptdt1,apptmth1=0,apptyear1;
                      if(match==0)
                      {
                           apptdt1=Integer.parseInt(apptdt);
                            apptyear1=Integer.parseInt(apptyear);
                            apptyear1=apptyear1-1900;


                                     if(apptmth.equals("January")){apptmth1=0;}
						             if(apptmth.equals("February")){apptmth1=1;}
						             if(apptmth.equals("March")){apptmth1=2;}

						             if(apptmth.equals("April")){apptmth1=3;}
						             if(apptmth.equals("May")){apptmth1=4;}
						             if(apptmth.equals("June")){apptmth1=5;}

						            if(apptmth.equals("July")){apptmth1=6;}
						            if(apptmth.equals("August")){apptmth1=7;}
						           if(apptmth.equals("September")){apptmth1=8;}

						            if(apptmth.equals("October")){apptmth1=9;}
						            if(apptmth.equals("November")){apptmth1=10;}
						            if(apptmth.equals("December")){apptmth1=11;}



						            java.util.Date apptdate=new  java.util.Date(apptyear1,apptmth1,apptdt1);
		                    	System.out.println("New Appointment date =apptdate=   "+ apptdate);

		                    	java.util.Date  today=new  java.util.Date();
								System.out.println("Todays date =today=   "+ today);

                       if(today.before(apptdate))
                       {


                           String apptdate1=apptdate.toString();
                           System.out.println("New Appointment datea1(String) =apptdate1=   "+ apptdate1);

	     				 ResultSet rsx=st.executeQuery("select APID, APDate,Time from APPT ");
	                     if(rsx.next())
	                     {
		                  do
			              {
						         //Checking date and time
				apno1=rsx.getString(1);
			                  apdate=rsx.getString(2);
System.out.println(apdate+"ss1");
			                  aptime=rsx.getString(3);

		                        if(apdate.equals(apptdate1) && aptime.equals(appttime))
		                         {
								     match=2;
								     System.out.println("Match = 2. going to break");
			                         break;
				     	         }
                         System.out.println("Break not occured. match=01");
						   //calculating apid

  System.out.println(apno1);						   apno2=apno1.substring(2);
				    		x=Integer.parseInt(apno2);
					        if (max<x){max=x;}

			    	}while ( rsx.next());
         	   }
              System.out.println("Break occured");
						if(match!=2)
						{
						       System.out.println("Last APID NO= "+max);
					            System.out.println("New APID no=int x+1 =" +(x+1));
					            apno="AP00"+(x+1);

                       st.executeUpdate("insert into APPT values('"+apno+"','"+ck+"','"+apptdate1+"', '"+appttime+"','"+csname+"') ");
                       con.setAutoCommit(true);
                       match=1;
				      }
			     }
	     	   }
          } catch(Exception e) { System.out.println(e); }
       }





// //RETRIEVING Policy for AGent

	public ResultSet getPolicy()
     {
	         try {
				 rs=st.executeQuery("select PType from AGT  where AGNO='"+ck+"'");

			      	} catch(Exception e) { System.out.println("Exce..."+e); }
				 return (rs);
		 }

// //RETRIEVING Customer  Account for Customer

	public String getCst1()
						  			       {
						  			            try {
													 rs=st.executeQuery("select * from CST  where CSNO='"+ck+"'");

	                                   			      	} catch(Exception e) { System.out.println("Exce..."+e); }
						  						        return ("");
					  					  }

// CHANGING PASSWORD FOR CUSTOMER

public void setCstPwd(String logname, String logpwd)
 {
	 try{


	        st.executeUpdate("update  CST set LoginPwd='"+logpwd+"' where CSNO ='"+ck+"' AND LoginName='"+logname+"' ");
	        con.setAutoCommit(true);
            match=1;


	     } catch(Exception e) { System.out.println(e); }


	 }



//INSERTING INTO BRANCH TABLE
     public void setBranch(String BRName,String BRAddress)
       {
        try {

	   		String bno1,bno2 ;

	   		int bno=0;int max=0;

		        ResultSet rsx=st.executeQuery("Select * from BR");

               	        rsx.next();

			do
			{

				bno1=rsx.getString(1);

		     		    bno2=bno1.substring(2);

				    	bno=Integer.parseInt(bno2);

						 if (max<bno)
						  {
							max=bno;
						}
			      }  while (rsx.next());
        if (match==0)
{
		      System.out.println(" max brno .=  ..."+max);

	          int brn=max+10;

	          System.out.println(" new brno .=  ..."+brn);

                  brno="BR"+brn;

                st.executeUpdate("insert into BR values('"+brno+"','"+BRName+"', '"+BRAddress+"','"+ck+"') ");
                con.setAutoCommit(true);
                match=1;
}

           } catch(Exception e) { System.out.println(e); }
	 }



//RETRIEVING FROM BRANCH TABLE for Zonal Manager in Replace Manager FORM

	public String getBranch()
	{
		try
		{
			rs=st.executeQuery("select BRNO from  BR where ZMGNO='"+ck+"'");
		}
		catch(Exception e) { System.out.println("Exce..."+e); }
		return ("");
	}

	public ResultSet getBranchDetails(String zmno)
	{
		ResultSet rs = null;
		try
		{
			String q = "SELECT BR.BRNO, BR.BRName, BR.BRAddress, MGR.FirstName, MGR.LastName, MGR.MGNO FROM (BR INNER JOIN MGR ON BR.BRNO = MGR.BRNO) INNER JOIN ZMGR ON BR.ZMGNO = ZMGR.ZMGNO where ZMGR.ZMGNO='" + zmno + "'";
			rs = st.executeQuery(q);
		}
		catch(Exception e)
		{
			System.out.println("Br Det Error : " + e);
		}
		return rs;
	}
	public String getZMgrName(String zmno)
	{
		String name = "";
		try
		{
			String q = "SELECT FirstName, LastName FROM ZMGR where ZMGNO='" + zmno + "'";
			rs = st.executeQuery(q);
			if(rs.next())
			{
				name = rs.getString(1) + " " + rs.getString(2);
			}
		}
		catch(Exception e)
		{
			System.out.println("Br Det Error : " + e);
		}
		return name;
	}
	public ResultSet getIncentiveDetails(String zmno)
	{
		ResultSet rs = null;
		try
		{
			String q = "SELECT * FROM incentive where ZMGNO='" + zmno + "'";
			rs = st.executeQuery(q);
		}
		catch(Exception e)
		{
			System.out.println("Inc Det Error : " + e);
		}
		return rs;
	}
	public void updateIncentive(String zmno, String target, String inc)
	{
		try
		{
			float t = Float.parseFloat(target);
			float i = Float.parseFloat(inc);
			String q = "insert into incentive values('" + zmno + "'," + t + ", " + i + ")";
			st.executeUpdate(q);
		}
		catch(Exception e)
		{
			System.out.println("Inc Save Error : " + e);
		}
	}
}