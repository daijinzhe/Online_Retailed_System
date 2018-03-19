<input name="buy" type="image" value="grand" src=<%= image %> width="165" height="165"> 


 <tr>
    <td><table width="251" height="482" border="0">
      <tr>
        <td height="184"><table width="242" height="171" border="0">
          <tr>
            <td class="normal">Filter by brands</td>
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
				out.println("Not Connected with connection");
			}
			
         Statement st=conn.createStatement();
		 String sql="select  Prod_cat from product";
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
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="cookingneeds" /><input type="submit" value="All"></form></td>
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
	  
		 sql="select * from Product";
		 String id1=null,filename1=null,prod_size=null,prod_cat=null,prod_info=null, prod_type=null, price = null, image;
try {  
ps = conn.prepareStatement (sql); 
rs = ps.executeQuery (); 
while(rs.next())
{
id1=rs.getString("Prod_id");
filename1= rs.getString("Prod_name");
price = rs.getString("Price");
prod_size = rs.getString("Prod_size");
prod_cat = rs.getString("Prod_cat");
prod_info = rs.getString("Prod_info");
//image = rs.getString("image");
%>
            <td width="228"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
<input type="hidden" name="product" value= <%= id1 %> > 

</form></td>
              </tr>
            </table>
              <p class="center1"><%= filename1 %></p>
              <p class="center1">Price: $<%= price %></p>
			</td>
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
          </tr>
        </table></td>
      </tr>
    </table>
    
    
    
    
--------------------------
 {%>
         <tr>
    <td width="185" height="173" class="center1">
    <% pid=rs.getString(1);
	ps=con.prepareStatement("select * from pics where pic_id=?");
		 ps.setString(1,pid);
		 rs1=ps.executeQuery();
		 while(rs1.next())
		 {
			 %>
    <table width="120" height="133" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
<input type="hidden" name="product" value=<%=rs1.getString("pic_id")%>> 
<input name="buy" type="image" value="Image" src=<%=rs1.getString(2)%> width="73" height="105"> 
</form></td>
              </tr>
              <%}%>
      </table>
            <%
            ps=con.prepareStatement("select * from product where prod_id=?");
		 ps.setString(1,pid);
		 rs2=ps.executeQuery();
		 while(rs2.next())
		 {%>
              
              
                </td>
                <td width="791"><p><%=rs2.getString(3)%> <%=rs2.getString(2)%></p>
		   <p> <%=rs2.getString(4)%></p><%}%></td></tr><%}while(rs.next());%> 
</table> 

<%} else { 
%>