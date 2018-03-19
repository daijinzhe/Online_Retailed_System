<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
@import url("italics.css");

.right {
	text-align: right;
}
</style>
</head>

<body>
	<%@ page language="java"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.sql.DriverManager.*"%>
	<table width="993" height="102" border="0">
		<tr>
			<td width="251" height="96"><img src="Costco_Logo-1.png"
				width="251" height="88" alt="Logo" /></td>
			<td width="726" class="right">24X7 Customer Support - <a
				href="contact.jsp">Contact us</a> | <a href="index.jsp">Home</a> |
		</tr>
	</table>
	<hr />
	<p class="italics">Search Results:</p>
	<p>
		<% 
       PreparedStatement ps;
       Connection con;
       ResultSet rs= null,rs1=null,rs2=null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
       con=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdai11","dai2995062");
			
      
        Statement st=con.createStatement();
		%>
		<% 
			boolean flag = false; 
			String search = request.getParameter ("search");  
		%>
		<% 
			String pid=null; 
			search="%"+search+"%";
			try{  
				ps = con.prepareStatement ("select * from product where prod_name like ?"); 
				ps.setString (1,search); 
				rs = ps.executeQuery (); 
				if (rs.next()) {
				    flag = true;
		%>
		<p>
			<table width="992" height="179" border="0">
				<%do {%>
					<tr>
						<td width="185" height="173" class="center1"></td>
						<td>Id:<%= rs.getString("prod_id") %></td>	
						<td>Name:<%= rs.getString("prod_name") %></td>
						<td>Price:<%= rs.getDouble("price") %></td>
						<td>Size:<%= rs.getString("prod_size") %></td>
						<td>category:<%= rs.getString("prod_cat") %></td>
					
						<td>Info:<%= rs.getString("prod_info") %></td>
						<td>Type:<%= rs.getString("prod_type") %></td>
				<%}while(rs.next());%>
					</tr>
			</table>
			
			<br/>
			
			<a href="<%="checkout.html" %>">Click to Buy the products of your choice!!! </a>
			<br/>
			<br/>
			<a href="<%="addcard.jsp" %>">Update new credit card for transaction </a>
			<br/>
			<br/>
			
				<a href="<%="addaddress.jsp" %>">Update your new address where you want to ship</a>
				<br/>
				<br/>
				<a href="<%="deladdress.jsp" %>">Click to delete your old address!!! </a>
				</br>
				<br/>
				<a href="<%="delcard.jsp" %>">Click to delete your old creditcard!!! </a>
				
				
		</p>
			<%} else { 
		%>
			<jsp:forward page="searchfailure.jsp" />
			<%} %>
				
			<%} catch (Exception e) { 
			out.println (e); 
			} %>
		</p>
</body>
</html>