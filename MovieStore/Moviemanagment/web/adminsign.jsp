<%-- 
    Document   : validate
    Created on : 16-Apr-2017, 17:20:50
    Author     : JUNAID QURESHI
--%>

<%@ page import ="java.sql.*" %>
<%
    try{
        
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mjq?" + "user=root&password=23081997");    
        PreparedStatement pst = conn.prepareStatement("Select name,pass,type from user4 where name=? and pass=? and type='Admin'");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())
        {
         
           response.sendRedirect("Admin.html");        
          
        }
           else
        {
             response.sendRedirect("adminsign.html");
        }
       
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>
