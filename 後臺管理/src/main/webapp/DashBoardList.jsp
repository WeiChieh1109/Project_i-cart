<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>ๅๅๅ่กจ</title>
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
	<!-- chart1: ๆบๆง่ณผ็ฉ่ป้ป้ๆฏ็(5ๅฐ,้กฏ็คบ็พๅฐๅฏฆๆ้ป้) -->
	<!-- chart2:ๅปฃๅๆ็(่ฉฒ็จฎ้กๅๅๆจ่ฆๆฌกๆธvsๅฏฆ้้ทๅฎๆฌกๆธ) -->
	<!-- chart3:็ขๅ้ท้vsๅ็ขๅ -->
	<!-- ๅพ่บ็ธ้่ณ่จ็จฎ้ก: ้ทๅฎ้กใ้ท้ใๆจ่ฆๆธ้ใ็ดฐ้?ๅ้ก้ทๅฎ็ๆณ(ไพไปๆฅใๆจๆฅใๆฌๅจใๆฌๆ) -->
	<!-- ๆ็ดฏ่จ้ทๅฎๅฎๆ้ฒๅบฆ๏ผ่ๆ้้ฒๅบฆๅฐๆฏใ -->
	<!-- ็ผ่ฒจๆธๆ๏ผ้ๅๆธๆไธ่ฌๅป?ๅฎถๅพๅฎนๆๅฟฝ่ฆใๅพ็ผ่ฒจ็ๆธๆ๏ผ่ฝๅๆๅบ็ฉๆตใๅบซๅญใๅจ่ฝ็็ๅ้กใๆไปฅ๏ผๅๅฟๆๆธๆฅ๏ผ็ผ่ฒจๅฎขๆถ็ๆธ้ๅ็ผ่ฒจๆฌกๆธ๏ผๆธๆธๅฎขๆถ็ผ่ฒจ้้ไฝ็ๅๅ?๏ผๅๆ็ถๅๅชๅ็ฉๆตๆๆฌ๏ผ้ๅๆธๆๅฏไปฅๆฏๆๆๆฏๅญฃๅบฆๅๆใ -->
	<!-- ๆ้ๆฏ่ผ๏ผ่ไธๆใๅปๅนดๅๆๅฏฆ้ๆธๆ้ฒ่กๆฏ่ผ -->
	<!-- ๅฏฆ้ซๆฏ่ผ๏ผ่ๅ่กๆฅญๅ้ฒไผๆฅญๆๅๆฅญๅถไปไผๆฅญๆธๆ้ฒ่กๆฏ่ผ -->
	<!-- ๅฃๅพๆฏ่ผ๏ผ่่จๅๆ้?็ฎๆธๆ็ท็ธๆฏ่ผ -->
	<!-- ็ตๆงๆฏ่ผ๏ผๅจๆงๆๅๆ็ๅบ็คไธๆฏ่ผๅฉๅๆธๆ็ๆงๆ๏ผๅๆ่ฒกๅๆๆจ็่ฎๅ -->
	<div class="container-fluid">
		<h1 class="title_font text-center">I-CARTๅพ่บ็ฎก็็ณป็ตฑ</h1>
		<h2 class="text-center">ๅๅๅ่กจ</h2>
		<!-- ไธๆนๆ้: ไพ็ธฝ้ซๆฆๆณใๆๆ้็ตฑ่จใๆ็ขๅ็ตฑ่จ -->
		<div class="row d-flex">
			 <div class="listbtn col-6 text-left" > 
                <button id="ds">
				<a href="DashBoard.jsp">ๅปฃๅๆ็</a>
				</button>
             </div>
             
             <div class="col-6 text-right">
				<button class="addbtn">
					<a href="<%=request.getContextPath()%>/DBListServlet">็ขๅๅ่กจ LIST</a>
				</button>
				<button class="btn btn-outline-success">
				<a  style="text-decoration: none; color:white; " href="<%=request.getContextPath()%>/DBNewServlet">+ๆฐๅขๅๅ</a>
			</button>
			</div>
		</div>
		<!-- ๅณไธๆนๆฐๅขๆ้ -->
		

		<!-- ไธญๅคฎๅ่กจ -->
		<div class="table table-bordered">
			<table class="col-12">
				<thead style="background:black;color:white">
					<tr>
						<th>ๅงๅ</th>
						<th>้กๅฅ</th>
						<th>ๅนๆ?ผ</th>
						<th>ไป็ดน</th>
						<th>้้</th>
						<th>ๆงๅฅ</th>
						<th>ๅ็</th>
						<th>ๅไฝ</th>
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