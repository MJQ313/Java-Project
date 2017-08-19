<%-- 
    Document   : pay1
    Created on : 16-Apr-2017, 16:37:35
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
        welcome
         <%@page import="java.sql.*"%>
        <%
     String noc = request.getParameter("noc");
    String cno = request.getParameter("cn");
    
    String zip = request.getParameter("zip");
    System.out.println("noc");
   
   try {
        Connection con;
        
        Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mjq?user=root&password=23081997");
                
        PreparedStatement ps = con.prepareStatement("insert into addm values(?,?,?)");
        ps.setString(1, noc);
        ps.setString(2, cno);
        
        ps.setString(3, zip);
   
        ps.executeUpdate();
        response.sendRedirect("Admin.html");
        
         }
         
    catch (Exception e) {
        out.println(e);
    } 
%>
    </body>
</html>
