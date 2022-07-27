from imutils.video import VideoStream
from pyzbar import pyzbar
import argparse
import datetime
import imutils
import time
import cv2


# 建立引數解析器，解析引數
ap = argparse.ArgumentParser()
ap.add_argument("-o", "--output", type=str, default="barcodes.csv",help="path to output CSV file containing barcodes")
args = vars(ap.parse_args())

# 初始化視訊流，讓攝像頭熱熱身
print("[INFO] starting video stream...")

#vs = VideoStream(src=0).start()    ＃內建相機
#vs = VideoStream(usePiCamera=True).start() #樹莓派相機
#time.sleep(2.0)

# 開啟輸出CSV檔案，用來寫入和初始化迄今發現的所有條形碼
csv = open(args["output"], "w")
found = set()

cam = cv2.VideoCapture(0)
# 迴圈來自視訊流的幀
while True:
 # 抓取來自單執行緒視訊流的幀， 
 # 將大小重新調整為最大寬度400畫素
 frame = cam.read()
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
  cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 2)

  # 如果條形碼文字目前不在CSV檔案中, write
  # 就將時間戳+條形碼 to disk and update the set
  if barcodeData not in found:
   csv.write("{},{}\n".format(datetime.datetime.now(),
    barcodeData))
   csv.flush()
   found.add(barcodeData)

    # 展示輸出幀
 cv2.imshow("Barcode Scanner", frame)
 key = cv2.waitKey(1) & 0xFF

 # 如果按下”q”鍵就停止迴圈
 if key == ord("q"):
  break

# 關閉輸出CSV檔案進行清除
print("[INFO] cleaning up...")
csv.close()
cv2.destroyAllWindows()
cam.stop()