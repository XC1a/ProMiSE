import re
import sys

f=open(sys.argv[1],'r')
text=f.readlines()
f.close()

results=[[0,0.0] for i in range(20)]

state=0
for t in text:
	if state==0:
		r=re.findall("^18  bits of tag,.*(\S+) bits of offset: hit rate= (\S+)",t)
		if len(r)>0:
			off=int(r[0][0])
			results[off][1]=float(r[0][1])
			state=1
	elif state==1:
		r=re.findall("t_hit= 1 , t_nohit= 20 , time= (\S+)",t)
		if len(r)>0:
			results[off][0]=int(r[0])
			state=0

base=results[0][0]
for i in range(len(results)):
	results[i][0]=float(results[i][0])/base
i=0
for r in results:
	print i,r[0],r[1]
	i+=1
