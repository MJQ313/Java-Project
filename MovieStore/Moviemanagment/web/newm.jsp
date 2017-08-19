

<%-- 
    Document   : Admin
    Created on : 17-Apr-2017, 19:59:51
    Author     : JUNAID QURESHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%
    try{
        
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mjq?" + "user=root&password=23081997");    
        PreparedStatement pst = conn.prepareStatement("Select * from addm");
        
        ResultSet rs = pst.executeQuery();
        %>
        
        
        <%
        while(rs.next())
        { %>
        
    
   
    
    
    
            
      
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Movies</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

   
    <!-- Custom styles for this template -->
    <link href="css/custom.css" rel="stylesheet
	
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
		<script src="js/bootstrap.js"></script>
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  
  <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">

  

  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="main.jsp">Movies</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="main.jsp">Home</a></li>
            <li><a href="index.html">Logout</a></li>
          </ul>
		  
        </div><!--/.nav-collapse -->
      </div>
    </nav>
			 	
    <div class="container">
		<div class="row">
			<div class="col-md-4">
			
			<div class="cart-block">
				<form action="cart/update" method="post">
					<table collpadding="6" collspacing="1" style="width:100%" border="0">
						<tr> 
						<th>Language</th>
						</tr>
						<tr>
						<td><a href="hindi.html">Hindi</a></td>
						</tr>
						<tr><td><a href="marathi.html">Marathi</a></td></tr>
						
					</table>
				</form>
				</div>
			
				
				<div class="panel panel-default panel-list">
					<div class="panel-heading panel-heading-dark">
					<h3 class="panel-title">Categories</h3>
					</div>
					
					<!--List group-->
							<ul class="list-group">
							<li class="list-group-item"><a href="action.html">Action</a></li>
							<li class="list-group-item"><a href="drama.html">Drama</a></li>
							<li class="list-group-item"><a href="comedy.html">Comedy</a></li>
							<li class="list-group-item"><a href="horror.html">Horror</a></li>
							<li class="list-group-item"><a href="animation.html">Animation</a></li>
                                                        <form action="newm.jsp"> <input name="abc" type="submit" class="btn btn-primary" value="Recently Added Movie"  style="float:left;" /></form>
							</ul>
						
					</div>
											
			</div>
			<div class="panel panel-default">
			      <div class="panel-heading panel-heading-green">
					<h3 class="panel-title">latest Realease</h3>
				  </div>
                            <div class="pannel-body">
					<div class="row">
						<div class="col-md-4 movie">
							<div class="movie-price"></div>
							<a href="product.html">
							  
							  </a>
							   <div class="movie-title">
                                                               <h2> Title:<%=rs.getString("title")%></h2>
                                                             <h2>Price : $<%=rs.getString("price")%></h2>
                                                             <h3>Description :<%=rs.getString("discription")%></h3>
							   </div>	
								<div class="movie-add">
								
                                                                    
								  <form> <input type="button" class="btn btn-primary" value="Buy Now" onclick="window.location.href='pay.html'" style="float:right;" /> </form>
                                                                  
								 
								</div>
			   
			</div>
		</div>
      

    </div><!-- /.container -->
	
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  




 
	
	<div class="row footer">
		<div class ="container">
		  <p>Movies &copy: 2016, All Rights Reserved</p>
		</div>
	</div>
  
  <br><br><br><br><br><br><br><br>
  <% }

    }
    catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>
  </body>
  
</html>