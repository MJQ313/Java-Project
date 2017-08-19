<%-- 
    Document   : processdata
    Created on : 14-Apr-2017, 23:55:02
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
    String name = request.getParameter("uname");
    String email = request.getParameter("uemail");
    String pass = request.getParameter("upass");
    String dob = request.getParameter("udob");
    String gender = request.getParameter("ugender");
    String phone = request.getParameter("uphone");
    String country = request.getParameter("uloc");
    String role = request.getParameter("urole"); 
    try {
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mjq?user=root&password=23081997");
        PreparedStatement ps = con.prepareStatement("insert into USER4 values(?,?,?,?,?,?,?,'user')");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, pass);
        ps.setString(4, dob);
        ps.setString(5, gender);
        ps.setString(6, phone);
        ps.setString(7, country);
        ps.executeUpdate();
        out.println("Data saved successfully");
        response.sendRedirect("index.html");
    } catch (Exception e) {
        out.println(e);
    } 
%>
    </body>
</html>
