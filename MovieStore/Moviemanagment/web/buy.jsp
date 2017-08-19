<%-- 
    Document   : Admin
    Created on : 17-Apr-2017, 19:59:51
    Author     : JUNAID QURESHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head><meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">
	
	<title>Buy Details</title>

	<link rel="shortcut icon" href="assets/images/gt_favicon.png">
	
	<!-- Bootstrap itself -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">

	<!-- Custom styles -->
	<link rel="stylesheet" href="assets/css/magister.css">

	<!-- Fonts -->
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href='http://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'></head>
<%@ page import ="java.sql.*" %>
<%
    try{
        
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mjq?" + "user=root&password=23081997");    
        PreparedStatement pst = conn.prepareStatement("Select * from pay");
        
        ResultSet rs = pst.executeQuery();
        %>
<br><br><br><br>
        <table border="1" style="width:50%" align="center">
        <tr>
        <b><td><h3 style="color:black">Number on Card</h3></td>
           <td><h3 style="color:black">Card No</h3></td>
    <td><h3 style="color:black">Security Code</h3></td>
    <td><h3 style="color:black">Zip</h3></td></b>
    </tr>
</table>
        <%
        while(rs.next())
        { %>
        <table border="1" style="width:50%" align="center">
       <tr>
       
           <td><font size="4" color="black" align="center"><%=rs.getString("noc")%></font></td>
    <td><font size="4" color="black" align="center"><%=rs.getString("cno")%></font></td>
    <td><font size="4" color="black" align="center"><%=rs.getString("sc")%></font></td>
    <td><font size="4" color="black" align="center"><%=rs.getString("zip")%></font></td>
    </tr>
        </table>
            
        <% }

    }
    catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>