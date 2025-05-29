import re
import sys

pathtime='/home/lf/hams/freedom/programs/dfi_results/'
pathbuild='/home/lf/hams/'

baseutil={'lut':59163,'ram':81}
basennmshrutil={'lut':49482,'ram':103}

cases=[401,429,433,445,456,458,462,470,473]

casenames=[
'401.bzip2',
'429.mcf',
'433.milc',
'445.gobmk',
'456.hmmer',
'458.sjeng',
'462.libquantum',
'470.lbm',
'473.astar',
]

modes={
'ori':['results_ori_soft.txt','ori'],
'soft':['results_ori_soft.txt','soft'],
'ori_nmshr':['results_ori_soft_fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr.txt','ori'],
'soft_nmshr':['results_ori_soft_fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr.txt','soft'],
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr':['results_ori_soft_fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr.txt','rocc'],

'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc1':['results_fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc1.txt','rocc'],
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc10':['results_fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc10.txt','rocc'],
'fsl2_ff1_ldopt2_rdsc1_rdsmc10_rdtc1':['results_fsl2_ff1_ldopt2_rdsc1_rdsmc10_rdtc1.txt','rocc'],
'fsl2_ff1_ldopt2_rdsc10_rdsmc1_rdtc1':['results_fsl2_ff1_ldopt2_rdsc10_rdsmc1_rdtc1.txt','rocc'],
'fsl2_ff2_ldopt64_rdsc1_rdsmc1_rdtc1':['results_fsl2_ff2_ldopt64_rdsc1_rdsmc1_rdtc1.txt','rocc'],
'fsl64_ff8_ldopt2_rdsc1_rdsmc1_rdtc1':['results_fsl64_ff8_ldopt2_rdsc1_rdsmc1_rdtc1.txt','rocc'],
'fsl1_ff1_ldopt64_rdsc12_rdsmc12_rdtc12':['results_fsl1_ff1_ldopt64_rdsc12_rdsmc12_rdtc12.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc12_rdsmc12_rdtc12':['results_fsl64_ff8_ldopt64_rdsc12_rdsmc12_rdtc12.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc12_rdsmc12_rdtc8':['results_fsl64_ff8_ldopt64_rdsc12_rdsmc12_rdtc8.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc12_rdsmc12_rdtc14':['results_fsl64_ff8_ldopt64_rdsc12_rdsmc12_rdtc14.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc8_rdsmc12_rdtc12':['results_fsl64_ff8_ldopt64_rdsc8_rdsmc12_rdtc12.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc8_rdsmc8_rdtc12':['results_fsl64_ff8_ldopt64_rdsc8_rdsmc8_rdtc12.txt','rocc'],

'fsl16_ff2_ldopt2_rdsc1_rdsmc1_rdtc1':['results_fsl16_ff2_ldopt2_rdsc1_rdsmc1_rdtc1.txt','rocc'],
'fsl2_ff1_ldopt16_rdsc1_rdsmc1_rdtc1':['results_fsl2_ff1_ldopt16_rdsc1_rdsmc1_rdtc1.txt','rocc'],
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc5':['results_fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc5.txt','rocc'],
'fsl2_ff1_ldopt2_rdsc1_rdsmc5_rdtc1':['results_fsl2_ff1_ldopt2_rdsc1_rdsmc5_rdtc1.txt','rocc'],
'fsl2_ff1_ldopt2_rdsc5_rdsmc1_rdtc1':['results_fsl2_ff1_ldopt2_rdsc5_rdsmc1_rdtc1.txt','rocc'],


'fsl64_ff8_ldopt32_rdsc10_rdsmc10_rdtc10':['results_fsl64_ff8_ldopt32_rdsc10_rdsmc10_rdtc10.txt','rocc'],
'fsl64_ff8_ldopt128_rdsc10_rdsmc10_rdtc10':['results_fsl64_ff8_ldopt128_rdsc10_rdsmc10_rdtc10.txt','rocc'],

'fsl2_ff1_ldopt64_rdsc10_rdsmc10_rdtc10':['results_fsl2_ff1_ldopt64_rdsc10_rdsmc10_rdtc10.txt','rocc'],
'fsl256_ff32_ldopt64_rdsc10_rdsmc10_rdtc10':['results_fsl256_ff32_ldopt64_rdsc10_rdsmc10_rdtc10.txt','rocc'],

'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest':['results_fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest3':['results_fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest3.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest4':['results_fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest4.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest_libstall':['results_fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest_libstall.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc1_rdsmc1_rdtc1_64KBc':['results_fsl64_ff8_ldopt64_rdsc1_rdsmc1_rdtc1_64KBc.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc1_rdsmc1_rdtc1_32KBc':['results_fsl64_ff8_ldopt64_rdsc1_rdsmc1_rdtc1_32KBc.txt','rocc'],

'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10':['results_fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc12_rdsmc10_rdtc10':['results_fsl64_ff8_ldopt64_rdsc12_rdsmc10_rdtc10.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc8_rdsmc10_rdtc10':['results_fsl64_ff8_ldopt64_rdsc8_rdsmc10_rdtc10.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc10_rdsmc8_rdtc10':['results_fsl64_ff8_ldopt64_rdsc10_rdsmc8_rdtc10.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc10_rdsmc12_rdtc10':['results_fsl64_ff8_ldopt64_rdsc10_rdsmc12_rdtc10.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc8':['results_fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc8.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc12':['results_fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc12.txt','rocc'],

'fsl64_ff8_ldopt64_rdsc8_rdsmc8_rdtc8':['results_fsl64_ff8_ldopt64_rdsc8_rdsmc8_rdtc8.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc4_rdsmc4_rdtc12':['results_fsl64_ff8_ldopt64_rdsc4_rdsmc4_rdtc12.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc4_rdsmc4_rdtc4':['results_fsl64_ff8_ldopt64_rdsc4_rdsmc4_rdtc4.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc1_rdsmc1_rdtc12':['results_fsl64_ff8_ldopt64_rdsc1_rdsmc1_rdtc12.txt','rocc'],
'fsl64_ff8_ldopt64_rdsc1_rdsmc1_rdtc1':['results_fsl64_ff8_ldopt64_rdsc1_rdsmc1_rdtc1.txt','rocc'],
'fsl256_ff32_ldopt64_rdsc12_rdsmc12_rdtc12':['results_fsl256_ff32_ldopt64_rdsc12_rdsmc12_rdtc12.txt','rocc'],
'fsl256_ff32_ldopt64_rdsc8_rdsmc8_rdtc12':['results_fsl256_ff32_ldopt64_rdsc8_rdsmc8_rdtc12.txt','rocc'],
'fsl256_ff32_ldopt64_rdsc8_rdsmc8_rdtc8':['results_fsl256_ff32_ldopt64_rdsc8_rdsmc8_rdtc8.txt','rocc'],
'fsl512_ff64_ldopt64_rdsc12_rdsmc12_rdtc12':['results_fsl512_ff64_ldopt64_rdsc12_rdsmc12_rdtc12.txt','rocc'],
'fsl1024_ff128_ldopt64_rdsc12_rdsmc12_rdtc12':['results_fsl1024_ff128_ldopt64_rdsc12_rdsmc12_rdtc12.txt','rocc'],
}

data2mean={
'2':'total_req_num',
'8':'store_op_num',
'9':'load_op_num',
'10':'Updata RDTable',
'11':'Load RDTable',
'12':'Load RDSmap',
'13':'Load RDSet',
'22':'Load Opt Hit',
'23':'Load Opt Miss',
'24':'RDTable Cache Hit',
'25':'RDSmap Cache Hit',
'28':'RDS Cache Hit',
'29':'RDTable Cache Miss',
'30':'RDSmap Cache Miss',
'31':'RDS Cache Miss',

'32':'Lat Call Num',
'33':'Lat Call Cycles',
'34':'Lat Libst Num',
'35':'Lat Libst Cycles',
'36':'Lat Libld Num',
'37':'Lat Libld Cycles',
'38':'Lat Libstld Num',
'39':'Lat Libstld Cycles',
'40':'Lat Ret Num',
'41':'Lat Ret Cycles',
'42':'Lat St Num',
'43':'Lat St Cycles',
'44':'Lat Ld Num',
'45':'Lat Ld Cycles',

'53':'store_req_num',
'54':'load_req_num',
'55':'call_req_num',
'57':'lat_count',
'58':'lat_cycle_total',
}

data2meankeys=[int(k) for k in data2mean.keys()]
privdata=[0 for d in range(60)]

results={}
utils={}

for m in modes.keys():
	results[m]=[{'time':0.0,'data':[0 for d in range(60)]} for i in range(len(cases))]
	utils[m]={'lut':0,'ram':0,'ff':0}
	
state=0
recordeddata=0

for m in modes.keys():
	f=open(pathtime+modes[m][0],'r')
	text=f.readlines()
	f.close()
	privdata=[0 for d in range(60)]
	state=0
	for t in text:
		r=re.findall('flang: reset',t)
		if len(r)>0:
			privdata=[0 for d in range(60)]
		r=re.findall('(\S+) -> (\S+)',t)
		if len(r)>0:
			if state==1 or recordeddata==0:
				#if m=='fsl256_ff32_ldopt64_rdsc12_rdsmc12_rdtc12' and nowc==1:
				#	print r[0][0],r[0][1],int(r[0][1],16),privdata[int(r[0][0],16)]
				results[m][nowc]['data'][int(r[0][0],16)]=int(r[0][1],16)-privdata[int(r[0][0],16)]
				if int(r[0][0],16)>=59:
					recordeddata=1
			privdata[int(r[0][0],16)]=int(r[0][1],16)
		if state==0:
			r=re.findall('^(\d+)_(\S+)',t)
			if len(r)>0 and int(r[0][0]) in cases and r[0][1]==modes[m][1]:
				nowc=cases.index(int(r[0][0]))
				recordeddata=0
				state=1
		elif state==1:
			r=re.findall('^(\d+)_(\S+)',t)
			if len(r)>0 and int(r[0][0]) in cases:
				if r[0][1]==modes[m][1]:
					nowc=cases.index(int(r[0][0]))
					recordeddata=0
					state=1
				else:
					state=0
			if len(re.findall('^sys\s+\S+',t))>0:
				state=0
			r=re.findall('real\s+(\S+)s',t)
			if len(r)>0:
				results[m][nowc]['time']=float(r[0])
				continue
			r=re.findall('real\s+(\S+)m\s+(\S+)s',t)
			if len(r)>0:
				results[m][nowc]['time']=float(r[0][0])*60+float(r[0][1])
				continue
			r=re.findall('real\s+(\S+)h\s+(\S+)m\s+(\S+)s',t)
			if len(r)>0:
				results[m][nowc]['time']=float(r[0][0])*60*60+float(r[0][1])*60+float(r[0][2])
				continue
	
	try:
		f=open(pathbuild+'build_'+m+'/report/utilization.txt','r')
		text=f.readlines()
		f.close()
		for t in text:
			r=re.findall('XCVU440Shell\s+\|\s+\(top\)\s+\|\s+(\d+)\s+\|\s+(\d+)\s+\|\s+(\d+)\s+\|\s+(\d+)\s+\|\s+(\d+)\s+\|\s+(\d+)\s+\|\s+(\d+)\s+\|\s+(\d+)\s+\|\s+(\d+)\s+\|',t)
			if len(r)>0:
				utils[m]['lut']=int(r[0][0])
				utils[m]['ram']=2*int(r[0][5])+int(r[0][6])
				utils[m]['ff']=int(r[0][4])
				break
	except:
		continue

avg={}
for m in modes.keys():
	avg[m]=0.0

print '--------data---------'
for m in modes.keys():
	if m!='ori' and m!='soft':
		for ic in range(len(cases)):
			print '+++++++++',cases[ic],m,
			for d in range(60):
				if d in data2meankeys:
					print data2mean[str(d)],results[m][ic]['data'][d]


print '--------time--------'
for m in modes.keys():
	if m!='ori' and m!='ori_nmshr':
		if m=='soft_nmshr' or m=='fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr':
			for ic in range(len(cases)):
				print cases[ic],m,(results[m][ic]['time']-results['ori_nmshr'][ic]['time'])/results['ori_nmshr'][ic]['time']
				avg[m]+=(results[m][ic]['time']-results['ori_nmshr'][ic]['time'])/results['ori_nmshr'][ic]['time']
		else:
			for ic in range(len(cases)):
				print cases[ic],m,(results[m][ic]['time']-results['ori'][ic]['time'])/results['ori'][ic]['time']
				avg[m]+=(results[m][ic]['time']-results['ori'][ic]['time'])/results['ori'][ic]['time']

print '--------avg----------'
tobeprint=[]
for m in modes.keys():
	avg[m]=avg[m]/len(cases)
	tobeprint.append(str(m)+' '+str(avg[m]))
tobeprint=sorted(tobeprint)
for t in tobeprint:
	print t


print '=========overhead============'
fronts=[
'\multirow{11}{*}{\\rotatebox[origin=c]{90}{Benchmark}}',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
]

ov=[
'soft_nmshr',
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr',
'soft',
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl64_ff8_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl2_ff2_ldopt64_rdsc1_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc10_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc10_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc10',
'fsl64_ff8_ldopt64_rdsc1_rdsmc1_rdtc1_64KBc',
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10',
]

s=''
s+='\multicolumn{2}{|c||}{\multirow{2}{*}{\# of LUTs}} & '
io=0
for o in ov:
	if o in modes.keys():
		if o=='soft':
			s+='\multirow{2}{*}{'+str(utils['ori']['lut'])+'}'
		elif o=='soft_nmshr':
			s+='\multirow{2}{*}{'+str(utils['ori_nmshr']['lut'])+'}'
		elif o=='fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr':
			s+=str(utils[o]['lut'])
		else:
			s+=str(utils[o]['lut'])
	if io==len(ov)-1:
		s+=' \\\\\n'
	else:
		s+=' & '
	io+=1
s+='\multicolumn{2}{|c||}{} & '
io=0
for o in ov:
	if o in modes.keys():
		if o=='soft':
			s+=''
		elif o=='soft_nmshr':
			s+=''
		elif o=='fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr':
			s+="{:.1f}".format(float(utils[o]['lut']-utils['ori_nmshr']['lut'])/utils['ori_nmshr']['lut']*100)+'\%$^\dagger$'
		else:
			s+="{:.1f}".format(float(utils[o]['lut']-utils['ori']['lut'])/utils['ori']['lut']*100)+'\%'
	if io==len(ov)-1:
		s+=' \\\\\\hline\n'
	else:
		s+=' & '
	io+=1
s+='\multicolumn{2}{|c||}{\multirow{2}{*}{\# of FFs}} & '
io=0
for o in ov:
	if o in modes.keys():
		if o=='soft':
			s+='\multirow{2}{*}{'+str(utils['ori']['ff'])+'}'
		elif o=='soft_nmshr':
			s+='\multirow{2}{*}{'+str(utils['ori_nmshr']['ff'])+'}'
		elif o=='fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr':
			s+=str(utils[o]['ff'])
		else:
			s+=str(utils[o]['ff'])
	if io==len(ov)-1:
		s+=' \\\\\n'
	else:
		s+=' & '
	io+=1
s+='\multicolumn{2}{|c||}{} & '
io=0
for o in ov:
	if o in modes.keys():
		if o=='soft':
			s+=''
		elif o=='soft_nmshr':
			s+=''
		elif o=='fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr':
			s+="{:.1f}".format(float(utils[o]['ff']-utils['ori_nmshr']['ff'])/utils['ori_nmshr']['ff']*100)+'\%$^\dagger$'
		else:
			s+="{:.1f}".format(float(utils[o]['ff']-utils['ori']['ff'])/utils['ori']['ff']*100)+'\%'
	if io==len(ov)-1:
		s+=' \\\\\\hline\n'
	else:
		s+=' & '
	io+=1

s+='\multicolumn{2}{|c||}{\# of BRAMs} & '
io=0
for o in ov:
	if o in modes.keys():
		if o=='soft':
			s+=str(utils['ori']['ram'])
		elif o=='soft_nmshr':
			s+=str(utils['ori_nmshr']['ram'])
		elif o=='fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr':
			if utils[o]['ram']==utils['ori_nmshr']['ram']:
				s+=str(utils[o]['ram'])
			else:
				s+=str(utils[o]['ram'])+'('+"{:.2f}".format(float(utils[o]['ram']-utils['ori_nmshr']['ram'])/utils['ori_nmshr']['ram']*100)+'\%$^\dagger$)'
		else:
			if utils[o]['ram']==utils['ori']['ram']:
				s+=str(utils[o]['ram'])
			else:
				s+=str(utils[o]['ram'])+'('+"{:.2f}".format(float(utils[o]['ram']-utils['ori']['ram'])/utils['ori']['ram']*100)+'\%)'
	if io==len(ov)-1:
		s+=' \\\\\\hline\n'
	else:
		s+=' & '
	io+=1

"""
s+='\multicolumn{2}{|c||}{\# of LUTs} & '
io=0
for o in ov:
	if o in modes.keys():
		if o=='soft':
			s+=str(utils['ori']['lut'])
		elif o=='soft_nmshr':
			s+=str(utils['ori_nmshr']['lut'])
		elif o=='fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr':
			s+=str(utils[o]['lut'])+'('+"{:.2f}".format(float(utils[o]['lut']-utils['ori_nmshr']['lut'])/utils['ori_nmshr']['lut']*100)+'\%$^\dagger$)'
		else:
			s+=str(utils[o]['lut'])+'('+"{:.2f}".format(float(utils[o]['lut']-utils['ori']['lut'])/utils['ori']['lut']*100)+'\%)'
	if io==len(ov)-1:
		s+=' \\\\\\hline\n'
	else:
		s+=' & '
	io+=1
s+='\multicolumn{2}{|c||}{\# of FFs} & '
io=0
for o in ov:
	if o in modes.keys():
		if o=='soft':
			s+=str(utils['ori']['ff'])
		elif o=='soft_nmshr':
			s+=str(utils['ori_nmshr']['ff'])
		elif o=='fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr':
			s+=str(utils[o]['ff'])+'('+"{:.2f}".format(float(utils[o]['ff']-utils['ori_nmshr']['ff'])/utils['ori_nmshr']['ff']*100)+'\%$^\dagger$)'
		else:
			s+=str(utils[o]['ff'])+'('+"{:.2f}".format(float(utils[o]['ff']-utils['ori']['ff'])/utils['ori']['ff']*100)+'\%)'
	if io==len(ov)-1:
		s+=' \\\\\\hline\n'
	else:
		s+=' & '
	io+=1
"""
iline=0
for c in cases:
	s+=fronts[iline]+' & '+casenames[iline]+' & '
	io=0
	for o in ov:
		if o in modes.keys():
			if o=='soft_nmshr':
				s+="{:.1f}".format((results[o][iline]['time']-results['ori_nmshr'][iline]['time'])/results['ori_nmshr'][iline]['time']*100)+'\\%'
			elif o=='fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_nmshr':
				s+="{:.1f}".format((results[o][iline]['time']-results['ori_nmshr'][iline]['time'])/results['ori_nmshr'][iline]['time']*100)+'\\%'
			else:
				s+="{:.1f}".format((results[o][iline]['time']-results['ori'][iline]['time'])/results['ori'][iline]['time']*100)+'\\%'
		if io==len(ov)-1:
			s+=' \\\\\\cline{2-13}\n'
		else:
			s+=' & '
		io+=1
	iline+=1
s+=fronts[iline]+' & Average & '
io=0
for o in ov:
	if o in modes.keys():
		s+='\\textbf{'+"{:.1f}".format(avg[o]*100)+'\\%}'
	if io==len(ov)-1:
		s+=' \\\\\\hline\n'
	else:
		s+=' & '
	io+=1
iline+=1
print s

print "============trends==========="
s=''

changename=[
'FIFO 2',
'FIFO 64',
'FIFO 256',
'Load Opt Buffer 32',
'Load Opt Buffer 64',
'Load Opt Buffer 128',
'RDTable 2KB',
'RDTable 8KB',
'RDTable 32KB',
'RDSmap 2KB',
'RDSmap 8KB',
'RDSmap 32KB',
'RDSet 2KB',
'RDSet 8KB',
'RDSet 32KB',
]

spmode=[
'fsl2_ff1_ldopt64_rdsc10_rdsmc10_rdtc10',
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10',
'fsl256_ff32_ldopt64_rdsc10_rdsmc10_rdtc10',
'fsl64_ff8_ldopt32_rdsc10_rdsmc10_rdtc10',
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10',
'fsl64_ff8_ldopt128_rdsc10_rdsmc10_rdtc10',
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc8',
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10',
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc12',
'fsl64_ff8_ldopt64_rdsc10_rdsmc8_rdtc10',
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10',
'fsl64_ff8_ldopt64_rdsc10_rdsmc12_rdtc10',
'fsl64_ff8_ldopt64_rdsc8_rdsmc10_rdtc10',
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10',
'fsl64_ff8_ldopt64_rdsc12_rdsmc10_rdtc10',
]

s+='	'
for ch in changename:
	s+=ch+'	' 
s+='\n'
ic=0
for c in cases:
	s+=casenames[ic]+'	'
	isp=0
	for sp in spmode:
		thisov=float(results[sp][ic]['time']-results['ori'][ic]['time'])/results['ori'][ic]['time']*100
		if isp%3==0:
			baseov=thisov
		s+="{:.2f}".format((results[sp][ic]['time']-results['ori'][ic]['time'])/results['ori'][ic]['time']*100)+'	'
		#s+="{:.2f}".format(thisov/baseov)+'	'
		isp+=1
	s+='\n'
	ic+=1
s+='Avg.	'
for sp in spmode:
	s+="{:.2f}".format(avg[sp]*100)+'	'
s+='\n'
print s

print "============trends2==========="
s=''
changename=[
'FIFO Entries: 2',
'FIFO Entries: 16',
'FIFO Entries: 64',
'Load Opt Buf Entries: 0',
'Load Opt Buf Entries: 16',
'Load Opt Buf Entries: 64',
'RDTable Size: 0B',
'RDTable Size: 256B',
'RDTable Size: 8KB',
'RDSmap Size: 0B',
'RDSmap Size: 256B',
'RDSmap Size: 8KB',
'RDS Size: 0B',
'RDS Size: 256B',
'RDS Size: 8KB',
]

spmode=[
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl16_ff2_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl64_ff8_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl2_ff1_ldopt16_rdsc1_rdsmc1_rdtc1',
'fsl2_ff2_ldopt64_rdsc1_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc5',
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc10',
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc5_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc10_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc5_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc10_rdsmc1_rdtc1',
]

s+='	'
for ch in changename:
	s+=ch+'	' 
s+='\n'
ic=0
avg={}
for sp in spmode:
	avg[sp]=0.0
for c in cases:
	s+=casenames[ic]+'	'
	isp=0
	for sp in spmode:
		thisov=float(results[sp][ic]['time']-results['ori'][ic]['time'])/results['ori'][ic]['time']*100
		if isp%3==0:
			baseov=thisov
		if isp==0 or isp%3:
			avg[sp]+=thisov/baseov
		#s+="{:.2f}".format(thisov/baseov)+'	'
		s+="{:.2f}".format((results[sp][ic]['time']-results['ori'][ic]['time'])/results['ori'][ic]['time']*100)+'	'
		isp+=1
	s+='\n'
	ic+=1
isp=0
for sp in spmode:
	if isp==0 or isp%3:
		avg[sp]/=len(cases)
	isp+=1
s+='Avg.	'
for sp in spmode:
	s+="{:.2f}".format(avg[sp])+'	'
s+='\n'
print s

print "============overhead breakdown==========="
s=''

datanum=['10','11','12','13']
ovbmode=[
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl64_ff8_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl2_ff2_ldopt64_rdsc1_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc10_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc10_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc10',
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10',
]

for ovb in ovbmode:
	avg={}
	for d in datanum:
		avg[d]=0.0
	s+='----------'+ovb+'\n'
	s+='	'
	for d in datanum:
		s+=data2mean[d]+'	'
	s+='\n'
	ic=0
	for c in cases:
		s+=casenames[ic]+'	'
		allcycle=0
		for d in datanum:
			allcycle+=results[ovb][ic]['data'][int(d)]
		for d in datanum:
			avg[d]+=float(results[ovb][ic]['data'][int(d)])/allcycle*100
			s+="{:.2f}".format(float(results[ovb][ic]['data'][int(d)])/allcycle*100)+'	'
		s+='\n'
		ic+=1
	for d in datanum:
		avg[d]/=len(cases)
	s+='Avg.	'
	for d in datanum:
		s+="{:.2f}".format(avg[d])+'	'
	s+='\n'
print s


print "============cache hit rate==========="
s=''

datanum=['24','29','25','30','28','31']
spmode=[
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl64_ff8_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl2_ff2_ldopt64_rdsc1_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc10_rdsmc1_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc10_rdtc1',
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc10',
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10',
]

for sp in spmode:
	avg={}
	for i in range(len(datanum)/2):
		avg[datanum[2*i]]=0.0
	s+='----------'+sp+'\n'
	s+='	'
	for i in range(len(datanum)/2):
		s+=data2mean[datanum[2*i]]+'	'
	s+='\n'
	ic=0
	for c in cases:
		s+=casenames[ic]+'	'
		for i in range(len(datanum)/2):
			hitrate=float(results[sp][ic]['data'][int(datanum[2*i])])/(results[sp][ic]['data'][int(datanum[2*i])]+results[sp][ic]['data'][int(datanum[2*i+1])])*100
			avg[datanum[2*i]]+=hitrate
			s+="{:.2f}".format(hitrate)+'	'
		s+='\n'
		ic+=1
	for i in range(len(datanum)/2):
		avg[datanum[2*i]]/=len(cases)
	s+='Avg.	'
	for i in range(len(datanum)/2):
		s+="{:.2f}".format(avg[datanum[2*i]])+'	'
	s+='\n'
print s


print "============load opt hit rate==========="
#load opt hit rate does not depend on FIFO and cache
s=''

datanum=['22','23']

changename=[
'Load Opt Buf Entries: 2',
'Load Opt Buf Entries: 16',
'Load Opt Buf Entries: 64',
'Load Opt Buf Entries: 128',
]

spmode=[
'fsl2_ff1_ldopt2_rdsc1_rdsmc1_rdtc1',
'fsl2_ff1_ldopt16_rdsc1_rdsmc1_rdtc1',
'fsl2_ff2_ldopt64_rdsc1_rdsmc1_rdtc1',
'fsl64_ff8_ldopt128_rdsc10_rdsmc10_rdtc10',
]


avg={}
for i in range(len(spmode)):
	avg[spmode[i]]=0.0
s+='----------'+sp+'\n'
s+='	'
for i in range(len(spmode)):
	s+=changename[i]+'	'
s+='\n'
ic=0
for c in cases:
	s+=casenames[ic]+'	'
	for sp in spmode:
		for i in range(len(datanum)/2):
			hitrate=float(results[sp][ic]['data'][int(datanum[2*i])])/(results[sp][ic]['data'][int(datanum[2*i])]+results[sp][ic]['data'][int(datanum[2*i+1])])*100
			avg[sp]+=hitrate
			s+="{:.2f}".format(hitrate)+'	'
	s+='\n'
	ic+=1
for i in range(len(spmode)):
	avg[spmode[i]]/=len(cases)
s+='Avg.	'
for i in range(len(spmode)):
	s+="{:.2f}".format(avg[spmode[i]])+'	'
s+='\n'
print s

print "============latency analysis==========="
s=''

datanum=['57','58']

spmode=[
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest',
]

avglats={}
for i in range(len(spmode)):
	avglats[spmode[i]]=0.0
s+='	'
s+='\n'
ic=0
for c in cases:
	s+=casenames[ic]+'	'
	for sp in spmode:
		avglat=float(results[sp][ic]['data'][int(datanum[1])])/results[sp][ic]['data'][int(datanum[0])]
		avglats[sp]+=avglat
		s+="{:.2f}".format(avglat)+'	'
	s+='\n'
	ic+=1
for i in range(len(spmode)):
	avglats[spmode[i]]/=len(cases)
s+='Avg.	'
for i in range(len(spmode)):
	s+="{:.2f}".format(avglats[spmode[i]])+'	'
s+='\n'
print s

print "============latency analysis (true)==========="
s=''

datanum=['32','33','34','35','36','37','38','39','40','41','42','43','44','45']

spmode=[
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest_libstall',
]

lats={}
for i in range(len(spmode)):
	lats[spmode[i]]={}
	for idn in range(len(datanum)/2):
		lats[spmode[i]][datanum[2*idn+1]]=0.0
s+='	'
for idn in range(len(datanum)/2):
	s+=data2mean[datanum[2*idn+1]]+'	'
s+='\n'
ic=0
for c in cases:
	s+=casenames[ic]+'	'
	for sp in spmode:
		for idn in range(len(datanum)/2):
			if results[sp][ic]['data'][int(datanum[2*idn])]>0:
				avglat=float(results[sp][ic]['data'][int(datanum[2*idn+1])])/results[sp][ic]['data'][int(datanum[2*idn])]
			else:
				avglat=0.0
			lats[sp][datanum[2*idn+1]]=avglat
			s+="{:.2f}".format(avglat)+'	'
	s+='\n'
	ic+=1
print s

print "============latency count analysis (true)==========="
s=''

datanum=['32','33','34','35','36','37','38','39','40','41','42','43','44','45']

spmode=[
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest_libstall',
]

lats={}
for i in range(len(spmode)):
	lats[spmode[i]]={}
	for idn in range(len(datanum)/2):
		lats[spmode[i]][datanum[2*idn+1]]=0.0
s+='	'
for idn in range(len(datanum)/2):
	s+=data2mean[datanum[2*idn]]+'	'
s+='\n'
ic=0
for c in cases:
	s+=casenames[ic]+'	'
	for sp in spmode:
		for idn in range(len(datanum)/2):
			avglat=results[sp][ic]['data'][int(datanum[2*idn])]
			lats[sp][datanum[2*idn+1]]=avglat
			s+="{:.2f}".format(avglat)+'	'
	s+='\n'
	ic+=1
print s

print "============req analysis==========="
s=''

datanum=['53','54','55']

spmode=[
'fsl64_ff8_ldopt64_rdsc10_rdsmc10_rdtc10_lattest_libstall',
]

counts={}
for i in range(len(spmode)):
	counts[spmode[i]]={}
	for idn in range(len(datanum)):
		counts[spmode[i]][datanum[idn]]=0
s+='	'
s+='\n'
ic=0
for c in cases:
	s+=casenames[ic]+'	'
	for sp in spmode:
		for idn in range(len(datanum)):
			count=float(results[sp][ic]['data'][int(datanum[idn])])
			counts[sp][datanum[idn]]=count
			s+="{:.2f}".format(count)+'	'
	s+='\n'
	ic+=1
print s
