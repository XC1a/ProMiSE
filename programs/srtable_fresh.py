import sys
import re
import copy
import math
import random

p=[]
for i in range(2,len(sys.argv)):
	if sys.argv[i][0]=='-':
		p.append(i)

sys_keysize = 0
sys_valuesize = 0
for i in p:
	if sys.argv[i]=='-key':
		sys_keysize = int(sys.argv[i+1])
	elif sys.argv[i]=='-value':
		sys_valuesize = int(sys.argv[i+1])



def write_word(f,data,size):
	for s in range(size):
		f.write(chr((data>>(s*8))&0x000000ff))

def fresh(f,key_byte,value_byte,outname):

	size = 0
	res_addr = 0
	for i in range(8):
		size = size + (ord(f.read(1))<<(i*8))
	for i in range(8):
		res_addr = res_addr + (ord(f.read(1))<<(i*8))
	key = []
	value = []
	value_key = []
	tmp = 0
	tmp_a = []
	key_size = res_addr/key_byte # number
	value_size = (size-res_addr)/value_byte
	print("key size: ",hex(key_size))
	print("value size: ",hex(value_size))
	for i in range(key_size):
		for j in range(key_byte):
			tmp = tmp + (ord(f.read(1))<<(j*8) )
		key.append(tmp)
		tmp = 0
	for i in range(value_size):
		for j in range(value_byte):
			tmp = tmp + (ord(f.read(1))<<(j*8) )
		value.append(tmp)
		tmp = 0
	cnt = 0
	print("key size: ",hex(len(key)))
	print("value size: ",hex(len(value)))
	for s in key:
		#this if is to judge if set
		if (s>>63)==1:
			value_num = (s >>32) & 0x3fffffff
		else:
			value_num = 0
		for i in range(value_num):
			tmp_a.append(value[cnt + i])
		cnt += value_num
		value_key.append(tmp_a)
		tmp_a = []
	print("total sets num: ",cnt)
	cnt = 0
	tmp_a = []
	value_key_copy = copy.deepcopy(value_key)
	for i in range(10):
		print("key: ",hex(key[i]))
		print("value: ",value_key[i])
	for vv in value_key_copy:
		if(vv==[]):
			tmp_a = []
			cnt += 1
			continue
		for vid in range(cnt+1,len(value_key_copy)):
			if value_key_copy[vid]==[]:
				continue
			if(value_key_copy[vid] == vv):
				tmp_a.append(vid)
		if tmp_a != []:
			prune_len = len(tmp_a)
			value_len = len(value_key[cnt])
			# print(tmp_a)
			# print(hex(key[cnt]))
			# print vid
			for i in tmp_a:
				value_key_copy[i] = []
				# value_key[i] = []
				key[i] = copy.deepcopy(key[cnt])
				# print(hex(key[i]))
		tmp_a = []
		cnt += 1
	print("W back bin")
	f1 = open(outname,'wb')
	write_word(f1,size,8)
	write_word(f1,res_addr,8)
	for k in key:
		write_word(f1,k,key_byte)

	for ss in value_key:
		for v in ss:
			if v != []:
				write_word(f1,v,value_byte)
	f1.close()

if __name__=="__main__":
	f=open(sys.argv[1],'r')
	fresh(f,sys_keysize,sys_valuesize,sys.argv[1])
	f.close()
	#print_table(table)

	
