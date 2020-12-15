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
		
		<!-- loop through validation errors - old way -->
		<c:forEach items="${errors}" var="err">
			<p class="danger">${err}</p>
		</c:forEach>
		
		<form:form method="POST" action="/add" modelAttribute="song">
			<div class="form-group">
				<form:label path="make">Make:
					<form:errors path="make"/>
					<form:input path="make"/>
				</form:label>
			</div>
			<div class="form-group">
				<form:label path="model">Model:
					<form:errors path="model"/>
					<form:input path="model"/>
				</form:label>
			</div>
			<div class="form-group">
				<form:label path="color">Color:
					<form:errors path="color"/>
					<form:input path="color"/>
				</form:label>
			</div>
			<div class="form-group">
				<form:label path="year">Year:
					<form:errors path="year"/>
					<form:input path="year"/>
				</form:label>
			</div>
			<div class="form-group">
				<form:label path="transmission">Transmission:
					<form:errors path="transmission"/>
					<form:input path="transmission"/>
				</form:label>
			</div>
			
			<button>Create New Song</button>
			
		</form:form>
		
		<!-- old way of making a form:-->
		
		<form action="/add" method="POST"><!-- goes to the /add route in the SongController -->
			<div class="form-group">
				<label for="make">Make</label>
				<input type="text" name = "make">
			</div>
			
			<div class="form-group">
				<label for="model">Model</label>
				<input type="text" name = "model">
			</div>
			
			<div class="form-group">
				<label for="color">Color</label>
				<input type="text" name = "color">
			</div>
			
			<div class="form-group">
				<label for="year">Year</label>
				<input type="text" name = "year">
			</div>
			
			<div class="form-group">
				<label for="transmission">Transmission</label>
				<input type="text" name = "transmission">
			</div>
			
			<button>Add Song</button>
		</form>	
		
		
			
			
	</div>


</body>
</html>