<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Top Ten Songs</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Top Ten Songs</h1>
		<a href="/dashboard">Dashboard</a>
		
		<table class="table table-dark">
			<thead>
				<tr>
					<th>Rating</th>
					<th>Title</th>
					<th>Artist</th>
				</tr>
			</thead>
			
			<tbody>
				<!-- loop through arraylist -->
				<c:forEach items="${topSongs}" var="song">
					<tr>
						<td>${song.rating}</td>
						<td><a href="/${song.id}">${song.title}</a></td>
						<td>${song.artist}</td>
					</tr>
				
				</c:forEach>
			
			</tbody>
		
		
		
		
		
		
		</table>
	
	
	
	
	
	
	</div>
</body>
</html>