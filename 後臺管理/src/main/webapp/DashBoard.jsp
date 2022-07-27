<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>廣告效益</title>
<!--<link rel="stylesheet" type="text/css" href="bg-index1.css">  -->
<link
	href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap"
	rel="stylesheet">
<style>
body {
	background-image: linear-gradient(-45deg, #ffffff96 0%, #3eb8ffbd 100%);
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	padding: 0px;
	margin: 0px;
}

.title_font {
	/* border:2px solid black; */
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
	font-weight: 550;
	border-radius: 5px;
	background: #e3fdff;
	border-style: none;
	box-shadow: 3px 3px 2px rgba(136, 136, 136, 0.829);
	width: 70px;
	height: 30px;
}

.mthbtn button a {
	text-decoration: none;
	font-size: large;
	color: rgba(0, 0, 0, 0.863);
}

.mthbtn button:hover {
	/* border: 2px solid rgb(255, 252, 52); */
	border-radius: 5px;
	/* background-color: rgb(156, 243, 255); */
	background: #ffc375;
	box-shadow: 0 0 10px #ffc375;
}

#bt {
	border-style: none;
	margin: 10px;
	font-size: medium;
	font-weight: bolder;
	border-radius: 5px;
	background: #e3fdff;
	box-shadow: 3px 3px 2px rgba(136, 136, 136, 0.829);
	width: 190px;
	height: 30px;
}

#bt a {
	text-decoration: none;
	font-size: large;
	color: rgba(0, 0, 0, 0.863);
}

#bt:hover {
	display: inline;
	border-radius: 5px;
	background: #ffc375;
	box-shadow: 0 0 10px #ffc375;*/
}

.addbtn button {
	border-style: none;
	margin: 10px;
	font-size: medium;
	font-weight: bolder;
	border-radius: 5px;
	background: #e3fdff;
	box-shadow: 3px 3px 2px rgba(136, 136, 136, 0.829);
	width: 190px;
	height: 30px;
}

.addbtn button a {
	text-decoration: none;
	font-size: large;
	color: rgba(0, 0, 0, 0.863);
}

.addbtn button:hover {
	/* border: 2px solid rgb(255, 252, 52); */
	border-radius: 5px;
	background: #ffc375;
	box-shadow: 0 0 10px #ffc375;
}

