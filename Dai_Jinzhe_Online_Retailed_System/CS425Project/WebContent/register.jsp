<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Document</title>
<style type="text/css">
.right {	text-align: right;
}
</style>
</head>

<body>
 <center>
   <table width="993" height="102" border="0">
     <tr>
       <td width="251" height="96"><img src="Costco_Logo-1.png" width="251" height="88" alt="Logo" /></td>
       <td width="726" class="right"><a href="contact.jsp">Contact us</a> | <a href="employeeview.jsp">Home</a> |
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
   <strong><em>Add Product</em></strong>
   <form action="reg.jsp"><table><b>
           <tr><td>Product_id</td><td><input type="text" name="Prod_id"></td></tr>
            <tr><td>Product_name</td><td><input type="text" name="Prod_name"></td></tr>
            <tr><td>Price</td><td><input type="number" name="Price"></td></tr>
            <tr><td>Product_size</td><td><input type="number" name="Prod_size"></td></tr>
            <tr><td>Product_cat</td><td><input type="text" name="Prod_cat"></td></tr>
            <tr><td>Product_info</td><td><textarea name="Prod_info"></textarea></td></tr>
			<tr><td>Product_image</td><td><textarea name="Prod_image"></textarea></td></tr>
                <br>
                </b></table><br />
     <input type="submit" value="Add" />
                    </form>
            <br><hr>
              Delete a Product <a href="deleteproduct.jsp">Click Here</a>
                <hr>
                
    </center>
</body>
</html>