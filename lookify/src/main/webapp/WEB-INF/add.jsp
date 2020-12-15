<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!-- in order to use validations via JSTL -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new Song</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<h1>Add New Song</h1>
		
		<a href="/dashboard">Dashboard</a>
	
		
		<form:form method="POST" action="/add" modelAttribute="song">
			<div class="form-group">
				<form:label path="title">Title:
					<form:errors path="title"/>
					<form:input path="title"/>
				</form:label>
			</div>
			<div class="form-group">
				<form:label path="artist">Artist:
					<form:errors path="artist"/>
					<form:input path="artist"/>
				</form:label>
			</div>
			<div class="form-group">
				<form:label path="rating">Rating (1-10):
					<form:errors path="rating"/>
					<form:input type="number" min="1" max="10" path="rating"/>
				</form:label>
			</div>
			
			<button>Create New Song</button>
			
		</form:form>
		
			
			
	</div>


</body>
</html>