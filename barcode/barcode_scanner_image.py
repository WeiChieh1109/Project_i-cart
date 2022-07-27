# 匯入所需工具包
from pyzbar import pyzbar
import argparse
import cv2

# 構建引數解析器並解析引數
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required=True,
 help="path to input image")
args = vars(ap.parse_args())

# 載入輸入影象
image = cv2.imread(args["image"])

# 找到影象中的條形碼並進行解碼
barcodes = pyzbar.decode(image)

# 迴圈檢測到的條形碼
for barcode in barcodes:
 # 提取條形碼的邊界框的位置
 # 畫出影象中條形碼的邊界框
 (x, y, w, h) = barcode.rect
 cv2.rectangle(image, (x, y), (x + w, y + h), (0, 0, 255), 2)

 # 條形碼資料為位元組物件，所以如果我們想在輸出影象上
 # 畫出來，就需要先將它轉換成字串
 barcodeData = barcode.data.decode("utf-8")
 barcodeType = barcode.type

 # 繪出影象上條形碼的資料和條形碼型別
 text = "{} ({})".format(barcodeData, barcodeType)
 cv2.putText(image, text, (x, y - 10), cv2.FONT_HERSHEY_SIMPLEX,
  0.5, (0, 0, 255), 2)

 # 向終端列印條形碼資料和條形碼型別
 print("[INFO] Found {} barcode: {}".format(barcodeType, barcodeData))

# 展示輸出影象
cv2.imshow("Image", image)
cv2.waitKey(0)