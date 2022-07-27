<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>智慧購物車後端管理者頁面測試</title>
    <link rel="stylesheet" type="text/css" href="bg-index.css">
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap" rel="stylesheet">

</head>
<body>
<div class="bg_container">
    <!-- 標題 -->
    <div>
        <h1 class="title_font">I-CART後臺管理系統</h1>
    </div>
    <!-- 圖表dashboard -->
    <div>
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
    </div>
    
    <label><h2>廣告效益Dashboard</h2></label>
    <!-- 左側邊月份按鈕 -->
    <div class="mthbtn">
        <button>01月</button>
        <button>02月</button>
        <button>03月</button>
        <button>04月</button>
        <button>05月</button>
        <button>06月</button>
        <button>07月</button>
        <button>08月</button>
        <button>09月</button>
        <button>10月</button>
        <button>11月</button>
        <button>12月</button>
  
    </div>
  
    <!-- 上方按鈕: 依總體概況、按時間統計、按產品統計 -->
    <div class="listbtn">
        <button>購物車概況</button>
        <button>按時間統計</button>
        <button>按分類統計</button>
        <button>按產品統計</button>
    </div>
    <!-- 右上方新增按鈕 -->
    <div class="addbtn">
        <button>廠商新增產品</button>
    </div>

    <!-- 中央圖表 -->
    <div id="cht_container"></div>

  
    <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.3.3/dist/echarts.min.js"></script>
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
  
      setTimeout(function () {
    
        option = {
      legend: {},
      tooltip: {
        trigger: 'axis',
        showContent: false
      },
      
      dataset: {
        source: [
          ['product', '2012', '2013', '2014', '2015', '2016'],
          ['Milk Tea', 56.5, 82.1, 88.7, 70.1, 53.4],
          ['Matcha Latte', 51.1, 51.4, 55.1, 53.3, 73.8],
          ['Cheese Cocoa', 40.1, 62.2, 69.5, 36.4, 45.2],
          ['Walnut Brownie', 25.2, 37.1, 41.2, 18, 33.9]
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
    </div>
</div>
</body>
</html>