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
    <h2>ExtraOrdinary Service</h2>
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
%>
<table><%

try {

	       String uname=request.getParameter("username");
           String pwd=request.getParameter("password");
		    Connection con1=GetCon.getCon();
			session.setAttribute("uname",uname);

			PreparedStatement ps1=con1.prepareStatement("Select *  from customer where userid='"+uname+"' and password='"+pwd+"'");
              ResultSet rs=ps1.executeQuery();
			  if(rs.next()){
			       response.sendRedirect("createacc.jsp");
				   session.setAttribute("ssn",rs.getString(5));
			  }else{

			    	out.print("<table align='left'  cellspacing='5' cellpadding='5'>");
			out.print("<tr><th>INVALID USERNAME/PASSWORD</th></tr>");
		 
				
			  }
           
		} catch (SQLException e) {
			e.printStackTrace();
		}
   
			%></table><%
%>
    	
    	
		</table>



<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>