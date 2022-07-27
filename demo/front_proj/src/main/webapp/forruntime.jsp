<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
    width: 1180px;
    height:820px;
   background-image: linear-gradient(-60deg, #ff414196 0%, #fda325bd 100%);
background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
}
.logo{
position:fixed;
top:20px;
left:20px;
width:150px;
height:80px;

}
.ad{
position:fixed;
top:150px;
height:500px;
width:800px;
left:100px;

 overflow: hidden;
}

.ad ul {
    margin: 0;
    padding: 0;
    position: absolute;
}

.ad ul {
    margin: 0;
    padding: 0;
    position: absolute;
}

.ad ul.ad_slides {
    width: 3200px;
    left: 0px;
    transition: all .5s;
}

.ad ul.ad_slides li {
    width: 800px;
    height: 500px;
    overflow: hidden;
    float: left;
}

.ad ul.slides li img {
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

.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  position: fixed;
  width: 300px;
  height:50px;
  left:250px;
  bottom:50px; 
}

</style>
<body>
<div  img src=""><img class="logo" src="logo.png" ></div>
	<!-- 放置輪播廣告位置 廣告寬度800px 高度500px -->
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

                    setInterval(g, 1000);
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
                    }

                    $(window).resize(f);
                </script>
    
    
    
    
    <div class="ad">
	      <ul class="ad_slides">
                    <li><img src="https://live.staticflickr.com/65535/52186540710_8c70b19541_o.jpg" alt="" id="pic1">
                    </li>
                    <li><img src="https://live.staticflickr.com/65535/52186540680_08062048f4_o.jpg" alt="" id="pic2">
                    </li>
                    <li><img src="https://live.staticflickr.com/65535/52185034222_80bfaf8a25_o.jpg" alt="" id="pic3">
                    </li>
                    <li><img src="https://live.staticflickr.com/65535/52186055086_c40b965eea_o.jpg" alt="" id="pic4">
                    </li>
                </ul>

                <ul class="dot">
                    <li id="1"></li>
                    <li id="2"></li>
                    <li id="3"></li>
                    <li id="4"></li>
                </ul>           
            </div>
	</div>
	
	
 <form action="RuntimeServlet" method="get">
  <input type="submit" value="臉部辨識開始" class="button">
 </form>
 <script>
// Older browsers might not implement mediaDevices at all, so we set an empty object first
 <!--var video = document.querySelector('video');
  var canvas = document.querySelector('canvas');
  var ctx = canvas.getContext('2d');
  var image = document.querySelector('img');
if (navigator.mediaDevices === undefined) {
  navigator.mediaDevices = {};
}

// Some browsers partially implement mediaDevices. We can't just assign an object
// with getUserMedia as it would overwrite existing properties.
// Here, we will just add the getUserMedia property if it's missing.
if (navigator.mediaDevices.getUserMedia === undefined) {
  navigator.mediaDevices.getUserMedia = function(constraints) {

    // First get ahold of the legacy getUserMedia, if present
    var getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

    // Some browsers just don't implement it - return a rejected promise with an error
    // to keep a consistent interface
    if (!getUserMedia) {
      return Promise.reject(new Error('getUserMedia is not implemented in this browser'));
    }

    // Otherwise, wrap the call to the old navigator.getUserMedia with a Promise
    return new Promise(function(resolve, reject) {
      getUserMedia.call(navigator, constraints, resolve, reject);
    });
  }
}
function snapshot() {
      var cw = video.clientWidth;
      var ch = video.clientHeight;
      ctx.drawImage(video, 0, 0, cw, ch, 0, 0, cw / 2, ch / 3);
      image.src = canvas.toDataURL();
      image.height = ch;
      image.width = cw;
  }

  video.addEventListener('click', snapshot, false);
navigator.mediaDevices.getUserMedia({ audio: false, video: true })
.then(function(stream) {
  var video = document.querySelector('video');
  // Older browsers may not have srcObject
 // if ("srcObject" in video) {
    video.srcObject = stream;
 // } else {
    // Avoid using this in new browsers, as it is going away.
    //video.src = window.URL.createObjectURL(stream);
 // }
  video.onloadedmetadata = function(e) {
    video.play();
  };
})
.catch(function(err) {
  console.log(err.name + ": " + err.message);
});-->
</script>
</body>
</html>