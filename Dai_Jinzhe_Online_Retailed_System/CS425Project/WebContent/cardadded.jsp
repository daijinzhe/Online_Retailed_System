<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>REG</title>
<style type="text/css">
.right {text-align: right;
}
</style>
</head>

<body>
 <%@ page language="java" %>
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
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
       
<%
        String m=null, mn=null;
       
        
        PreparedStatement ps2;
        Connection conn2;
		String s=request.getParameter("card_no");
		
        String s3=request.getParameter("cardholder_name");
        String s4=request.getParameter("Expirydate");
		String s5=request.getParameter("CVV");
		String s6=request.getParameter("customers_id");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn2=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdai11","dai2995062");
      if (conn2 != null) {
             out.println("");
            }
			else{
				out.println("Error in connection");
			}
      
         Statement st=conn2.createStatement();
            ps2= conn2.prepareStatement("insert into Cards(card_no,cardholder_name,expirydate,cvv,customers_id) values (?,?,?,?,?)");
           
            ps2.setString(1,s);
          
            
            ps2.setString(2,s3);
            ps2.setString(3,s4);
            ps2.setString(4,s5);
            ps2.setString(5,s6);
            
           
               int insertResult = ps2.executeUpdate();
             if (insertResult!=0)
            {
                 out.println("Successfully Added");
				  
            } 
			else
		    {
				out.println("Can't be added");
			}
           ps2.close (); 
		   conn2.close ();
			
        %>
        <br><hr>
              Successfully Added <a href="index.jsp">go back</a> to checkout.
                <hr>
</body>
</html>