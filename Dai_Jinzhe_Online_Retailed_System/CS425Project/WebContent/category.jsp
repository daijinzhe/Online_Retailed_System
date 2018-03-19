
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.right {
	text-align: right;
}
#form1 {
	text-align: center;
}
.normal {
	text-align: left;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}
.unormal {
	font-family: Arial, Helvetica, sans-serif;
}
.center1 {	text-align: center;
}
</style><!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager.*" %>
<table width="993" height="330" border="0">
  <tr>
    <td width="205" height="89"><img src="Costco_Logo-1.png" width="251" height="88" alt="Logo" />
    <hr /></td>
    <td width="772"><table width="723" height="88" border="0">
      <tr>
        <td width="713" class="right">24X7 Customer Support - Contact us  | Home | 
        <% if(session.getAttribute("uname")==null) {
			%>
            <a href="login.jsp">Login</a> | <a href="userregister.jsp"></a>
            <%} else {
				%>
                <a href="logout.jsp">Logout</a>
				<a href="buy.jsp">View cart</a>
                <%}%>
                </td>
      </tr>
      <tr>
        <td><form id="form1" name="form1" method="post" action="search.jsp">
          <input name="search" type="text" id="search" size="60" />
          <label>
            <input type="submit" name="submit" id="button" value="Search" />
          </label>
        </form></td>
      </tr>
    </table>
    <hr /></td>
  </tr>
  <h4>Welcome <%=session.getAttribute("uname")%>  <%=session.getAttribute("userid")%>!!</h4>
  <tr>
    <td><table width="251" height="482" border="0">
      <tr>
        <td height="184"><table width="242" height="171" border="0">
          <tr>
            <td class="normal">Filter By Categories</td>
          </tr>
		  
		   <%
	   PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdai11","dai2995062");
      if (conn != null) {
             
            }
			else{
				out.println("Error");
			}
			
         Statement st=conn.createStatement();
		 String sql="select distinct Prod_cat from product";
	     String Category = null;
try {  
ps = conn.prepareStatement (sql); 
rs = ps.executeQuery (); 
while(rs.next())
{
Category =rs.getString("Prod_cat");

%>
         
          <tr>
            <td><form action="category.jsp">
            <input type="hidden" name="category" value=<%= Category %>><input type="submit" value=<%= Category %>></form></td>
          </tr>
<%
}
%>
<tr>
            <td><form action="category.jsp">
           <input type="hidden" name="category" value=<%= Category %>><input type="submit" value="All"></form></td>
          </tr>


<%
}
catch(Exception e)
{
out.print(e);
}
%>   
        </table></td>
      </tr>
  
      
    </table></td>
	
    <td>
	<table width="725" height="684" border="0">
    <tr class="normal">
     
		   <%
	     String category = request.getParameter ("category");
		 if( category == "All" ){
	     sql="select * from product";
		 ps = conn.prepareStatement (sql); 
		 }
	     else{
		sql="select * from product where Prod_cat=?";
		ps = conn.prepareStatement (sql); 
		ps.setString(1,category);
}
rs = ps.executeQuery (); 
		 
String id1=null,filename1=null,prod_size=null,prod_cat=null,prod_info=null, prod_type=null, price = null, image;
while(rs.next())
{
id1=rs.getString("Prod_id");
filename1= rs.getString("Prod_name");
price = rs.getString("Price");
prod_size = rs.getString("Prod_size");
prod_cat = rs.getString("Prod_cat");
prod_info = rs.getString("Prod_info");
image = rs.getString("image");
%>
            <td width="228"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
<input type="hidden" name="product" value= <%= id1 %> > 
<input name="buy" type="image" value="grand" src=<%= image %> width="165" height="165"> 
</form></td>
              </tr>
            </table>
              <p class="center1"><%= filename1 %></p>
              <p class="center1">Price: $<%= price %></p>
			</td>
 <%
}


%>          
          </tr>
        </table></td>
      </tr>
    </table>
 </body>
</html>
