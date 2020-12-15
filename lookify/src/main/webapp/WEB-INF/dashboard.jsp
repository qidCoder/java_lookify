<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Songs</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<a href="/add">Add a new song</a>
		<a href="/topten">Top Songs</a>
		
		<!-- search bar -->
	  <form action="/search/${song.artist}">
		<input type="text" placeholder="Search Artist" name="artist">
		<button type="submit">Search Artists</button>
	  </form>  
		
		<table class="table table-dark">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Rating</th>

					
					<th>Actions</th>
				</tr>
			</thead>
			
			<tbody>
				<!-- loop through arraylist -->
				<c:forEach items="${allSongs}" var="song">
					<tr>
						<td>${song.id}</td>
						<td><a href="/${song.id}">${song.title}</a></td>
						<td>${song.rating}</td>
						
						<td><a href="/delete/${song.id }">Delete</a></td>
					</tr>
				
				</c:forEach>
			
			</tbody>
		
		
		
		
		
		
		</table>
	
	
	
	
	
	
	</div>
</body>
</html>