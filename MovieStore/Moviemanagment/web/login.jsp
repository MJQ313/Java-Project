
<html>
<%@page import="java.sql.*"%>
<%
    String name,pass;
    
    Connection cn;
    PreparedStatement pst;
    ResultSet rs;

try
{
    name=request.getParameter("name");
    pass=request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mjq?user=root&password=23081997");
    
    pst=cn.prepareStatement("select name,pass from user4 where name=? and pass=?");
    pst.setString(1,name);
    pst.setString(2,pass);
    rs=pst.executeQuery();
    if(rs.next())
    {
        System.out.println(rs.getString("name"));
        System.out.println("|");
        System.out.println(rs.getString("pass"));
    }
}
catch(Exception ex)
{
    out.println(ex);
}
    



    %>
</html>