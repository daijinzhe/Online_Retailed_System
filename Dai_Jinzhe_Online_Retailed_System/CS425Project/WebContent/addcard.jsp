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
</head>

<body>
 <center>
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
   <strong><em>Add card here</em></strong>
   <form action="cardadded.jsp"><table><b>
           <tr><td>Cust_ID</td><td><textarea name="customers_id"></textarea></td></tr>
           <tr><td>card_no</td><td><input type="number" name="card_no"></td></tr>
            <tr><td>cardholder_name</td><td><textarea name="cardholder_name"></textarea></td></tr>
			<tr><td>Expiry date</td><td><textarea name="Expirydate"></textarea></td></tr>
			<tr><td>CVV</td><td><textarea name="CVV"></textarea></td></tr>
                <br>
                </b></table><br />
     <input type="submit" value="Add" />
                    </form>
            <br><hr>
                
    </center>
</body>
</html>