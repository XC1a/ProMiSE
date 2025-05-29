import sys
import re
import copy
import math
import random

"""
Needed to be fixed:
Some functions have no regular function return, but just a direct branch to somewhere else at the end of the 
funcion. But this kind of functions will usually not be called.
"""

atom_enum=[[[0], [1]], [[0, 0], [1, 0], [0, 1], [1, 1]], [[0, 0, 0], [1, 0, 0], [0, 1, 0], [1, 1, 0], [0, 0, 1], [1, 0, 1], [0, 1, 1], [1, 1, 1]], [[0, 0, 0, 0], [1, 0, 0, 0], [0, 1, 0, 0], [1, 1, 0, 0], [0, 0, 1, 0], [1, 0, 1, 0], [0, 1, 1, 0], [1, 1, 1, 0], [0, 0, 0, 1], [1, 0, 0, 1], [0, 1, 0, 1], [1, 1, 0, 1], [0, 0, 1, 1], [1, 0, 1, 1], [0, 1, 1, 1], [1, 1, 1, 1]], [[0, 0, 0, 0, 0], [1, 0, 0, 0, 0], [0, 1, 0, 0, 0], [1, 1, 0, 0, 0], [0, 0, 1, 0, 0], [1, 0, 1, 0, 0], [0, 1, 1, 0, 0], [1, 1, 1, 0, 0], [0, 0, 0, 1, 0], [1, 0, 0, 1, 0], [0, 1, 0, 1, 0], [1, 1, 0, 1, 0], [0, 0, 1, 1, 0], [1, 0, 1, 1, 0], [0, 1, 1, 1, 0], [1, 1, 1, 1, 0], [0, 0, 0, 0, 1], [1, 0, 0, 0, 1], [0, 1, 0, 0, 1], [1, 1, 0, 0, 1], [0, 0, 1, 0, 1], [1, 0, 1, 0, 1], [0, 1, 1, 0, 1], [1, 1, 1, 0, 1], [0, 0, 0, 1, 1], [1, 0, 0, 1, 1], [0, 1, 0, 1, 1], [1, 1, 0, 1, 1], [0, 0, 1, 1, 1], [1, 0, 1, 1, 1], [0, 1, 1, 1, 1], [1, 1, 1, 1, 1]]]

cond=['EQ','NE','CS','HS','CC','LO','MI','PL','VS','VC','HI','LS','GE','LT','GT','LE']
condexplist=['eq','ne','cs','hs','cc','lo','mi','pl','vs','vc','hi','ls','ge','lt','gt','le']
condexp='eq|ne|cs|hs|cc|lo|mi|pl|vs|vc|hi|ls|ge|lt|gt|le'

atom_size=5

all_inst_count=0
all_dbranch_count=0
all_indbranch_count=0

def get_info(text):
	global all_inst_count
	global all_dbranch_count
	global all_indbranch_count
	#===========extract basic info
	asm=[]
	bsadd=0
	nowsec=''
	for string in text:
		sec=re.findall("Disassembly of section (\S+):",string)
		if len(sec)>0:
			nowsec=sec[0]
		head=re.findall("^([\d+,a-f]+) <(\S+)>",string)
		if len(head)!=0:
			temp={'func':head[0][1],'sec':nowsec,'sadd':int(head[0][0],16),'eadd':int(head[0][0],16),'branch':[],'comment':[]}
			bsadd=int(head[0][0],16)
			asm.append(temp)
		else:
			info=re.findall("^\s*([\d+,a-f]+):\s+\S+\s+(nop)()()",string)
			if len(info)==0:
				info=re.findall("^\s*([\d+,a-f]+):\s+\S+\s+(\S+)\s*(\S*)\s*(.*)",string)
			#comment=re.findall(".*;\s*(0x[0-9,a-f]+)",string)
			print(info)
			if len(info)!=0:
				if len(info[0][3])>0:
					asm[-1]['comment'].append(info[0][3])
					#comment=int(comment[0][2:],16)
					#print hex(comment)
				if bsadd==[]:
					bsadd=int(info[0][0],16)
				asm[-1]['eadd']=int(info[0][0],16)
				print(info)
				temp=get_branch(info,bsadd)
				if temp!=[]:
					#print temp
					asm[-1]['branch'].append(temp)
					bsadd=[]
					if temp['ind']:
						all_indbranch_count+=1
					else:
						all_dbranch_count+=1
				all_inst_count+=1
	#find the possible 
	for i in range(len(asm)):
		poss_tar=[]
		for cmt in asm[i]['comment']:
			r=re.findall("([\d+,a-f]+)",cmt)
			if len(r)>0:
				addr=int(r[0],16)
				found=0
				for a in asm:
					if a['sadd']==addr:
						found=1
						break
				if found:
					poss_tar.append(addr)
		if len(poss_tar)>0:
			for ib in range(len(asm[i]['branch'])):
				if asm[i]['branch'][ib]['return']==0 and asm[i]['branch'][ib]['fix']==0:
					asm[i]['branch'][ib]['d']=poss_tar
	#print 'direct branch ratio:',float(all_dbranch_count)/all_inst_count*100,'%'
	#print 'indirect branch ratio:',float(all_indbranch_count)/all_inst_count*100,'%'
	return asm

