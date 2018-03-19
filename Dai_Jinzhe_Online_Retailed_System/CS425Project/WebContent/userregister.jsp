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
      
     </tr>
   </table>
   <hr />
 
   <h1>Enter your details for registration</h1>
   <form action="userreg.jsp"><table><b></b>
           <tr><td>Cust_Id </td><td><input type="text" name="customers_id"></td></tr>
            <tr><td>Name</td><td><input type="text" name="customers_name"></td></tr>
            <tr><td>Email</td><td><input type="text" name="Mail_id"></td></tr>
			<hr />	
            <tr><td>Card_no</td><td><input type="number" name="card_no"></td></tr>
            <tr><td>Cardholder_name</td><td><textarea name="cardholder_name"></textarea></td></tr>
			<tr><td>Expiry date</td><td><textarea name="Expirydate"></textarea></td></tr>
			<tr><td>Cvv</td><td><textarea name="CVV"></textarea></td></tr>
			<hr />
			<tr><td>Address Name/Type</td><td><textarea name="Address_name"></textarea></td></tr>
			<tr><td>Street</td><td><textarea name="Street"></textarea></td></tr>
			<tr><td>Street Number</td><td><textarea name="street_no"></textarea></td></tr>
			<tr><td>City</td><td><textarea name="city"></textarea></td></tr>
			<tr><td>State</td><td><textarea name="Address_state"></textarea></td></tr>
			<tr><td>Zip Code</td><td><textarea name="zipcode"></textarea></td></tr>
			<tr><td>Password </td><td><input type="password" name="password"></td></tr>
                </table></b>
     <input type="submit" value="Register" />
                    </form>
            <br><hr>
              To Login <a href="custlogin.jsp">Click Here</a>
                <hr>
                
    </center>
</body>
</html>