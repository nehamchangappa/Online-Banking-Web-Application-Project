<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Global Banking ..</title>
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
  <li><a href="create1.html">NEW CUSTOMER</a></li>
    <li><a href="login.html">LOGIN</a></li>
    
    <li><a href="about.jsp">ABOUT US</a></li>
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


	 String username=request.getParameter("username");
     String password=request.getParameter("password");
	 String ctype=request.getParameter("ctype");
     String name=request.getParameter("name");
	 String age1=request.getParameter("age");
     String add=request.getParameter("add");
	 String phone1=request.getParameter("phone");
     String mail=request.getParameter("mail");

	 int age=Integer.parseInt(age1);
     int phone=Integer.parseInt(phone1);
		   Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		
		ps = con.prepareStatement("Insert into customer values(?,?,?,?,?,?,?,?,?)");
		String	nextvalue1=SessionIdentifierGenerator.genNextValue();
		ps.setString(1,username);
		ps.setString(2,password);
		ps.setString(3,ctype);
		ps.setString(4,name);
		ps.setString(5,nextvalue1);
		ps.setInt(6,age);
		ps.setString(7,add);
		ps.setInt(8,phone);
		ps.setString(9,mail);
		
		int status=ps.executeUpdate();
		System.out.println(status);
	
			out.print("<table align='left'  cellspacing='5' cellpadding='5'>");
			out.print("<tr><th>CUSTOMER REGISTERED SUCCESSFULLY</th></tr>");
			
			out.print("</table>");
			session.setAttribute("ssn",nextvalue1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
   
			%>



<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>