def get_branch(info,bsadd):
	#print info[0]
	temp=[]
	parts=info[0][2].split(',')
	for i in range(len(parts)):
		parts[i]=parts[i].replace("{","")
		parts[i]=parts[i].replace("}","")
		parts[i]=parts[i].replace("[","")
		parts[i]=parts[i].replace("]","")
		parts[i]=parts[i].replace(",","")
	"""
	if info[0][1][0]=='b' and len(re.findall("bfc|bfi|bic|bkpt",info[0][1]))==0:#branch instruction
		temp={'bs':bsadd,'be':int(info[0][0],16),'d':parts[0],'func':[],'ind':0,'fix':0,'remark':'n'}
		if len(re.findall("r",parts[0]))!=0 and parts[0]!="lr":
			temp['d']+="+++++++++++++++++++++"
		func=re.findall("<(\S+)>",parts[-1]);
		if len(func)>0:
			temp['func']=func[0];
		else:
			temp['ind']=1#indirect branch
			#print info[0]
	"""
	if info[0][1]=='jalr' or info[0][1]=='jr':#indirect branch
		temp={'bs':bsadd,'be':int(info[0][0],16),'d':[],'func':[],'ind':0,'fix':0,'return':0,'remark':'n'}
		func=re.findall("<(\S+)>",parts[-1]);
		if len(func)>0:
			temp['func']=func[0];
		temp['ind']=1#indirect branch
	elif info[0][1]=='ret':#return
		temp={'bs':bsadd,'be':int(info[0][0],16),'d':[],'func':[],'ind':0,'fix':0,'return':1,'remark':'n'}
		temp['ind']=1#indirect branch
	
	head=info[0][1].split('!')[0]
	head=head.split('.')[0]
	"""
	if not (info[0][1]=="cbz" or info[0][1]=="cbnz") and len(temp)>0 and (head[-2:] not in condexplist):#there is no condition code
		temp['fix']=1
	"""
	return temp

def out_asm(asm,filename):
	bound=[]
	for a in asm:
		if a['sec']=='.text':
			if bound==[]:
				bound=[a['sadd'],a['eadd']]
			else:
				if a['sadd']<bound[0]:
					bound[0]=a['sadd']
				if a['eadd']>bound[1]:
					bound[1]=a['eadd']
	f=open(filename,'wb')
	f.write('bound: '+hex(bound[0])[2:]+','+hex(bound[1])[2:]+'\n')
	for a in asm:
		f.write('function: '+a['func']+' at section '+a['sec']+'\n')
		f.write('start at '+str(hex(a['sadd']))[2:]+' end at '+str(hex(a['eadd'])[2:])+'\n')
		f.write('comment: ')
		if len(a['comment'])>0:
			for i_c in range(len(a['comment'])-1):
				f.write(a['comment'][i_c])
				f.write('|')
			f.write(a['comment'][-1])
		f.write('\n')
		for b in a['branch']:
			f.write('branch: start '+str(hex(b['bs']))[2:]+' source '+str(hex(b['be']))[2:]+' to '+str(b['d'])+' fix '+str(b['fix'])+' ind '+str(b['ind'])+' remark '+b['remark']+' return '+str(b['return'])+'\n')
	f.close()

def out_funcs(asm,filename):
	f=open(filename,'wb')
	for a in asm:
		f.write(a['func']+'\n')
	f.close()

def out_results(asm,filename):
	bound=[]
	for a in asm:
		if a['sec']=='.text':
			if bound==[]:
				bound=[a['sadd'],a['eadd']]
			else:
				if a['sadd']<bound[0]:
					bound[0]=a['sadd']
				if a['eadd']>bound[1]:
					bound[1]=a['eadd']
	f=open(filename,'wb')
	for a in asm:
		for b in a['branch']:
			f.write('branch: '+hex(b['be'])[2:]+'\n')
			f.write('isret: '+str(b['return'])+'\n')
			f.write('target:\n')
			for br in b['d']:
				f.write(hex(br)[2:]+'\n')
	f.close()

