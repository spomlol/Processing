#!/usr/bin/python3

import os;
files = os.listdir("Images-spain/")
print(files)
count = 1
for i in files:
    os.rename("Images-spain/"+i,"Images-spain/"+str(count)+".jpg")
    count+=1