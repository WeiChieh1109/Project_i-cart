#! /usr/bin/python2

import time
import sys
import requests

while True:
    EMULATE_HX711=False

    referenceUnit = 1
            
    if not EMULATE_HX711:   #裝置選擇if條件判斷
        import RPi.GPIO as GPIO
        from hx711 import HX711
    else:
        from emulated_hx711 import HX711

    def cleanAndExit():
        print("Cleaning...")

        if not EMULATE_HX711:
            GPIO.cleanup()
            
        print("Bye!")
        sys.exit()

    hx = HX711(5, 6)

    # I've found out that, for some reason, the order of the bytes is not always the same between versions of python, numpy and the hx711 itself.
    # Still need to figure out why does it change.
    # If you're experiencing super random values, change these values to MSB or LSB until to get more stable values.
    # There is some code below to debug and log the order of the bits and the bytes.
    # The first parameter is the order in which the bytes are used to build the "long" value.
    # The second paramter is the order of the bits inside each byte.
    # According to the HX711 Datasheet, the second parameter is MSB so you shouldn't need to modify it.
    hx.set_reading_format("MSB", "MSB")

    # HOW TO CALCULATE THE REFFERENCE UNIT
    # To set the reference unit to 1. Put 1kg on your sensor or anything you have and know exactly how much it weights.
    # In this case, 92 is 1 gram because, with 1 as a reference unit I got numbers near 0 without any weight
    # and I got numbers around 184000 when I added 2kg. So, according to the rule of thirds:
    # If 2000 grams is 184000 then 1000 grams is 184000 / 2000 = 92.
    #hx.set_reference_unit(113)
    hx.set_reference_unit(457)
    #hx.set_reference_unit(referenceUnit)

    hx.reset() #重量歸零

    hx.tare() #扣重歸零(去除目前或容器重)

    print("重置完成，請秤重")

    # to use both channels, you'll need to tare them both
    #hx.tare_A()
    #hx.tare_B()

    old_weight=0
    while True: #執行秤重無限迴圈

        weight = int(hx.get_weight(3))#秤重評估時間//並轉字串
        
        if weight !=0:
            time.sleep(2)
            count=0
            list_weight=[]
            i=1
            while count<10: #有物品時，秤重迴圈10次
                try:
                    # These three lines are usefull to debug wether to use MSB or LSB in the reading formats
                    # for the first parameter of "hx.set_reading_format("LSB", "MSB")".
                    # Comment the two lines "val = hx.get_weight(5)" and "print val" and uncomment these three lines to see what it prints.
                    
                    # np_arr8_string = hx.get_np_arr8_string()
                    # binary_string = hx.get_binary_string()
                    # print binary_string + " " + np_arr8_string
                    
                    # Prints the weight. Comment if you're debbuging the MSB and LSB issue.
                    val1 = hx.get_weight(3) #秤重評估時間
                    val=str(int(val1))
                    I=str(i)
                    print("("+I+")"+"商品重量:"+val+" g")
                    list_weight.append(val)

                    # To get weight from both channels (if you have load cells hooked up 
                    # to both channel A and B), do something like this
                    #val_A = hx.get_weight_A(5)
                    #val_B = hx.get_weight_B(5)
                    #print "A: %s  B: %s" % ( val_A, val_B )
                  
                    hx.power_down()
                    hx.power_up()
                    time.sleep(0.3)
                    count=count+1
                    i=i+1

                except (KeyboardInterrupt, SystemExit):
                    cleanAndExit()

            maxlabel_weight=max(list_weight,key=list_weight.count)
            print(list_weight)
            weight=maxlabel_weight
            print("目前商品重量"+weight)


            increase_weight=int(weight)-int(old_weight)
            if old_weight != increase_weight:
                print("增加重量:")
                print(increase_weight)#重量差
                old_weight=weight
                #以下 添加postman重量值回傳程式碼
                # if increase_weight>5 or increase_weight<-5:
                #   increase_weight=str(increase_weight)
                #   import requests
                #   url = "http://192.168.22.177:8080/front_proj/GainWeight0721?weight="+increase_weight

                #   payload={}
                #   headers = {}

                #   response = requests.request("GET", url, headers=headers, data=payload)

                #   print(response.text)
                
                #   print("資料已回傳")
            

            

        else :
            print("Nothing")
