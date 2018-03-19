<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

 <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
<% 
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        conn=DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl", "jdai11","dai2995062");
      if (conn != null) {
             out.println("Connected with connection");
            }
			else{
				out.println("Not Connected with connection");
			}
			
         Statement st=conn.createStatement();
%> 
<% 
boolean flag = false; 

String name = request.getParameter ("id"); 
String password = request.getParameter ("password"); 
%>

<% 
 
String sql = "SELECT Employee_name from Employee where Employee_name=? And Employee_id =?"; 
try {  
ps = conn.prepareStatement (sql); 
ps.setString (1,name); 
ps.setString (2,password); 
rs = ps.executeQuery (); 
if (rs.next ()) { 
out.println (rs.getString ("Employee_name")); 
flag = true; 
session.setAttribute("uname", rs.getString ("Employee_name")); 
response.sendRedirect("employeeview.jsp");
} else { 
request.setAttribute("err", "User name or password error"); 
response.sendRedirect("loginfail.jsp");
}

rs.close (); 
ps.close (); 
conn.close ();

} catch (Exception e) { 
out.println (e); 
} 
%>


<% 

if (flag) { 
%>


<%

} 
else { 

%>
<% 
} 
%>
</body>
</html>