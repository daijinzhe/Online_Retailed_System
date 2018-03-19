<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Log in</title>
<style type="text/css">
.right {	text-align: right;
}
</style>
<link href="italics.css" rel="stylesheet" type="text/css" />
</head>

<body background="login1.jpg">



  <table width="993" height="102" border="0">
    <tr>
      <td width="251" height="96"><img src="Costco_Logo-1.png" width="251" height="88" alt="Logo" /></td>
      <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="index.jsp">Home</a> |
    </tr>
  </table>
  <hr />
  <p>&nbsp;</p>
  <center> 
  <form action="main.jsp" method="post">
  <table width="1"> 
  <tr> 
<td colspan="2" class="italics"> Customer Login Page! </td> 
</Tr> 
<tr> 
<td> Cust_name </td> 
<td> <input type="text" name="id"> </td> 
</Tr> 
<tr> 
<td> Password </td> 
<td> <input type="password" name="password"> </td> 
</Tr> 
<tr> 
<td> <input type="submit" value="Log In"> </td> 
<td><input type="reset" value="Clear"> </td> 
</Tr> 
</Table>
  <p>&nbsp;</p>
  <p>&nbsp;</p> 
</form> 

</Center>
</body>
</html>