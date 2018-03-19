<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.right {	text-align: right;
}
</style>
<link href="italics.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@ page language="java" %>
    <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
         
<table width="993" height="102" border="0">
  <tr>
    <td width="251" height="96"><img src="Costco_Logo-1.png" width="251" height="88" alt="Logo" /></td>
    <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="index.jsp">Home</a> |
      <% if(session.getAttribute("uname")==null) {
			%>
      <a href="login.jsp">Login</a>
      <%} else {
				%>
      <a href="logout.jsp">Logout</a>
      <%}%></td>
  </tr>
</table>
<hr />
<br />
<p>
<h3> Please check your products once again !</h3></p>
<table cellspacing="5" class="table-fill" border="1">
      <thead align="center">
      <tr align="center">
	  <th width=""   class="text-center">Product_ID</th>
	  <th width=""  class="text-center">Product_NAME</th>
	  <th width=""  class="text-center">Product_Price</th>
	  <th width=""  class="text-center">Product_Quantity</th>
	  <th width=""  class="text-center">Total_Price</th>
	  </tr></thead>
<%
 
 //String uid=(String)session.getAttribute("userid"); 

		 String sql="select * from cart where cart_id=?";
		 int orderprice =0;
		 PreparedStatement ps;
		 PreparedStatement ps2;
        Connection conn;
        ResultSet rs= null;
		ResultSet rs2= null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdaill","dai2995062");
      if (conn != null) {
             out.println("");
            }
			else{
				out.println("Connection error");
			}
      
         Statement st=conn.createStatement();
		 
try {  
ps = conn.prepareStatement (sql); 
ps.setString(1,uid);
rs = ps.executeQuery ();
 
while(rs.next())
{
		String sql2="select * from product where Prod_id=?";
		 String id1=null,filename1=null,prod_size=null,prod_cat=null,prod_info=null, prod_type=null;
		 int price = 0, ttlprice=0;
try { 
  Connection conn2;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn2=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdai11","dai2995062"); 
		Statement st2=conn2.createStatement();
		ps2 = conn.prepareStatement (sql2); 
		ps2.setString(1,rs.getString("Prod_id"));
		rs2 = ps2.executeQuery (); 
while(rs2.next())
{
id1=rs2.getString("Prod_id");
filename1= rs2.getString("Prod_name");
price = Integer.parseInt(rs2.getString("Price"));
prod_size = rs.getString("quantity");
prod_cat = rs2.getString("Prod_cat");
prod_info = rs2.getString("Prod_info");
ttlprice= Integer.parseInt(rs.getString("quantity")) * price;
orderprice = orderprice + ttlprice;

 %>
	 
</p>
<tbody class="table-hover">
<tr align="center">
<td class="text-center"><%= id1 %></td>
<td class="text-center"><%= filename1 %></td>
<td class="text-center"><%= price %></td>
<td class="text-center"><%= prod_size %></td>
<td class="text-center"><%= ttlprice %></td>
</tr>
</tbody>

<%
}
session.setAttribute("totalPrice",orderprice); 
rs2.close (); 
ps2.close (); 
}
catch(Exception e)
{
out.print(e);
}
}
%>
</table>

<h3> Total Order Price </h3>
<p> Your Total Oder Price is : <%= orderprice %><br />
<p>Click <a href="confirmation.jsp">here</a> to confirm your order and successfully checkout.
   </p>
<%
rs.close (); 
ps.close (); 
conn.close ();
}
catch(Exception e)
{
out.print(e);
}
%>


  <hr />
<br />
<h3> Continue Shopping </h3>
Hello <%=session.getAttribute("uname")%> !,
 <p>Click <a href="main.jsp">here</a> to add new product to product list.
   </p>

    <hr />
<br />
<h3> Update cart </h3>
 <form action="deleteproductfromcart.jsp">
Hello <%=session.getAttribute("uname")%> !,
 <p>Enter ProductID  to remove specific product from product list.</p><input type="text" name="Prod_id">
  <input type="submit" value="Delete" />
</form>

</body>
</html>