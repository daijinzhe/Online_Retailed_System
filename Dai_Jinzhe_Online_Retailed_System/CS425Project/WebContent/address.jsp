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
        String s=request.getParameter("customers_id");
     
        String s2=request.getParameter("Street");
        String s3=request.getParameter("street_no");
        String s4=request.getParameter("city");
		String s5=request.getParameter("Address_state");
		String s6=request.getParameter("zipcode");
		PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdai11","dai2995062");
      if (conn != null) {
             out.println("");
            }
			else{
				out.println("Error in Connection");
			}
      
         Statement st=conn.createStatement();
            ps= conn.prepareStatement("insert into Address values (?,?,?,?,?,?)");
            ps.setString(1,s);
   
            ps.setString(2,s2);
            ps.setString(3,s3);
            ps.setString(4,s4);
           ps.setString(5,s5);
		   ps.setString(6,s6);
		   int insertResult = ps.executeUpdate();
             if (insertResult!=0)
            {
                 out.println("Successfully Added");
				  
            } 
			else
		    {
				out.println("Can't be added");
			}
           ps.close (); 
		   conn.close ();
			
        %>
        <br><hr>
              Successfully Added <a href="index.jsp">go back to main page</a> to checkout.
                <hr>
</body>
</html>