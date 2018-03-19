
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.name {
	font-weight: bold;
	font-size: 36px;
}
.gnrl {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.center1 {
	text-align: center;
}
.center1 table {
	font-family: Arial, Helvetica, sans-serif;
	font-size: x-large;
	font-weight: bold;
}
normal {
	font-weight: normal;
}
normal {
	font-weight: normal;
}
normal {
	font-weight: normal;
}
normal {
	font-family: Arial, Helvetica, sans-serif;
}
.right {
	text-align: right;
}
.norm {
	font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>

<body>
<table width="993" height="102" border="0">
  <tr>
    <td width="251" height="96"><img src="Costco_Logo-1.png" width="251" height="88" alt="Logo" /></td>
    <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="index.jsp">Home</a> |
      <% if(session.getAttribute("uname")==null) {
			%>
      <a href="login.jsp">Employee Login</a>
      <%} else {
				%>
      <a href="logout.jsp">Logout</a>
	  <a href="buy.jsp">Buy any product</a>
      <%}%></td>
  </tr>
</table>
<hr />
<p>
  <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
  <%
		PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdai11","dai2995062");
      if (conn != null) {
             
            }
			else{
				out.println("Connection failure");
			}
	     String pid=request.getParameter("product");
         Statement st=conn.createStatement();
		 String id1=null,filename1=null,prod_size=null,prod_cat=null,prod_info=null, prod_type=null, price = null, image;
		 ps=conn.prepareStatement("select * from Product where Prod_id =?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
			 id1=rs.getString("Prod_id");
			 filename1= rs.getString("Prod_name");
			 price = rs.getString("Price");
			 prod_size = rs.getString("Prod_size");
			 prod_cat = rs.getString("Prod_cat");
			 prod_info = rs.getString("Prod_info");
			 image = rs.getString("image");
		 %>
<p class="name"><%= filename1%> </p>
         <%
		
		 
		 %>
</p>
<table width="997" height="399" border="0">
  <tr>
    <td width="358" class="center1"><img src=<%= image%> width="200" height="300" alt=hname/></td>
   
    <td width="623" class="center1"><table width="466" height="200" border="0">
      <tr>
        <td width="179" class="center1">Category</td>
        <td width="277" class="normal"><%=prod_cat%></td>
      </tr>
      <tr>
        <td class="center1"> Product Quantity</td>
        <td><%= prod_size%></td>
      </tr>
      <tr>
        <td class="center1">Price :</td>
        <td><%= price%></td>
      </tr>
    </table>
    <p>
    <form action="cartAdd.jsp"> 
<input type="hidden" name="name" value=<%=pid%>>
<input type="number" name="qty" value="1">
<input type="image" src="http://graphiccave.com/wp-content/uploads/2015/04/CTA-Add-to-Cart-Button-PNG-Graphic-Cave.png" width="150" height="100"name="buy" value="grand"> 
</form></p></td>
  </tr>
</table>
<p class="gnrl">Information</p>

         <table width="630" border="1" cellspacing="0">
  <tr>
    <td width="127" class="norm">Category</td>
    <td width="493"><%= prod_cat%></td>
  </tr>
  <tr>
    <td class="norm">Info</td>
    <td><%= prod_info%></td>
  </tr>
  <tr>
</table>
<p class="gnrl">
 <p class="gnrl">


<%}%>
</body>
</html>