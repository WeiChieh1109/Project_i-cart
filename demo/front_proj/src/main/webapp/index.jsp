<%@page import="DAO.ProductDAO"%>
<%@page import="DAO.CarDAO"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>智慧購物車</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link rel="shortcut icon" href="#"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap');
#lgbut {
    font-family: 'Poppins', sans-serif;
}

#lgbut input {
    left:0px;
    position: relative;
    background: #000;
    width: 220px;
    text-decoration: none;
    color: #21ebff;
    padding:0 20px 0 20px;
    letter-spacing: 2px;
    font-size: 20px;
    transition: 0.5s;
    overflow: hidden;
    -webkit-box-reflect: below 1px linear-gradient(transition, #0003);
    text-transform: uppercase;
}

#lgbut input:hover{
    background: #21ebff;
    color: #111;
    box-shadow: 0 0 50px #21ebff;
    /* transition-delay: 0.5s; */
}

#lgbut input:before {
    content:'';
    position: absolute;
    top: 0px;
    left: 0px;
    width: 10px;
    height: 10px;
    border-top: 2px solid #21ebff;
    border-left: 2px solid #21ebff;
    transition: 0.5s;
     /* transition-delay: 0.5s; */
} 

#lgbut input:hover:before {
    width: 100%;
    height: 100%;
}


#lgbut input:after {
    content: '';
    position: absolute;
    bottom: 0px;
    right: 0px;
    width: 10px;
    height: 10px;
    border-bottom: 2px solid #21ebff;
    border-right: 2px solid #21ebff;
    transition: 0.5s;
    /* transition-delay: 0.5s; */
}

#lgbut input:hover:after {
    width: 100%;
    height: 100%;
}

#but_bump {
    position: fixed;
    background-image: linear-gradient(-20deg, #e9defa 0%, #fbfcdb 100%);
    border: 2px solid royalblue;
    width: 800px; 
    height: 521px; 
    left: 10px; 
    top: 60px;
    z-index:-1;
}


.but_cross1 {
    position: relative;
    border: 2px dashed rgb(181, 222, 135);
    width: 36px;
    height: 6px;
    background: rgb(255, 255, 255);
    margin: 3px 0px;
    border-radius: 2px;
    left:750px; 
    top: 530px;
    transform:rotate(-45deg) translate(-7px, 6px);
}

.but_cross2 {
    position: relative;
    border: 2px dashed rgb(181, 222, 135);
    width: 36px;
    height: 6px;
    background: rgb(255, 255, 255);
    margin: 3px 0px;
    border-radius: 2px;
    left:750px; 
    top:530px;
    transform:rotate(45deg) translate(0px, 0px);
}

.rec_container {
    position:relative;
    top:-580px;
    left:830px;
    padding: 0px;
    margin: 0px;
    width: 200px;
    height: 600px;
    border-left:2px solid rgba(107, 107, 228, 0.658);
}
.prod_name {
    font-size:18px;
    text-align: center;
    margin:0px;
}
.rec_title {
   top:30px;
    margin:0px;
}
.transition{
    transition: 0.4s;
}
#keyprod {
padding-top:7px;
margin:auto;
justify-content: center; 
display: flex;
}
#rec_bump {
    position: fixed;
    background-image: linear-gradient(-20deg, #e9defa 0%, #fbfcdb 100%);
    border: 2px solid royalblue;
    opacity: 0;
    width: 800px; 
    height: 521px; 
    left: 10px; 
    top:60px;
}
.rec_bar_45 {
    position: fixed;
    /* border: 2px dashed rgb(181, 222, 135); */
    width: 36px;
    height: 6px;
    background: #666;
    margin: 6px 0px;
    border-radius: 2px;
    left:750px;
    top:555px;
    transform: rotate(45deg) translate(5px, -15px);
}

.rec_bar_135 {
    position: fixed;
    /* border: 2px dashed rgb(181, 222, 135); */
    width: 36px;
    height: 6px;
    background: #666;
    margin: 6px 0px;
    border-radius: 2px;
    left:750px;
    top:554px;
    transform: rotate(-45deg) translate(14px, 5px);
}

.prod_img_big{
    position: fixed;
    width: 300px;
    height: 300px;
    left:45px;
    margin: 0px;  
    top:155px;
}

.prod_info{
    position:relative;
    display:block;
    top:40px;
    left:0px;
    width:440px;
    height:50px ;
    margin-bottom:20px;
}


#rec_bump{
z-index:-1;
}


#rec_bump h1 {
    position: absolute;
    top:16px;
}
* {
	/* border: 2px dashed rgb(117, 111, 172) ; */
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	height: 100%
}

