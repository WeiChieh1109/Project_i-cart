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
	img{
		height:100px;
		width:100px;
	}
</style>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #00008A">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> User Management App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Products</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${product != null}">
					<form action="update" method="post" enctype="multipart/form-data">
				</c:if>
				<c:if test="${product == null}">
					<form action="insert" method="post" enctype="multipart/form-data"> 
				</c:if>

				<caption>
					<h2>
						<c:if test="${product != null}">
            			Edit Product
            		</c:if>
						<c:if test="${product == null}">
            			Add New Product
            		</c:if>
					</h2>
				</caption>

				<%-- <c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if> --%>

				<fieldset class="form-group">
					<label>Name</label> 
					<input type="text" value="<c:out value='${product.name}' />" class="form-control" name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Type</label> 
					<input type="text" value="<c:out value='${product.type}' />" class="form-control" name="type">
				</fieldset>

				<fieldset class="form-group">
					<label>Price</label>
					<input type="text" value="<c:out value='${product.price}' />" class="form-control" name="price">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Intro</label> 
					<input type="text" value="<c:out value='${product.intro}' />" class="form-control" name="intro">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Weight </label> 
					<input type="text" value="<c:out value='${product.weight}' />" class="form-control" name="weight">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Gender </label> 
					<input type="text" value="<c:out value='${product.gender}' />" class="form-control" name="gender">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Photo </label> 
					<input type="file" class="form-control" name="imgFile">
					<input type="hidden" class="form-control" name="picBase64" value="<c:out value='${product.picBase64}' />">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