</style>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js">
            </script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<div class="container-fluid">
		<h1 class="title_font text-center">I-CART後臺管理系統</h1>
		<h2 class="text-center">廣告效益Dashboard</h2>
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
		<!-- 左側邊月份按鈕 -->
		<!-- 左側邊月份按鈕 -->
		<div class="row d-flex">
		<!-- 上方按鈕: 依總體概況、按時間統計、按產品統計 -->
			<div  class="col-4 text-left addbtn">
				<button id="totalBt">總統計</button>
				<button id="typeBt1" style="display: inline">
					<a href="DashBoardType.jsp">按分類統計</a>
				</button>
				<script>        	
				 	$("#totalBt").click(function (){
					/*$("#typeBt1").css("display","inline");
					$("#typeBt2").css("display","none");*/
					for(let i=1; i<13 ; i++){
						$("#a"+i).attr("href","ResultServlet?month=2022-"+i+"-");
					}
					}); 				
				</script>
			</div>
				<!-- 右上方新增按鈕 -->
		<div class="col-8 text-center" >
			<button id="bt">
				<a  href="<%=request.getContextPath()%>/DBListServlet">產品列表 LIST</a>
			</button>
			<button class="btn btn-outline-success">
				<a  style="text-decoration: none; color:white; " href="<%=request.getContextPath()%>/DBNewServlet">+新增商品</a>
			</button>
		</div>
		
		
		
		<!-- 按鈕: 側邊1~12月-->
		<div style=" max-width: 120px;" class="mthbtn col-2 text-left">
			<button>
				<a id="a1" href="ResultServlet?month=2022-01-">01月</a>
			</button>
			<button>
				<a id="a2" href="ResultServlet?month=2022-02-">02月</a>
			</button>
			<button>
				<a id="a3" href="ResultServlet?month=2022-03-">03月</a>
			</button>
			<button>
				<a id="a4" href="ResultServlet?month=2022-04-">04月</a>
			</button>
			<button>
				<a id="a5" href="ResultServlet?month=2022-05-">05月</a>
			</button>
			<button>
				<a id="a6" href="ResultServlet?month=2022-06-">06月</a>
			</button>
			<button>
				<a id="a7" href="ResultServlet?month=2022-07-">07月</a>
			</button>
			<button>
				<a id="a8" href="ResultServlet?month=2022-08-">08月</a>
			</button>
			<button>
				<a id="a9" href="ResultServlet?month=2022-09-">09月</a>
			</button>
			<button>
				<a id="a10" href="ResultServlet?month=2022-10-">10月</a>
			</button>
			<button>
				<a id="a11" href="ResultServlet?month=2022-11-">11月</a>
			</button>
			<button>
				<a id="a12" href="ResultServlet?month=2022-12-">12月</a>
			</button>
		</div>

		
	

		<!-- 中央圖表 -->
		<div class="col-8 text-right" id="cht_container" style="font-weight:1000">
		
		<script type="text/javascript"
			src="https://fastly.jsdelivr.net/npm/echarts@5.3.3/dist/echarts.min.js"></script>
		<!-- Uncomment this line if you want to dataTool extension
    <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.3.3/dist/extension/dataTool.min.js"></script>
    -->
		<!-- Uncomment this line if you want to use gl extension
    <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts-gl@2/dist/echarts-gl.min.js"></script>
    -->
		<!-- Uncomment this line if you want to echarts-stat extension
    <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts-stat@latest/dist/ecStat.min.js"></script>
    -->
		<!-- Uncomment this line if you want to use map
    <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@4.9.0/map/js/china.js"></script>
    <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@4.9.0/map/js/world.js"></script>
    -->
		<!-- Uncomment these two lines if you want to use bmap extension
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=3.0&ak=YOUR_API_KEY"></script>
    <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.3.3/dist/extension/bmap.min.js"></script>
    -->

		<script type="text/javascript">
      var dom = document.getElementById('cht_container');
      
      var myChart = echarts.init(dom, null, {
        renderer: 'canvas',
        useDirtyRect: false
      });
      
      var app = {};
      var option;
      
      var listAdMonth1 = ${totalAdMonth};
      var listAdMonth2 = ['日總廣告次數'];
      var listAdMonth = listAdMonth2.concat(${totalAdMonth});
      var listBuyMonth1 = ['日總購買次數'];
      var listBuyMonth = listBuyMonth1.concat(${totalBuyMonth});
      var listAvgMonth1 = ['日平均廣告成功率'];
      var listAvgMonth = listAvgMonth1.concat(${avgSucMonth});
      
      setTimeout(function () {
    
        option = {
      legend: {},
      tooltip: {
        trigger: 'axis',
        showContent: false
      },
      
      dataset: {
        source: [
          ['product', '01', '02', '03', '04', '05', '06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'],
          listAdMonth,
          listBuyMonth,
          listAvgMonth
        ]
      },

      xAxis: { type: 'category' },
      yAxis: { gridIndex: 0 },
      grid: { top: '55%' },
      series: [
        {
          type: 'line',
          smooth: true,
          seriesLayoutBy: 'row',
          emphasis: { focus: 'series' }
        },
        {
          type: 'line',
          smooth: true,
          seriesLayoutBy: 'row',
          emphasis: { focus: 'series' }
        },
        {
          type: 'line',
          smooth: true,
          seriesLayoutBy: 'row',
          emphasis: { focus: 'series' }
        },
        {
          type: 'pie',
          id: 'pie',
          radius: '30%',
          center: ['50%', '25%'],
          emphasis: {
            focus: 'self'
          },
          label: {
            formatter: '{b}: {@2012} ({d}%)'
          },
          encode: {
            itemName: 'product',
            value: '2012',
            tooltip: '2012'
          }
        }
      ]
    };
        
    myChart.on('updateAxisPointer', function (event) {
      const xAxisInfo = event.axesInfo[0];
      if (xAxisInfo) {
        const dimension = xAxisInfo.value + 1;
        myChart.setOption({
          series: {
            id: 'pie',
            label: {
              formatter: '{b}: {@[' + dimension + ']} ({d}%)'
            },
            encode: {
              value: dimension,
              tooltip: dimension
            }
          }
        });
      }
    });
    myChart.setOption(option);
  });
  
      if (option && typeof option === 'object') {
        myChart.setOption(option);
      }
  
      window.addEventListener('resize', myChart.resize);
    </script>
    	<div class="text-center" style="font-weight:1000" >
				<c:out value="${chartName}" />
		</div>
	</div>
	</div>
</div>
</body>
</html>