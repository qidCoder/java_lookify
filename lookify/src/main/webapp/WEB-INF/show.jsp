<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!-- in order to use validations via JSTL -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Song</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<h1>Song: ${song.title}</h1>
		<a href="/dashboard">Dashboard</a>
		<hr>
		
<table class="table table-dark">

			
			<tbody>

					<tr>
						<td>Title</td>
						<td>${song.title}</td>
					</tr>
					<tr>
						<td>Artist</td>
						<td>${song.artist}</td>
					</tr>					
					<tr>
						<td>Rating (1-10)</td>
						<td>${song.rating}</td>
					</tr>
						<tr>
						<td><a href="/delete/${song.id }">Delete</a></td>
						</tr>
					

			
			</tbody>
		
		
		
		
		
		
		</table>	
		

			
	</div>


</body>
</html>