<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>商品列表</title>
<!--<link rel="stylesheet" type="text/css" href="bg-index1.css">  -->
<link
	href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
.container {
	border: 5px dashed rgb(255, 196, 0);
}

img, #buybt {
	height: 100px;
	width: 100px;
}

body {
	background-image: linear-gradient(-45deg, #ffffff96 0%, #3eb8ffbd 100%);
}

.title_font {
	padding-left: 20px;
	font-family: 'Ubuntu', 'sans-serif';
	margin: 0px;
}

label h2 {
	margin: 0px;
	padding-left: 22px;
}

.mthbtn button {
	margin: 10px;
	font-size: medium;
	border-radius: 5px;
	background: #e3fdff;
	border-style: none;
	box-shadow: 3px 3px 2px rgba(136, 136, 136, 0.829);
	width: 70px;
	height: 30px;
}

.mthbtn button:hover {
	border: 2px solid rgb(255, 252, 52);
	border-radius: 5px;
	background-color: rgb(156, 243, 255);
}

.listbtn button {
	border-style: none;
	margin: 10px;
	font-size: medium;
	font-weight: bolder;
	border-radius: 5px;
	background: #e3fdff;
	box-shadow: 3px 3px 2px rgba(136, 136, 136, 0.829);
}

.listbtn button a {
	text-decoration: none;
	font-size: large;
	color: rgba(0, 0, 0, 0.863);
}

.listbtn button:hover {
	border-radius: 5px;
	background: #ffc375;
	box-shadow: 0 0 10px #ffc375;
}

.addbtn  {
	border-style: none;
	margin: 10px;
	font-size: medium;
	font-weight: bolder;
	border-radius: 5px;
	background: #e3fdff;
	box-shadow: 3px 3px 2px rgba(136, 136, 136, 0.829);
}

.addbtn  a {
	text-decoration: none;
	font-size: large;
	color: rgba(0, 0, 0, 0.863);
}

.addbtn  a:hover {
	display: inline;
	border-radius: 5px;
	background: #ffc375;
	box-shadow: 0 0 10px #ffc375;
}

#list td {
	border: 1px solid rgba(0, 0, 0, 0.432);
	font-weight: 700;
	font-size: large;
}

#list td:hover {
	color: #2c53ffe7;
}

#tda {
	text-align: center;
	vertical-align: middle;
	padding: auto;
	margin: auto;
}

#tda a {
	text-decoration: none;
	font-weight: 700;
	padding: 10px;
	font-size: large;
	color: rgba(0, 0, 0, 0.863);
}

#tda a:hover {
	color: #2c53ffe7;
}

#tdimg {
	text-align: center;
	vertical-align: middle;
}
</style>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js">
	
</script>
</head>
<body>
	<!-- chart1: 智慧購物車電量比率(5台,顯示美台實時電量) -->
	<!-- chart2:廣告效益(該種類商品推薦次數vs實際銷售次數) -->
	<!-- chart3:產品銷量vs各產品 -->
	<!-- 後臺相關資訊種類: 銷售額、銷量、推薦數量、細項品類銷售狀況(依今日、昨日、本周、本月) -->
	<!-- 月累計銷售完成進度，與時間進度對比。 -->
	<!-- 發貨數據：這個數據一般廠家很容易忽視。從發貨的數據，能分析出物流、庫存、周轉率的問題。所以，務必搞清楚，發貨客戶的數量和發貨次數，摸清客戶發貨量降低的原因，同時綜合優化物流成本，這個數據可以每月或每季度分析。 -->
	<!-- 時間比較：與上期、去年同期實際數據進行比較 -->
	<!-- 實體比較：與同行業先進企業或同業其他企業數據進行比較 -->
	<!-- 口徑比較：與計劃或預算數據線相比較 -->
	<!-- 結構比較：在構成分析的基礎上比較兩個數據的構成，分析財務指標的變化 -->
	<div class="container-fluid">
		<h1 class="title_font text-center">I-CART後臺管理系統</h1>
		<h2 class="text-center">商品列表</h2>
		<!-- 上方按鈕: 依總體概況、按時間統計、按產品統計 -->
		<div class="row d-flex">
			 <div class="listbtn col-6 text-left" > 
                <button id="ds">
				<a href="DashBoard.jsp">廣告效益</a>
				</button>
             </div>
             
             <div class="col-6 text-right">
				<button class="addbtn">
					<a href="<%=request.getContextPath()%>/DBListServlet">產品列表 LIST</a>
				</button>
				<button class="btn btn-outline-success">
				<a  style="text-decoration: none; color:white; " href="<%=request.getContextPath()%>/DBNewServlet">+新增商品</a>
			</button>
			</div>
		</div>
		<!-- 右上方新增按鈕 -->
		

		<!-- 中央圖表 -->
		<div class="table table-bordered">
			<table class="col-12">
				<thead style="background:black;color:white">
					<tr>
						<th>姓名</th>
						<th>類別</th>
						<th>價格</th>
						<th>介紹</th>
						<th>重量</th>
						<th>性別</th>
						<th>圖片</th>
						<th>動作</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="product" items="${listProducts}">

						<tr id="trid">
							<td><c:out value="${product.name}" /></td>
							<td><c:out value="${product.type}" /></td>
							<td><c:out value="${product.price}" /></td>
							<td><c:out value="${product.intro}" /></td>
							<td><c:out value="${product.weight}" /></td>
							<td><c:out value="${product.gender}" /></td>
							<td><img
								src="data:;base64,<c:out value="${product.picBase64}" />" /></td>
							<td><a
								href="DBEditServlet?name=<c:out value='${product.name}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="DBDeleteServlet?name=<c:out value='${product.name}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>
			</table>
		</div>
</body>
</html>