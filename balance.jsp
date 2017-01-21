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
%>
<table><%
boolean status=false;
     String num=request.getParameter("accountno");
		int accountno=Integer.parseInt(num);
        String username=request.getParameter("username");
		String password=request.getParameter("password");
		String ssn=(String)session.getAttribute("ssn");
		Connection con1=GetCon.getCon();
	   PreparedStatement ps1=con1.prepareStatement("Select *  from customer where userid='"+username+"' and password='"+password+"' and ssn='"+ssn+"'");
       ResultSet rs1=ps1.executeQuery();
		Connection con2=GetCon.getCon();
	   PreparedStatement ps2=con2.prepareStatement("Select *  from new_account where account_no="+accountno+"");
       ResultSet rs2=ps2.executeQuery();
		if(rs1.next()&&rs2.next()){
		status=true;
		}
		
		//if(status==true){
		//	out.print("Welcome    " + username);
		try {
		if(status==true){
			out.print("Welcome    " + username);
		
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEW_ACCOUNT where account_no=?");
            ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			
			out.print("<table align='left' cellspacing='5' cellpadding='5'>");
			out.print("<tr><th>USER ID</th><th>ACCOUNT NO</th><th>ACCOUNT TYPE</th><th>AMOUNT</th><th>SSN</th></tr>");
			while(rs.next()){
			    int accountno1=rs.getInt(1);
				session.setAttribute("accountno",accountno1);
				
				System.out.print(accountno);
				
				out.print("<tr>");
				out.print("<td>" +username+ "</td>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getInt(3) + "</td>");
				out.print("<td>" +ssn+ "</td>");
				
				out.print("</tr>");
			
			}
			out.print("</table>");
			
			Random r=new Random();
			int tid=r.nextInt(123456789);
			Connection con3=GetCon.getCon();
			PreparedStatement ps3=con3.prepareStatement("insert into transaction values(?)");
            ps3.setInt(1,tid);
			int status3=ps3.executeUpdate();
			System.out.println(status3);
		}
		else{
			out.print("Please check your username and Password");
			request.setAttribute("balance","Please check your username and Password");
			%>
			<jsp:forward page="balance1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
		//}
		
			//}
			%></table><%
%>
    	
    	
		</table>


<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>
<%@ page import="java.util.*"%>
  
