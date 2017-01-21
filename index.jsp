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
    <li><a href="create.html">NEW ACCOUNT</a></li>
    <li><a href="balance1.jsp">BALANCE</a></li>
    <li><a href="deposit1.jsp">DEPOSIT</a></li>
    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
    <li><a href="transfer1.jsp">TRANSFER</a></li>
    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
    <li><a href="about.jsp">Contact Us</a></li>
    </ul>
</div>



<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <ul>
        	<li><a href="#">www.RBI.com</a></li>
            <li><a href="#">www.sbh.com </a></li>
            <li><a href="#">www.sbi.com/forum.jsp</a></li>
            </ul>
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    	
    	<% 
%>
<table><%

try {
		    
		   String username=(String)session.getAttribute("name");
				
				System.out.print(username);
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from customer where name='"+username+"'");
           // ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			
			out.print("<table align='left'  cellspacing='5' cellpadding='5'>");
			//out.print("<tr><th>NAME</th><th>ACC TYPE</th><th>SSN</th><th>CONTACT NO</th><th>EMAIL</th>");
			out.print("<tr><th>CUSTOMER REGISTERED SUCCESSFULLY</th>");
			while(rs.next()){
				
				
				out.print("<tr>");
				
				out.print("<td>" + rs.getString(4) + "</td>");
				out.print("<td>" + rs.getString(3) + "</td>");
				out.print("<td>" + rs.getInt(5) + "</td>");
				
				out.print("<td>" + rs.getString(8) + "</td>");
				out.print("<td>" + rs.getLong(9) + "</td>");
				
				
				//out.print("<td><a href='DeleteServlet' >Delete</a></td>");
			    
				out.print("</tr>");
			    
			}
			out.print("</table>");
			
			/*out.print("<table align='right'width='40%'>");
			out.print("<tr><td><a href='Compose.html'>COMPOSE</a></td></tr>");
			out.print("<tr><td><a href='InboxServlet'>INBOX</a></td></tr>");
			out.print("<tr><td><a href='LogoutServlet'>LOGOUT</a></td></tr>");
			//out.print("<tr><td><a href='DeleteServlet'>Delete</a></td></tr>");
			
			out.print("</table>");*/
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
