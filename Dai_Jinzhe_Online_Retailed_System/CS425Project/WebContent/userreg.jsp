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
        String s=request.getParameter("customers_id");
        String sa=request.getParameter("customers_name");
        String sb=request.getParameter("Mail_id");
        String sc=request.getParameter("card_no");
        String sd=request.getParameter("cardholder_name");
		String se=request.getParameter("Expirydate");
		String sf=request.getParameter("CVV");
		String sg=request.getParameter("Address_name");
		String sh=request.getParameter("Street");
		String si=request.getParameter("street_no");
		String sk=request.getParameter("city");
		String sl=request.getParameter("Address_state");
		String sm=request.getParameter("zipcode");
		String sn=request.getParameter("password");

        PreparedStatement ps;
		PreparedStatement ps2;
		PreparedStatement ps3;
        Connection conn;
        ResultSet rs= null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdai11","dai2995062");
      if (conn != null) {
             out.println("");
            }
			else{
				out.println("error connecting");
			}
      
         Statement st=conn.createStatement();
            ps= conn.prepareStatement("insert into Customers(customers_id,customers_name,mail_id,password) values (?,?,?,?)");
            ps.setString(1,s);
            ps.setString(2,sa);
            ps.setString(3,sb);
            ps.setString(4,sn);
            
		   
           int insertResult = ps.executeUpdate();
             if (insertResult!=0)
            {
                 out.println("Successfully Added.  "+" Welcome "+ "   "+ sa);

            } 

           ps.close (); 
 
           ps2= conn.prepareStatement("insert into Cards(card_no,customers_id,cardholder_name,expirydate,cvv) values (?,?,?,?,?)");
           ps2.setString(1,sc);
           ps2.setString(2,s);
           ps2.setString(3,sd);
           ps2.setString(4,se);
           ps2.setString(5,sf);
            
          int insertResult1 = ps2.executeUpdate();
            if (insertResult1!=0)
           {
                out.println();

           } 

          ps2.close ();
         
          ps3= conn.prepareStatement("insert into Address values (?,?,?,?,?,?)");
          ps3.setString(1,s);
          ps3.setString(2,sh);
          ps3.setString(3,si);
          ps3.setString(4,sk);
          ps3.setString(5,sl);
          ps3.setString(6,sm);
          
           
         int insertResult2 = ps3.executeUpdate();
           if (insertResult1!=0)
          {
               out.println();

          } 

         ps3.close ();
          
         conn.close ();
			
        %>
        <br><hr>
               To View Products <a href="main.jsp">Click Here</a>
                <hr>
</body>
</html>