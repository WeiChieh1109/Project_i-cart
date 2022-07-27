<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
	img, #buybt{
		height:100px;
		width:100px;
	}
</style>
<script 
	src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js">
</script>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #00008A">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> User
					Management App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Users</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New User</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>name</th>
						<th>type</th>
						<th>price</th>
						<th>intro</th>
						<th>weight</th>
						<th>gender</th>
						<th>Photo</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="product" items="${listProducts}">

						<tr>
							<td><c:out value="${product.name}" /></td>
							<td><c:out value="${product.type}" /></td>
							<td><c:out value="${product.price}" /></td>
							<td><c:out value="${product.intro}" /></td>
							<td><c:out value="${product.weight}" /></td>
							<td><c:out value="${product.gender}" /></td>
							<td><img src="data:;base64,<c:out value="${product.picBase64}" />"/></td>
							<td><a href="edit?name=<c:out value='${product.name}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="delete?name=<c:out value='${product.name}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
			
			<fieldset>
				<input type="text" name="buyName" id="buyName" placeholder="請輸入欲結帳的產品name" onblur="getBuyName()"><br/>
				<script>
					function getBuyName(){
						let astring= "SummerizeServlet?name="+ $("#buyName").val();
						$("#buybt").attr("href",astring);
					}
				</script> 
				<a id="buybt" href="SummerizeServlet?name=">結帳</a>
			</fieldset>
			
		</div>
	</div>
</body>
</html>
