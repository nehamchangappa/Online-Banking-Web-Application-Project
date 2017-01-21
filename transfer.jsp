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
		
		String num1=request.getParameter("taccountno");
		int taccountno=Integer.parseInt(num1);
		
		String amoun=request.getParameter("amount");
		int accoun=Integer.parseInt(amoun);
		//accountno=taccountno;
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
	
	   try {
		if(status==true){
			out.print("Welcome    " + username);
		    %>
			<% 
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEW_ACCOUNT where account_no='"+taccountno+"'");
			
            //ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			int dataamount=0;
			
			if(rs.next()){
			dataamount=accoun+rs.getInt(3); 
			
			}
			Connection con7=GetCon.getCon();
			
			PreparedStatement ps7=con7.prepareStatement("update NEW_ACCOUNT set NEW_DEPOSITS=? where account_no='"+taccountno+"'");
			ps7.setInt(1,dataamount);
			ps7.executeUpdate();
			ResultSet rs7=ps7.executeQuery();
		
			if(rs7.next()){}
			System.out.println("data amonut"+dataamount);
			request.setAttribute("target account A ",dataamount);
			Connection con8=GetCon.getCon();
			PreparedStatement ps8=con8.prepareStatement("Select * from NEW_ACCOUNT where account_no=?");
			
            ps8.setInt(1,accountno);
			ResultSet rs8=ps8.executeQuery();
			
			int dataamount1=0;
			if(rs8.next()){
			dataamount1=rs2.getInt(3)-accoun; 
			System.out.println(dataamount1);
			}
			Connection con3=GetCon.getCon();
			
			PreparedStatement ps3=con3.prepareStatement("update NEW_ACCOUNT set NEW_DEPOSITS=? where account_no='"+accountno+"'");
			ps3.setInt(1,dataamount1);
			ps3.executeUpdate();
			ResultSet rs3=ps3.executeQuery();
			
			if(rs3.next()){
		
			request.setAttribute("target account A",dataamount);
			request.setAttribute("account B",dataamount1);	
			%>
			<jsp:forward page="tbalance.jsp"></jsp:forward> 
			<% 
		
			}
			//out.print("your balance has increase");
			//request.setAttribute("totaldataamount",dataamount);
			//request.setAttribute("balance","your balance has decrease");	
		
			//}
			
			//out.print("your balance has increase");
			//request.setAttribute("totaldataamount",dataamount);
			//request.setAttribute("balance","your balance has increase");	
			//}
		
			/*out.print("<table align='left' width='50%' border='4' bgcolor='###FFF'>");
			out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
			while(rs.next()){
			    int accountno1=rs.getInt(1);
				session.setAttribute("accountno",accountno1);
				
				System.out.print(accountno);
				
				out.print("<tr>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getInt(5) + "</td>");
				out.print("<td>" + rs.getString(6) + "</td>");
				out.print("<td>" + rs.getInt(7) + "</td>");
				//out.print("<td><a href='DeleteServlet' >Delete</a></td>");
			
				out.print("</tr>");
			
			}
			out.print("</table>");
			
			
			*/
		}
		else{
			out.print("Please check your username and Password and target accountno");
			request.setAttribute("balance","Please check your username and Password and target acountno");
			%>
			<jsp:forward page="transfer1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
		
			%></table><%
%>
    	
    	
		 </table>


<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>


   
