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
</td>
     </tr>
   </table>
   <hr />
   <strong><em>Add Address here</em></strong>
   <form action="address.jsp">
	<table>
		<thead></thead>
		<tbody>
			<tr>
	       		<td>Cust_ID</td>
	       		<td><textarea name="customers_id"></textarea></td>
	       	</tr>
	       	<tr>
	       		<td>Address Name/Type</td>
	       		<td><textarea name="Address_name"></textarea></td>
	       	</tr>
			<tr>
				<td>Street</td>
				<td><textarea name="Street"></textarea></td>
			</tr>
			<tr>
				<td>Stree No</td>
				<td><textarea name="street_no"></textarea></td>
			</tr>
			<tr>
				<td>City</td>
				<td><textarea name="city"></textarea></td>
			</tr>
			<tr>
				<td>State</td>
				<td><textarea name="Address_state"></textarea></td>
			</tr>
			<tr>
				<td>Zip Code</td>
				<td><textarea name="zipcode"></textarea></td>
			</tr>
		</tbody>
	 </table><br />
	 <input type="submit" value="Add" />
    </form>
  </center>
</body>
</html>