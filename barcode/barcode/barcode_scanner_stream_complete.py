from contextlib import nullcontext
from imutils.video import VideoStream
from pyzbar import pyzbar
import argparse
import datetime
import imutils
import time
import cv2
import requests

while True:
  # 建立引數解析器，解析引數
  ap = argparse.ArgumentParser()
  ap.add_argument("-o", "--output", type=str, default="barcodes.csv",help="path to output CSV file containing barcodes")
  args = vars(ap.parse_args())

  # 初始化視訊流，讓攝像頭熱熱身
  print("[INFO] 攝影機開始串流")
  print("[INFO] 開始條碼串流辨識...")

  # vs = VideoStream(src=0).start() #電腦裝置內建相機
  vs = VideoStream(src="http://192.168.22.117:8080/video").start() #連接到安卓手機的程式相機
  #vs = VideoStream(usePiCamera=True).start() ＃樹莓派相機
  time.sleep(1.0)

  # 迴圈來自視訊流的幀
  while True:
  # 抓取來自單執行緒視訊流的幀， 
  # 將大小重新調整為最大寬度400畫素
    frame = vs.read()
    frame = imutils.resize(frame, width=400)

    # 找到視訊中的條形碼，並解析所有條形碼
    barcodes = pyzbar.decode(frame)

    # 迴圈檢測到的條形碼
    for barcode in barcodes:
      # 提取條形碼的邊界框位置
      # 繪出圍繞影象上條形碼的邊界框
      (x, y, w, h) = barcode.rect
      cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 0, 255), 2)

      # 條形碼資料為位元組物件，所以如果我們想把它畫出來
      # 需要先把它轉換成字串
      barcodeData = barcode.data.decode("utf-8")
      barcodeType = barcode.type

      # 繪出影象上的條形碼資料和型別
      text = "{} ({})".format(barcodeData, barcodeType)
      cv2.putText(frame, text, (x, y - 10),
      cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 1)

      # 展示輸出幀
    cv2.imshow("Barcode Scanner", frame)
    key = cv2.waitKey(1) & 0xFF

      #條件判斷，有偵測到條碼即離開程式
    if len(barcodes) > 0:
      break

    # 如果按下”q”鍵就停止迴圈
    if key == ord("q"):
      break

  print("商品名稱："+barcodeData)

  code=barcodeData #?? 他收的參數 都是以code 

  #回傳辨識結果給Java Server
  import requests
  import json

  url = "http://localhost/front_proj/UserServletInsert"

  payload = json.dumps({
    "name": barcodeData
  })
  headers = {
    'Content-Type': 'application/json',
    'Cookie': 'JSESSIONID=854DE83F603B30B0352D17848F036D05'
  }
  response = requests.request("GET", url, headers=headers, data=payload)
  print(response.text)

  import requests
  url = "http://localhost:8080/front_proj/UserServletInsert?name="+code

  payload={}
  headers = {
  'Cookie': 'JSESSIONID=1539F8BC2B5947E2BC08F5E3CCCE28A6'
  }

#   import requests
#   import json

#   url = "http://localhost:8080/front_proj/UserServletInsert"

#   payload = json.dumps({
#     "name": "舒適水次元3刀片刮鬍刀架"
#   })
#   headers = {
#     'Content-Type': 'application/json',
#     'Cookie': 'JSESSIONID=1539F8BC2B5947E2BC08F5E3CCCE28A6'
# }


  response = requests.request("POST", url, headers=headers, data=payload)

  print(response.text)
  print(code)
 
  cv2.destroyAllWindows()
  vs.stop()
  
  print("辨識完成，商品已回傳")
  
  if key == ord("q"):
      break

print("[INFO] Over")



  

