<%-- 
    Document   : newjsp
    Created on : 16-Apr-2017, 20:36:23
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
    String title;
    
    Connection cn;
    PreparedStatement pst;
    ResultSet rs;

try
{
    title=request.getParameter("buttu");
    
    Class.forName("com.mysql.jdbc.Driver");
    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mjq?user=root&password=23081997");
    
    pst=cn.prepareStatement("select * from details where title=?");
    pst.setString(1, title);
    
   
    rs=pst.executeQuery();
    if(rs.next())
    {
        out.println("<li>"+rs.getString("title")+"  |  "+rs.getString("price"));
       
    }
}
catch(Exception ex)
{
    out.println(ex);
}
    



    %>
    </body>
</html>
