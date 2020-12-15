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
		<h1>Welcome to Songs!</h1>
		<h3> Showing All Songs</h3>
		<a href="/add" class="btn btn-danger">Add a new song</a>
		
		<table class="table table-dark">
			<thead>
				<tr>
					<th>ID</th>
					<th>Make</th>
					<th>Model</th>
					<th>Color</th>
					<th>Year</th>
					<th>Transmission</th>
					<th>Edit</th>
					<th>Registered</th>
				</tr>
			</thead>
			
			<tbody>
				<!-- loop through arraylist -->
				<c:forEach items="${allSongs}" var="song">
					<tr>
						<td>${song.id}</td>
						<td><a href="/${song.id}">${song.make}</a></td>
						<td>${song.model}</td>
						<td>${song.color}</td>
						<td>${song.year}</td>
						<td>${song.transmission}</td>
						<td><a href="/${song.id }">Edit Song</a></td>
						<td>
							<c:choose>
								<c:when test="${song.title != null}">
									True
								</c:when>
								<c:otherwise>
									No
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				
				</c:forEach>
			
			</tbody>
		
		
		
		
		
		
		</table>
	
	
	
	
	
	
	</div>
</body>
</html>