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
    String exdt = request.getParameter("exdt");
    String sc = request.getParameter("sc");
    String zip = request.getParameter("zip");
    System.out.println("noc");
   
   try {
        Connection con;
        
        Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mjq?user=root&password=23081997");
                
         PreparedStatement pst = con.prepareStatement("Select * from card where cno=? and sc=? and exdt=? and noc=?");       
         pst.setString(1, cno); 
         pst.setString(2, sc);
         pst.setString(3, exdt);
         pst.setString(4, noc);
         ResultSet rs = pst.executeQuery();
         
         if(rs.next())
         {
                
        PreparedStatement ps = con.prepareStatement("insert into pay values(?,?,?,?,?)");
        ps.setString(1, noc);
        ps.setString(2, cno);
        ps.setString(3, exdt);
        ps.setString(4, sc);
        ps.setString(5, zip);
   
        ps.executeUpdate();
        out.println("Data saved successfully");
        response.sendRedirect("afterpay.html");
         }
         else
         {
             response.sendRedirect("fpay.html");
         }
    } catch (Exception e) {
        out.println(e);
    } 
%>
    </body>
</html>
