<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>智慧購物車</title>
    <link rel="stylesheet" type="text/css" href="index-main.css">
    <!-- <link rel="stylesheet" media="screen and  (max-width: 780px)" href="index-main780.css" /> -->
    <link rel="stylesheet" type="text/css" href="ad_autoplay.css">
    <!-- <link rel="stylesheet" media="screen and  (max-width: 780px)" href="ad_autoplay780.css" /> -->
    <link rel="stylesheet" type="text/css" href="recommend.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="shortcut icon" href="#" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="showbut.css">
</head>
<body>

<!-- 引入bootstrap.js檔 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

        <script>
            // window.addEventListener('click', (event) => {
            //                 toggleFullScreen();
            //             });
        
            //             function toggleFullScreen() {
            //                  document.documentElement.requestFullscreen();
            //                                    } 
                                       
        </script>
        <%-- <% GoodsDAO goodsDAO=new GoodsDAO(); List<GoodsBean> LGB = goodsDAO.selectAllGoods();%> --%>
        <!-- *整體框架* -->
        <div class="main_container container-fluid">
            <!-- <h1 style="position:absolute; left:20px; top:10px;font-family :'Ubuntu','sans-serif';">I-CART 智慧購物車</h1>
         -->
        <!--cont 下方nav bar -->
            <nav class="navbar fixed-top navbar-expand-lg" style="padding:0px; margin:0px; background-image: linear-gradient(-45deg, #ff9665 5%, #64d2fde1 100%);">
               <div class="container-fluid" >
                <a class="navbar-brand"  style="font-weight: 1000; font-size: x-large;" href="#">智慧購物車I-cart</a>
               
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                     <li class="nav-item">
                       
                      <a class="nav-link active" aria-current="page" href="#"></a>
                    </li>
                </ul>
                </div>
            </nav>
            <!-- cont辨識按鈕 -->
            <div class="button">
                <a type="submit"  href="forruntime.jsp" method="get" content="開始辨識">開始辨識</a>
            </div>
            <!-- cont右下功能列 -->
            <div class="menu transition" id="bar">
                <div class="bar bar1 transition"></div>
                <div class="bar bar2 transition"></div>
                <div class="bar bar3 transition"></div>
                <ul class="transition">
                    <h2>您好!</h2>
                    <h4>祝您有愉快的購買體驗!</h4>
                    <li><a class="transition ">
                            <table>
                                <tr>
                                    <th>編碼</th>
                                    <th>名稱</th>
                                    <th>單價(元)</th>
                                    <th>數量</th>
                                </tr>
                                <%-- <%for(GoodsBean GB:LGB){ out.print("<tr><td>"+GB.getId()+"</td><td>"+GB.getName()+"</td><td>"+GB.getPrice()+"</td><td>"+GB.getNum()+"</td></tr>");} %> --%>
                            </table>
                        </a></li>
                </ul>
            </div>
            <!-- cont下方加總列 -->
            <div class="money font-color">
                <%int total=0;%>
                   <%--  <%for(GoodsBean GB:LGB){ total=total+GB.getPrice()*GB.getNum(); }%> --%>
                        <h1>
                            <%out.print("累積"+total+"元"); %>
                        </h1>
            </div>
            <!-- cont廣告輪播 -->
            <div class="ad_wrapper" id="cont">
   
                <ul class="ad_slides">
                    <!--  <li><img src="https://live.staticflickr.com/65535/52186540710_8c70b19541_o.jpg" alt="" id="pic1">
                    </li>
                    <li><img src="https://live.staticflickr.com/65535/52186540680_08062048f4_o.jpg" alt="" id="pic2">
                    </li>
                    <li><img src="https://live.staticflickr.com/65535/52185034222_80bfaf8a25_o.jpg" alt="" id="pic3">
                    </li>
                    <li><img src="https://live.staticflickr.com/65535/52186055086_c40b965eea_o.jpg" alt="" id="pic4">
                    </li>-->
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
            <!-- cont右側推薦列表 -->
            <div class="rec_container">
        
            <!--cont右側推薦內容-->
            <div>
                <h2 class="rec_title font-color">&nbsp&nbsp&nbsp&nbsp&nbsp你可能也需要</h2>
                    <tr id="side_ad">
                        <td><img class="rec1" id="keyprod"
                                src="https://live.staticflickr.com/65535/52197642439_1cfa76bb3a_o.png">
                            <h5 class="prod_name font-color">番號化妝水</h5>
                        </td>
                        <td><img class="rec1" id="keyprod"
                                src="https://live.staticflickr.com/65535/52197391783_661d53e063_o.png">
                            <h5 class="prod_name font-color">氣泡水</h5>
                        </td>
                        <td><img class="rec1" id="keyprod"
                                src="https://live.staticflickr.com/65535/52197642449_5c9056a28c_o.png">
                            <h5 class="prod_name font-color">刮鬍刀</h5>
                        </td>
                    </tr>
            </div>
            
            <div id="rec_bump">
                    <h1>&nbsp&nbsp&nbsp&nbsp商品詳細</h1>
                    <!-- <h2>"+GB.getPrice()+"</h2> -->
                    <!-- <h2>"+GB.getInfo()+"</h2> -->
                    <!-- "); -->
                    <!-- } %> -->
                    <img class="prod_img_big" src="https://live.staticflickr.com/65535/52201955875_650d984637_b.jpg">
                    <div>
                        <p style="font-size:1.7cm;" class="prod_info">COKE</p>

                    </div>
                    <div>
                        <p style="font-size:0.9cm;" class="prod_info">35元</p>

                    </div>
                    <div>
                        <p style="font-size:0.5cm;" class="prod_info">抵擋不住的紅色魅力<br>
                            美食麻吉，就要Coke!!<br>
                            給您前所未有的滿足 </p>

                    </div>
                    <!--右下角叉叉-->
                    <div class="cross">
                        <div class="rec_bar_45"></div>
                        <div class="rec_bar_135"></div>
                    </div>

            </div>
            
            <!-- spt右側推薦列表-->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script>
                    $("img").click(function () {
                        $("#rec_bump").css({ "opacity": 1, "transition": "0.4s" })
                    });

                    $(".cross").click(function () {
                        $("#rec_bump").css({ "opacity": "0", "transition": "0.4s" });
                    });
            </script>
            <!-- spt右下功能列 -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script>
                    $("div.menu").click(function () {
                        $(this).toggleClass("active");
                    });
            </script>
            <!-- spt廣告輪播 -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script>
                    let t = setInterval(f, 1000);
                    function f() {
                        let s = (new Date().getSeconds());
                        let time = parseInt(s % 4);
                        var num = 0 - 800 * time;
                        console.log(num)
                        $("ul.ad_slides").css("left", num); //選取ul下面的所有slides
                        $(".dot li").eq(time).css("background-color", "white").siblings().css("background-color", "transparent");
                    }

                    /*  setInterval(g, 1000);
                    function g() {
                        var x = 11;
                        var y = 0;
                        var rand = parseInt(Math.random() * (x - y + 1) + y);
                        console.log(rand)
                        switch (rand) {
                            case 0:
                                $("#pic1").attr("src", "https://live.staticflickr.com/65535/52185057207_6e4bca5d6f_o.jpg");
                                break;
                            case 1:
                                $("#pic2").attr("src", "https://live.staticflickr.com/65535/52186065313_9948b24cd3_o.jpg");
                                break;
                            case 2:
                                $("#pic3").attr("src", "https://live.staticflickr.com/65535/52186055141_e8703379c1_o.jpg");
                                break;
                            case 3:
                                $("#pic4").attr("src", "https://live.staticflickr.com/65535/52186055086_c40b965eea_o.jpg");
                                break;
                            case 4:
                                $("#pic1").attr("src", "https://live.staticflickr.com/65535/52185034272_3b5358d542_o.jpg");
                                break;
                            case 5:
                                $("#pic2").attr("src", "https://live.staticflickr.com/65535/52186540710_8c70b19541_o.jpg");
                                break;
                            case 6:
                                $("#pic3").attr("src", "https://live.staticflickr.com/65535/52186327529_6e7b2a2f88_o.jpg");
                                break;
                            case 7:
                                $("#pic4").attr("src", "https://live.staticflickr.com/65535/52185034367_9a5ca04748_o.jpg");
                                break;
                            case 8:
                                $("#pic1").attr("src", "https://live.staticflickr.com/65535/52185034267_f5a68d4c46_o.jpg");
                                break;
                            case 9:
                                $("#pic2").attr("src", "https://live.staticflickr.com/65535/52186540680_08062048f4_o.jpg");
                                break;
                            case 10:
                                $("#pic3").attr("src", "https://live.staticflickr.com/65535/52185034242_e51caaf74e_o.jpg");
                                break;
                            case 11:
                                $("#pic4").attr("src", "https://live.staticflickr.com/65535/52185034222_80bfaf8a25_o.jpg");
                                break;
                        }
                    }*/

                    $(window).resize(f);
            </script>
            <!-- sptclick全螢幕 -->
            <script>
            // window.addEventListener('click', (event) => {
            //                 toggleFullScreen();
            //             });
    
            //             function toggleFullScreen() {
            //                 document.documentElement.requestFullscreen();
            //             }
            </script>
        
                
</body>
</html>