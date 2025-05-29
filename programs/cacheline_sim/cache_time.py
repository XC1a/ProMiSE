import re
import math

def findZHENGZEHUA(line,strZZH):
    string=line
    strZZHobject=re.search(strZZH,string)
    if strZZHobject:
        objects=[]
        objects.append(strZZHobject.group())
        end=strZZHobject.end()
        f2.write(str(int(eval(strZZHobject.group()))>>2)+"\n")
        string=string[end:]
        strZZHobject=re.search(strZZH,string)
        while strZZHobject!=None:
            objects.append(strZZHobject.group())
            end=strZZHobject.end()
            string=string[end:]
            strZZHobject=re.search(strZZH,string)
            f2.write(str(int(eval(strZZHobject.group())))+"\n")
    else:
        f2.write("\n")
    

strZZH="0[xX][0-9a-fA-F]+"
f1=open("taraddrs_out.txt","r")
f2=open("data.txt","w")
data=f1.readlines()
for line in data:
    position=findZHENGZEHUA(line,strZZH)
f.close()

f=open("data.txt","r")
data=f.readlines()
t_hit=1
t_nohit=1

for i in range(1,32):
    for j in range(0,9):
        if 32-i>20:
            break
        if i+j>32:
            break
        hit=0
        miss=0
        tags=[0]*int(1<<(32-i-j))
        for line in data:
            if line!="\n":
                n=int(line)
                if tags[int((n>>j)&(2**(32-i-j)-1))]==n>>(32-i):
                    hit+=1
                else:
                    tags[int((n>>j)&(2**(32-i-j)-1))]=n>>(32-i)
                    miss+=1
        print(i," bits of tag, ",(32-j-i)," bits of set, ",j,"bits of offset: hit rate=",hit/(hit+miss))
        cacheline=2**(j+1)
        for t_hit in (1,2,3,4,5):
            for t_nohit in (1,5,10,20,50,100):
                print("               t_hit=",t_hit,", t_nohit=",t_nohit,", time=",hit*t_hit+miss*t_nohit*(math.ceil(cacheline/8)))
        print("\n")
