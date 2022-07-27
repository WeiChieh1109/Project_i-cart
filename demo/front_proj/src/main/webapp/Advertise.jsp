<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset style="height:100px;width:100px">
		<form action="AdServlet" method="get">
			<input type="submit" value="GO">
		</form>
	</fieldset>
	
	
	<table class="table table-bordered">
				<thead>
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>Price</th>
						<th>Intro</th>
						<th>Weight</th>
						<th>Gender</th>
						<th>Photo</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="product" items="${products11}">

						<tr>
							<td><c:out value="${product.name}" /></td>
							<td><c:out value="${product.type}" /></td>
							<td><c:out value="${product.price}" /></td>
							<td><c:out value="${product.intro}" /></td>
							<td><c:out value="${product.weight}" /></td>
							<td><c:out value="${product.gender}" /></td>
							<td><img style="height:100px;width:100px" src="data:;base64,<c:out value="${product.picBase64}" />"/></td>
							<td><a href="edit?name=<c:out value='${product.name}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="delete?name=<c:out value='${product.name}' />">Delete</a></td>
						</tr>
					</c:forEach>
					
				</tbody>

	</table>
</body>
</html>