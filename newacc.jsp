<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function dil(form)
{
  
   
	
  
   }
</SCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Online Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
</script>

</head>

<body>

<div id="top_links">
  

<div id="header">
	<h1>Online Banking System<span class="style1"></span></h1>
	<h1>For RIO Bank Co.Ltd<span class="style1"></span></h1>
    <h2>Extra Ordinary Service</h2>
    <A href="index.html"><IMG SRC="images/home1.gif"></IMG></A>	
</div>

<div id="navigation">
    <ul>
	
    <li><a href="createacc.jsp">NEW ACCOUNT</a></li>
    <li><a href="balance1.jsp">BALANCE</a></li>
    <li><a href="deposit1.jsp">DEPOSIT</a></li>
    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
    <li><a href="transfer1.jsp">TRANSFER</a></li>
    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
  
	 <li><a href="logout.jsp">LOGOUT</a></li>
    </ul>
</div>



<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <ul>
        	<li><a href="#">www.onlinebanking.com</a></li>
            <li><a href="#">www.onlineservices.com </a></li>
            <li><a href="#">www.onlinemoneytransfer.com/forum.jsp</a></li>
            </ul>
			
       </div>
	</td>
	<td width="1200" valign="top">
    <%

	 String bid=request.getParameter("bid");
     String bname=request.getParameter("bname");
	 String brno=request.getParameter("brno");
     String accno=request.getParameter("accno");
	 String acctype=request.getParameter("acctype");
     String amount=request.getParameter("amount");
	 String loc=request.getParameter("loc");
     String ssn=request.getParameter("ssn");
     int brno1=Integer.parseInt(brno);
     int accno1=Integer.parseInt(accno);
	  int amount1=Integer.parseInt(amount);

	System.out.println(ssn);

     Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		
		ps = con.prepareStatement("Insert into bank values(?,?,?,?)");
		
		ps.setString(1,bid);
		ps.setString(2,bname);
		ps.setString(3,loc);
		ps.setString(4,ssn);
		
		int status=ps.executeUpdate();
		System.out.println(status);


	 Connection con1=GetCon.getCon();
	PreparedStatement ps1;

	ps1 = con.prepareStatement("Insert into branch values(?,?)");
		
		ps1.setInt(1,brno1);
		ps1.setString(2,bid);
		
		int status1=ps1.executeUpdate();
		System.out.println(status1);
			
    Connection con2=GetCon.getCon();
	PreparedStatement ps2;

	ps2 = con2.prepareStatement("Insert into new_account values(?,?,?)");
		
		ps2.setInt(1,accno1);
		ps2.setString(2,acctype);
		ps2.setInt(3,amount1);
		
		int status2=ps2.executeUpdate();
		System.out.println(status2);
			
   Connection con3=GetCon.getCon();
	PreparedStatement ps3;

	ps3 = con3.prepareStatement("Insert into creates values(?,?)");
		
		
		ps3.setString(1,ssn);
		ps3.setInt(2,accno1);
		
		int status3=ps3.executeUpdate();
		System.out.println(status3);

		Connection con4=GetCon.getCon();
	PreparedStatement ps4;

	ps4 = con4.prepareStatement("Insert into Account values(?,?,?,?,?,?,?,?,?,?)");
		
		
		Random r=new Random();

		ps4.setInt(1,accno1);
		ps4.setString(2,acctype); 
        ps4.setInt(3,r.nextInt(1234));
        ps4.setString(4,"F"); 
		ps4.setString(5,"N"); 
		ps4.setString(6,"Y"); 
        ps4.setString(7,"T"); 
		ps4.setString(8,acctype); 
		ps4.setString(9,"T");
		ps4.setString(10,loc); 

		int status4=ps4.executeUpdate();
		System.out.println(status4);


              out.print("<table align='left'  cellspacing='5' cellpadding='5'>");
			out.print("<tr><th>ACCOUNT CREATED SUCCESSFULLY</th></tr>");
			
			out.print("</table>");
			session.setAttribute("ssn",ssn);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
   
   
   <td width="299" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1><br>
    	    <center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center><br>
		    <p>Each people plan their site layouts depending upon their business type. Here comes a free designer template which provides you with a selection of different kinds of webdesign   starting from business template, fashion template, media template, Science template, Arts template and much more.</p>
	    	
	    </div>      
    </td>
             	
    
</tr></table>
    
<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
  <div id="footer_copyright" >
 
    	    <center><img  alt="business"  width="196" height="106"></center><br>
		    <p>Each people plan their site layouts depending upon their business type. Here comes a free designer template which provides you with a selection of different kinds of webdesign   starting from business template, fashion template, media template, Science template, Arts template and much more.</p>
	  
  Copyright © Your Company Name</div>
</div>

<script type="text/javascript">
document.onload = ctck();
</script>
</div>

</body>
</html>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>
<%@ page import="java.util.*" %>