def build_table(keys,bitlen,table,numtables):
	#bitlen is the bit length of one level from the key
	table['entries']=[{'keys':[],'ntable':[]} for i in range(2**bitlen)]
	for key in keys:
		entry=(key>>(table['level']*bitlen))&((1<<bitlen)-1)
		table['entries'][entry]['keys'].append(key)
	for ie in range(len(table['entries'])):
		if len(table['entries'][ie]['keys'])>1:
			numtables[0]+=1
			table['entries'][ie]['ntable']={'level':table['level']+1,'prevbits':table['prevbits']+(ie<<(table['level']*bitlen)),'num':numtables[0],'entries':[]}
			build_table(table['entries'][ie]['keys'],bitlen,table['entries'][ie]['ntable'],numtables)

def write_word(f,data,size):
	#size is byte
	for s in range(size):
		f.write(chr((data>>(s*8))&0x000000ff))

def out_table(asm,filename):
	#output the table with the results in binary
	bitlen=4
	tentrybit=64
	rentrybit=64
	bound=[]
	for a in asm:
		if a['sec']=='.text':
			if bound==[]:
				bound=[a['sadd'],a['eadd']]
			else:
				if a['sadd']<bound[0]:
					bound[0]=a['sadd']
				if a['eadd']>bound[1]:
					bound[1]=a['eadd']
	indbranches=[]
	for a in asm:
		for b in a['branch']:
			if b['return']==0:
				indbranches.append({'pc':b['be'],'target':[],'rtablebase':0})
			for br in b['d']:
				indbranches[-1]['target'].append(br)
	allpcs=[ind['pc'] for ind in indbranches]
	#allpcs=[0x332800,0x212800,0x313421,0x213421,0x212801]
	if len(set(allpcs))!=len(allpcs):
		print("ERROR: duplicated branches!")
		exit(0)
	table={'level':0,'prevbits':0,'num':0,'entries':[]}
	numtables=[0]
	build_table(allpcs,bitlen,table,numtables)
	print("total tables:",numtables[0])

	#build results (target address) table, containing all the results
	rtable=[]
	nowrtablebase=0
	for iind in range(len(indbranches)):
		rtable.extend(indbranches[iind]['target'])
		indbranches[iind]['rtablebase']=nowrtablebase
		nowrtablebase+=len(indbranches[iind]['target'])
	
	#build trans table
	alltables=[table]
	for entry in table['entries']:
		if entry['ntable']!=[]:
			alltables.append(entry['ntable'])
	#raddr=len(alltables)*(2**bitlen)*entrybit/8
	ttable=[0 for i in range(len(alltables)*(2**bitlen))]
	for table in alltables:
		tbase=table['num']*(2**bitlen)
		ie=0
		for entry in table['entries']:
			if len(entry['keys'])==1:
				indidx=allpcs.index(entry['keys'][0])
				data=indbranches[indidx]['rtablebase']+(len(indbranches[indidx]['target'])<<(rentrybit/2))
				ttable[tbase+ie]=data|(1<<(tentrybit-1))
			elif len(entry['keys'])>1:
				ntable=entry['ntable']
				data=ntable['num']*(2**bitlen)
				ttable[tbase+ie]=data
			ie+=1
	i=0
	for ttab in ttable:
		print('CFG[ ' + hex(i)+'] ='+hex(ttab) + ';')
		i+=1

	for rtab in rtable:
		print('CFG[ ' + hex(i)+'] ='+hex(rtab)+ ';')
		i+=1
	i=0
	f=open(filename,'wb')
	#format:
	#trans table length(num of entries), 64bits
	#trans table entry bytes, 32bits
	#result table entry bytes, 32bits
	#trans table
	#[0-1bit,next table at which entry of ttable-63bit]
	#or [1-1bit,target length-31bit,first target is at which entry of rtable-32bit]
	#result table
	#[the target]
	write_word(f,len(alltables)*(2**bitlen),8)
	write_word(f,tentrybit,4)
	write_word(f,rentrybit,4)
	for ttab in ttable:
		write_word(f,ttab,tentrybit/8)
	for rtab in rtable:
		write_word(f,rtab,rentrybit/8)
	f.close()
	return table

def print_table(table):
	ntables=[]
	print("-------")
	print("level:",table['level'])
	print("prevbits:",hex(table['prevbits']))
	print("level:",table['level'])
	print("num:",table['num'])
	i=0
	for entry in table['entries']:
		s=''
		for key in entry['keys']:
			s+=hex(key)+' '
		print(i,s)
		if entry['ntable']!=[]:
			ntables.append(entry['ntable'])
		i+=1
	for ntable in ntables:
		print_table(ntable)

if __name__=="__main__":
	f=open(sys.argv[1],'r')
	text=[]
	for line in f:
		text.append(line[0:-1])
	f.close()
	asm=get_info(text)
	"""
	for a in asm:
		print '------'
		print a
	"""
	out_asm(asm,'raw')
	out_funcs(asm,'out_funcs')
	out_results(asm,'br2tar')
	table=out_table(asm,'cfitable')
	print_table(table)

	
