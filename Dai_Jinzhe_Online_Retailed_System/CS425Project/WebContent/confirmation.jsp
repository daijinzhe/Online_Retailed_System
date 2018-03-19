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
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager.*" %>
 <center>
   <table width="993" height="102" border="0">
     <tr>
       <td width="251" height="96"><img src="Costco_Logo-1.png" width="251" height="88" alt="Logo" /></td>
      
     </tr>
   </table>
   <hr />
   <br>
   <strong><em>Confirm Details and Checkout</em></strong>
   <form action="checkoutsuccess.jsp">
   <table cellspacing="10" class="table-fill" border="1">
           <tr><td>Customer_Id</td><td><%=session.getAttribute("userid")%></td></tr>
            <tr><td>Customer_name</td><td><%=session.getAttribute("uname")%></td></tr>
            <tr><td>Total Order Price </td><td><%=session.getAttribute("totalPrice")%></td></tr>
			<tr><td>Select Address</td><td><select name="address">
 <%
	   String custID = (String) session.getAttribute("userid"); 
	   int count=0;
	   PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdaill","dai2995062");
      if (conn != null) {
             
            }
			else{
				out.println("Error in Connection");
			}
			
         Statement st=conn.createStatement();
		 String sql="select * from address where Customers_id =?";
		 String AddressName=null;
try {  
ps = conn.prepareStatement (sql); 
ps.setString(1,custID);
rs = ps.executeQuery (); 
while(rs.next())
{
AddressName = rs.getString("Address_name");
%>
<option value= <%= AddressName %> > <%= AddressName %> </option>

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


  
</select></td></tr>
			<tr><td>Select card</td><td><select name="cardnumber">
 <%
	   custID = (String) session.getAttribute("userid"); 
	   count=0;
	   PreparedStatement ps2;
        Connection conn2;
        ResultSet rs2= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn2=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdai11","dai2995062");
      if (conn2 != null) {
             
            }
			else{
				out.println("Error in Connection");
			}
			
         Statement st2=conn2.createStatement();
		 String sql2="select * from cards where Customers_id =?";
		 String cardnumber=null;
try {  
ps2 = conn2.prepareStatement (sql2); 
ps2.setString(1,custID);
rs2 = ps2.executeQuery (); 
while(rs.next())
{
cardnumber = rs2.getString("Card_no");
count= count+1;
%>
<option value= <%= cardnumber %> > <%= cardnumber %> </option>

<%
}
rs2.close (); 
ps2.close (); 
conn2.close ();
}
catch(Exception e)
{
out.print(e);
}

%>


  
</select></td></tr>
			 <br>
                </b></table><br />
     <input type="submit" value="Check out" />
                    </form>
  <p>Click <a href="addaddress.jsp">here</a> to add new Address.
   </p>           
    <p>Click <a href="addcard.jsp">here</a> to add new Card.
   </p>                       
    </center>
</body>
</html>