body {
	background-image:
		url(https://live.staticflickr.com/65535/52226672470_65f7c53cbe_b.jpg);
	background-size: cover;
	background-position: left;
	background-repeat: repeat;
	background-attachment: fixed;
	overflow-y: hidden;
	overflow-x: hidden;
}

.transition {
	transition: 0.4s;
}

.menu {
	position: relative;
	/* border: 2px dashed rgb(173, 135, 222); */
	cursor: pointer;
	top: 50px;
	left: 830px;
	padding: 0px;
	margin: 0px;
	width: 200px;
	height: 600px;
}

.menu.active {
	position: relative;
	/* background: rgb(231, 38, 38); */
	width: 200px;
}

.menu ul {
	border: 2px solid black;
	border-radius: 10px;
	position: relative;
	left: 0;
	top: 0;
	background: rgba(255, 255, 255, 1);
	width: 200px;
	opacity: 0;
	max-height: 0;
	overflow: hidden;
}

.menu.active ul {
	border: 5px solid rgb(245, 196, 36);
	position: relative;
	top: -45px;
	opacity: 1;
	max-height: 670px;
	margin: 0px;
	width: 240px;
	height: 620px;
	padding-left: 5px;
	z-index: 1;
}

.menu ul li a {
	display: block;
	padding: 10px 12px;
}

ul, li {
	/* border: 2px dashed rgb(135, 222, 154); */
	list-style: none;
	padding: 0;
	margin: 0;
}

.bar {
	position: relative;
	/* border: 2px dashed rgb(181, 222, 135); */
	width: 36px;
	height: 6px;
	background: rgb(202, 202, 202);
	margin: 5px 0px;
	border-radius: 2px;
	left: -45px;
	top: 560px;
}

.menu.active .bar1 {
	transform: rotate(-45deg) translate(-9px, 7px);
}

.menu.active .bar2 {
	opacity: 0;
}

.menu.active .bar3 {
	transform: rotate(45deg) translate(-9px, -7px);
}




.buy {
	position: relative;
	border: 2px solid black;
	border-radius: 5px;
	top: 65px;
	right: 20px;
	width: 250px;
	height: 600px;
	z-index: 0;
	border: 2px solid rgb(172, 100, 100);
}

.font-color {
	font-size:0.2cm;
	color: white;
}
.ad_wrapper {
    position:absolute;
    width:800px;
    height: 500px;
    top: 65px;
    overflow: hidden;
	left:20px;
   	z-index:-2;
}

.ad_wrapper ul {
    margin: 0;
    padding: 0;
    position: absolute;
  
}

.ad_wrapper li {
    margin: 0;
    padding: 0;
    list-style: none;
    text-decoration:none;
    border: 3px solid blue;
    justify-content:center;
    justify-items:center;
}

.ad_wrapper ul.ad_slides {
	margin: 0;
    padding: 0;
    width: 3200px;
    left: 0px;
    transition: all .5s;
    
}

.ad_wrapper ul.ad_slides li {
	margin: 0;
    padding: 0;
    width: 800px;
    height: 500px;
    overflow: hidden;
    float: left;
}

.ad_wrapper ul.slides li img {
	margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.dot {
    position: absolute;
    bottom: 10px;
    width: 100%;
    display: flex;
    justify-content: center;
}

.dot li {
    border: 1px solid #fff;
    /* border-radius: 50%; */
    margin: 0 5px;
    width: 24px;
    height: 10px;
}
    

</style>
</head>

<body>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="jquery-3.6.0.min.js"></script>
	<div class="container-fluid">
	<div class="row d-flex">
		<nav class="navbar fixed-top navbar-expand-lg"
                style="padding:0px; margin:0px; background-image: linear-gradient(-45deg, #ff9665 5%, #64d2fde1 100%);">
                <div class="container-fluid">
                    <a class="navbar-brand" style="font-weight: 1000; font-size: x-large;" href="#">智慧購物車I-cart</a>
                    <div class="collapse navbar-collapse" id="navbarText">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">
                                <div class="sum" style="display:inline; padding-top:0px; font-weight: 1000; font-size: large;"></div>
                                </a>
                            </li>
                        </ul>
                    </div>
            </nav>
		<!-- cont右下功能列 -->
		<div class="menu transition" id="bar">
			<div class="bar bar1 transition"></div>
			<div class="bar bar2 transition"></div>
			<div class="bar bar3 transition"></div>
			<ul class="transition">
				<h2>您好!</h2>
				<h3>祝您有愉快的購買體驗!</h3>
				<a class="transition">
					<tr>
						<th>名稱</th>
						<th>單價(元)</th>
					</tr>
					<div class="site" style="color:#FF4500;">查看列表
					
					</div>
				</a>
			</ul>
		</div>
		
		<div>
		<form action="ScanProductServlet" id="lgbut">
			<input class="button" id="btn" type="submit" value="檢視商品">
		</form>
        </div>

		<%
		HttpSession session2 = request.getSession(false);
		String pict = (String) session2.getAttribute("fuck");
		%>
		<div class=product-ad id="content">	
	  		<div>
				<img class="prod_img_big" src="data:image/jpeg;base64,${existingProduct.base64Img}"></div>
				<div class="product-intro" style="top:110px;left:380px;position:fixed;">
				<p style="font-size:0.9cm;" class="prod_info"><c:out value="${existingProduct.name}" /></p>
				<br>
				<br>
				<p style="font-size:0.9cm;" class="prod_info"><c:out value="${existingProduct.price}元" /></p>
				<br>
				<br>
				<p style="font-size:0.5cm;" class="prod_info"><c:out value="${existingProduct.intro}" /></p>
				<br>
				</div>
				<div id="but_bump">
				</div>
				<div class="cross">
                    <div class="rec_bar_45"></div>
                    <div class="rec_bar_135"></div>
                </div>
			</div>

		
              
            </div>

		<!--  <div class="ad_wrapper" id="cont" style="max-width: 800px; overflow: hidden;">
                <ul class="ad_slides">
                  
                    <c:forEach var="product" varStatus="Count" items="${products}">
	                    <li><img id="pic${Count.count}" src="data:;base64,<c:out value="${product.picBase64}" /> "/></li>
                    </c:forEach>
                </ul>

                <ul class="dot">
                    <li id="1"></li>
                    <li id="2"></li>
                    <li id="3"></li>
                    <li id="4"></li>
                </ul>

            </div>
        </div>  -->  
<!-- cont右側推薦列表 --><!-- 商品條碼廣告 -->
		<div class="rec_container col-2">
			<div>
			<h2 class="rec_title font-color" style="font-size:0.5cm;">&nbsp&nbsp&nbsp你可能也需要</h2>
			<div id="side_ad" class="font-color">
			<%String product1_name=(String)request.getAttribute("product1_name");
			  String product1_pic=(String)request.getAttribute("product1_pic");
			  String product2_name=(String)request.getAttribute("product2_name");
			  String product2_pic=(String)request.getAttribute("product2_pic");
			  String product3_name=(String)request.getAttribute("product3_name");
			  String product3_pic=(String)request.getAttribute("product3_pic");
			%>
			<c:out value="${product1_name}"/>
			<img src="data:;base64,${product1_pic}"/><br>
			<c:out value="${product2_name}"/>
			<img src="data:;base64,${product2_pic}"/><br>
			<c:out value="${product3_name}"/>
			<img src="data:;base64,${product3_pic}"/>
			</div>
		</div>
	</div>

			<!-- spt右側推薦列表-->
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<script>
                  $("rec1").click(function () {
                        $("#rec_bump").css({ "opacity": 1, "transition": "0.4s" })
                    });

                  $(".cross").click(function () {
                        $("#rec_bump").css({ "opacity": "0", "transition": "0.4s" });
                    }); 
                </script>
			<!-- spt右下功能列 -->
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<script>
                    $("div.menu").click(function () {
                        $(this).toggleClass("active");
                        
                    });
                </script>

			<!-- spt廣告輪播 -->
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<script>
                let t = setInterval(f, 3000);
                function f() {
                    let s = (new Date().getSeconds());
                    let time = parseInt(s % 4);
                    var num = 0 - 800 * time;
                    console.log(num)
                    $("ul.ad_slides").css("left", num); //選取ul下面的所有slides
                    $(".dot li").eq(time).css("background-color", "white").siblings().css("background-color", "transparent");
                }
                $(window).resize(f);
            </script>
                <!--  檢視商品按鈕 -->
                <script>
			        $('#btn').click(function(){
			            $('#content').toggle();
			        });
			        
			    
			        document.addEventListener('click',function(){
			            $('#content').hide();
			        },true);
        		</script>
			<!-- 此處為自動輸出購物車列表內容 -->
			<script>
			
			setInterval(refresh,2000);
			function refresh(){
				var settings = {
						  "url": "http://localhost:8080/front_proj/TestServlet?account=aaa",
						  "method": "POST",
						  "timeout": 0,
						  "headers": {
						    "Content-Type": "application/json"
						  },
						  "data": "sprite",
						};

						$.ajax(settings).done(function(response) {
						  $(".site").empty().append(response);
						});
						}
			setInterval(SumMoney,2000);
			function SumMoney(){
				var settings = {
						  "url": "http://localhost:8080/front_proj/TestServlet?account=bbb",
						  "method": "POST",
						  "timeout": 0,
						  "headers": {
						    "Content-Type": "application/json"
						  },
						  "data": "sprite",
						};

						$.ajax(settings).done(function(response) {
						  $(".sum").empty().append(response);
						});
					}
	
		   </script>
		</div>
	</div>
</body>
</html>