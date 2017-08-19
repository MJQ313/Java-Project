<%-- 
    Document   : forget
    Created on : 17-Apr-2017, 13:54:36
    Author     : JUNAID QURESHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*"%>
         <%
     String email = request.getParameter("uemail");
    String phone = request.getParameter("uphone");
    String pass = request.getParameter("upass");
     try{
        Connection con;
        
        Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mjq?user=root&password=23081997");
                
         PreparedStatement pst = con.prepareStatement("Select * from user4 where email=? and phone=?");       
         pst.setString(1, email); 
         pst.setString(2, phone);
         ResultSet rs = pst.executeQuery();
         
         if(rs.next())
         {
             PreparedStatement ps = con.prepareStatement("update user4 set pass=? where email=?");
           ps.setString(1, pass);
           pst.setString(2, email);
           
          response.sendRedirect("index.html");
         }
         else
         {
             response.sendRedirect("Failure.jsp");
         }
     }
      catch(Exception e) {
        out.println(e);
    } 
     %>
     
    </body>
</html>
