#!/usr/bin/python3

import os
from PIL import Image
from resizeimage import resizeimage
files = os.listdir("Images-spain/")
print(files)
count = 1
""" for i in files:
    os.rename("Images-spain/"+i,"Images-spain/"+str(count)+".jpg")
    count+=1 """

for i in os.listdir("Images-spain/"):
    img = Image.open("Images-spain/"+str(i))
    img = resizeimage.resize_width(img, 400)
    img.save("Images-spain/resized-"+str(count)+'.jpeg', "jpeg")
    count+=1
