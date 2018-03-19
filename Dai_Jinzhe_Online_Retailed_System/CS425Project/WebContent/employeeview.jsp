
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

	

<body>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager.*" %>
<table width="993" height="102" border="0">
    <tr>
      <td width="251" height="96"><img src="Costco_Logo-1.png" width="251" height="88" alt="Logo" /></td>
      <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> 
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

	  <table cellspacing="2" class="table-fill" >
      <thead align="center">
      <tr align="center">
	  <th width=""   class="text-center">Product_ID</th>
	  <th width=""  class="text-center">Product_NAME</th>
	  <th width=""  class="text-center">Product_Price</th>
	  </tr></thead>
	  
 
	  <%
	   PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdai11","dai2995062");
      if (conn != null) {
             
            }
			else{
				out.println("Not Connected with connection");
			}
			
         Statement st=conn.createStatement();
		 String sql="select * from product";
		 String id1=null,filename1=null,prod_size=null,prod_cat=null,prod_info=null, prod_type=null, price = null;
try {  
ps = conn.prepareStatement (sql); 
rs = ps.executeQuery (); 
while(rs.next())
{
id1=rs.getString("Prod_id");
filename1= rs.getString("Prod_name");
price = rs.getString("Price");
prod_size = rs.getString("Prod_size");
prod_cat = rs.getString("Prod_cat");
prod_info = rs.getString("Prod_info");
%>
<tbody class="table-hover">
<tr align="center">
<td class="text-center"><%= id1 %></td>
<td class="text-center"><%= filename1 %></td>
<td class="text-center"><%= price %></td>
<td class="text-center"><%= prod_size %></td>
<td class="text-center"><%= prod_cat %></td>
<td class="text-center"><%= prod_info %></td>
</tr>
</tbody>
 
 
<%
}
rs.close (); 
ps.close (); 
conn.close ();
}
catch(Exception e)
{
out.print(e);
}

%>

</table>
  <hr />
<br />
<h3> Add Product </h3>
Hello Employee !!!
 <p>Click <a href="register.jsp">here</a> to add a new item.
   </p>

    <hr />
<br />
<h3> Deleting Product </h3>
 <form action="deleteproduct.jsp">
Hello Employee !! 
 <p>Please Enter product ID to remove from the database</p><input type="text" name="Prod_id">
  <input type="submit" value="Delete" />
</form>

</body>
</html>

