<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>I-cart商品編輯系統</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	background-image: linear-gradient(-45deg, #ffffff96 0%, #3eb8ffbd 100%);
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	padding: 0px;
	margin: 0px;
}

img {
	height: 100px;
	width: 100px;
}

.form-group input:hover {
	border-radius: 5px;
	background: #ffc375;
	box-shadow: 0 0 10px #ffc375;
	transition: 0.3s;
	transition-delay: 0.1s;
}

#btn {
	/* margin: 10px; */
	font-size: medium;
	color:white;
	border-radius: 5px;
	width: 120px;
	height: 35px;
	background: rgb(44, 178, 255);
	border-style: none;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
}

#btn:hover {
	border-radius: 5px;
	color:white;
	background: #ffc375;
	box-shadow: 0 0 10px #ffc375;
}

#photo {
	/* 這是要將原本醜醜的上傳檔案按鈕蓋掉，勿刪 */
	display: none;
}

#photolabel i {
	position: relative;
	top: 5px;
	width: 120px;
	height: 35px;
	border-radius:5px;
	color: azure;
	font-weight: 500;
	background: rgb(44, 178, 255);
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
	display: block;
	cursor: pointer;
	text-align: center;
	padding-top: 11px;
}

#photolabel i:hover {
	border-radius: 5px;
	background: #ffc375;
	box-shadow: 0 0 10px #ffc375;
	transition: 0.3s;
	transition-delay: 0.1s;
}

label {
	font-weight:bolder;
	font-size:large;
	padding-left:8px;
}
</style>
<link
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'
	rel='stylesheet'>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<div class="container fluid">
		<h1 class="title_font text-center">I-CART後臺管理系統</h1>
		<caption>
			<h2 class="text-center">
				<c:if test="${product != null}">編輯商品</c:if>
				<c:if test="${product == null}">新增商品</c:if>
			</h2>
		</caption>
		<!-- last to fit in the container but it top right the page -->
		<div class="row" style="justify-content:right;margin-bottom:8px;margin-right:10px;">
			<button class="col-2 btn-primary " style="text-align:center;border-radius:5px;">
				<a href="<%=request.getContextPath()%>/DBListServlet" class="nav-link">後臺系統</a>
			</button>
		</div>
		
		<div class="card">
				<div class="card-body">
					<c:if test="${product != null}">
						<form action="DBUpdateServlet" method="post"
							enctype="multipart/form-data">
					</c:if>
					<c:if test="${product == null}">
						<form action="DBInsertServlet" method="post"
							enctype="multipart/form-data">
					</c:if>
					
					<c:if test="${product == null}">
						<fieldset class="form-group">
							<label for="text">商品名稱</label> <input id="text" placeholder="請輸入商品名稱" type="text"
								value="<c:out value='${product.name}' />" class="form-control"
								name="name" required="required">
						</fieldset>
					</c:if>


					<fieldset class="form-group">
						<label for="type">商品分類</label> <input  id="type" placeholder="請輸入商品分類" type="text"
							value="<c:out value='${product.type}' />" class="form-control"
							name="type">
					</fieldset>

					<fieldset class="form-group">
						<label for="price">商品價格</label> <input id="price" type="text" placeholder="請輸入商品價格"
							value="<c:out value='${product.price}' />" class="form-control"
							name="price">
					</fieldset>

					<fieldset class="form-group">
						<label for="info">商品簡介</label> <input  id="info" type="text" placeholder="請輸入商品簡介"
							value="<c:out value='${product.intro}' />" class="form-control"
							name="intro">
					</fieldset>

					<fieldset class="form-group">
						<label for="weight">商品重量 </label> <input  id="weight" type="text" placeholder="請輸入商品重量"
							value="<c:out value='${product.weight}' />" class="form-control"
							name="weight">
					</fieldset>

					<fieldset class="form-group">
						<label for="gender">目標客戶性別</label> <input  id="gender" type="text" placeholder="請輸入目標客戶性別"
							value="<c:out value='${product.gender}' />" class="form-control"
							name="gender">
					</fieldset>

					<fieldset class="form-group">
						<label id="photolabel" for="inputFile" >商品照片
						 <i id="inputFileText" class="fa fa-photo">上傳圖片</i>
						 </label>
						 <!--如果是新增商品時-->
								
								<input type="file" class="form-control"
							name="imgFile" id="inputFile" style="display:none"> 
								
						 <!--如果是編輯商品時-->
								<c:if test="${product == null}">
								<input type="hidden" class="form-control"
							name="picBase64" value="
							<c:out value='${product.picBase64}' />">
								</c:if>					  
					</fieldset>

					<button type="submit" id="btn" style="margin-left:8px">儲存</button>
					
					</form>
				</div>
			</div>
		</div>
</body>
</html>
