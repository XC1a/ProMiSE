import sys
DFI=1
CFI=0

funcDic = {}
funcDic['JUMP']       = 0b000001
funcDic['FIFO_INPUT'] = 0b000010
funcDic['LOAD']       = 0b000011
funcDic['STORE']      = 0b000100
funcDic['CMP']        = 0b000101
funcDic['ADD']        = 0b000110
funcDic['MUL']        = 0b000111
funcDic['MINUS']      = 0b001000
funcDic['WReg']       = 0b001001
funcDic['DO_UNTIL']   = 0b001010
funcDic['R_BUF']      = 0b001011 
funcDic['R_FIFO']     = 0b001100
funcDic['SL']         = 0b001101
funcDic['RL']         = 0b001110
funcDic['BIT_AND']    = 0b001111
funcDic['IF']         = 0b010000
funcDic['POP']        = 0b010001
funcDic['PUSH']       = 0b010010
funcDic['S_LOAD']     = 0b010011
funcDic['C_CMP']      = 0b010100
funcDic['STALL'] 	  = 0b010101
funcDic['SEARCH'] 	  = 0b010110
funcDic['SEARCH_S']   = 0b010111
funcDic['SEARCH_RST'] = 0b011000
funcDic['M_DIS']      = 0b011001
funcDic['LRS']        = 0b011010


fptr = 'inst.txt' if len(sys.argv)<=2 else sys.argv[2] 
fd = open(fptr,mode='r')
content = fd.readlines()
inst = []
inst_bin = []
#print (content)

for i in range(len(content)):
    inst.append([])
    inst[i] = content[i].split()

print (inst)

tmp = 0

for i in range(len(inst)):
    if inst[i][0] == 'JUMP':
        tmp = funcDic['JUMP'] | int(inst[i][1])<<6 
        inst_bin.append(tmp)

    elif inst[i][0] == 'WReg':
        hex_tmp = int(inst[i][2],16) if ( inst[i][2][0:2] == '0x' ) else int(inst[i][2])
        tmp = funcDic['WReg']| (int(inst[i][1][3:])<<6) | (hex_tmp <<12)
        if DFI==1 and int(inst[i][1][3:])==17:
            a = funcDic['WReg'] | 17<<6
            if sys.argv[1] != 'FPGA':
                inst_bin.append(str(a)+' + (RDS_ADDR<< 12)')
            else:
                inst_bin.append('RDS_ADDR')
        elif DFI==1 and int(inst[i][1][3:])==18:
            a = funcDic['WReg'] | 18<<6
            if sys.argv[1] != 'FPGA':
                inst_bin.append(str(a)+' + (RDT_ADDR<< 12)')
            else:
                inst_bin.append('RDT_ADDR')
        elif DFI==1 and int(inst[i][1][3:])==19:
            a = funcDic['WReg'] | 19<<6
            if sys.argv[1] != 'FPGA':
                inst_bin.append(str(a)+' + (RES_ADDR<< 12)')
            else:
                inst_bin.append('RES_ADDR')
        elif CFI==1 and int(inst[i][1][3:])==17:
            a = funcDic['WReg'] | 17<<6
            if sys.argv[1] != 'FPGA':
                inst_bin.append(str(a)+' + (CFG_ADDR<< 12)')
            else:
                inst_bin.append('CFG_ADDR')
        elif CFI==1 and int(inst[i][1][3:])==18:
            a = funcDic['WReg'] | 18<<6
            if sys.argv[1] != 'FPGA':
                inst_bin.append(str(a)+' + (RES_ADDR<< 12)')
            else:
                inst_bin.append('RES_ADDR')           
        else:
            inst_bin.append(tmp)


    elif inst[i][0] == 'FIFO_INPUT':
        hex_tmp = int(inst[i][2],16) if ( inst[i][2][0:2] == '0x' ) else int(inst[i][2][3:])
        tmp = funcDic['FIFO_INPUT'] | (int(inst[i][1])<<6) | (hex_tmp<<7) 
        inst_bin.append(tmp)

    elif inst[i][0] == 'LOAD':
        tmp = funcDic['LOAD'] | (int(inst[i][1][3:])<<6) | (int(inst[i][2][3:])<<12) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<24) | (int(inst[i][5])<<26) 
        inst_bin.append(tmp)

    elif inst[i][0] == 'STORE':
        tmp = funcDic['STORE'] | (int(inst[i][1][3:])<<6) | (int(inst[i][2][3:])<<12) |(int(inst[i][3][3:])<<18)|(int(inst[i][4])<<24)| (int(inst[i][5])<<26) | (int(inst[i][7])<<27)
        inst_bin.append(tmp)

    elif inst[i][0] == 'CMP' :
        hex_tmp = int(inst[i][2],16) if ( inst[i][2][0:2] == '0x' ) else int(inst[i][2][3:])
        if int(inst[i][4])==1:
            tmp = funcDic['CMP'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<24) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<63) | (int(inst[i][5])<<61 )
        else:
            tmp = funcDic['CMP'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<12) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<63) | (int(inst[i][5])<<61 )
        inst_bin.append(tmp)

    elif inst[i][0] == 'ADD' :
        hex_tmp = int(inst[i][2],16) if ( inst[i][2][0:2] == '0x' ) else int(inst[i][2][3:])
        if int(inst[i][4])==1:
            tmp = funcDic['ADD'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<24) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<63)
        else:
            tmp = funcDic['ADD'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<12) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<63)
        inst_bin.append(tmp)

    elif inst[i][0] == 'MUL' :
        tmp = funcDic['MUL'] | (int(inst[i][1][3:])<<6) | (int(inst[i][2][3:])<<12) | (int(inst[i][3][3:])<<18)
        inst_bin.append(tmp)

    elif inst[i][0] == 'MINUS' :
        hex_tmp = int(inst[i][2],16) if ( inst[i][2][0:2] == '0x' ) else int(inst[i][2][3:])
        if int(inst[i][4])==1:
            tmp = funcDic['MINUS'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<24) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<63)
        else:
            tmp = funcDic['MINUS'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<12) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<63)
        inst_bin.append(tmp)

    elif inst[i][0] == 'DO_UNTIL':
        tmp = funcDic['DO_UNTIL'] | (int(inst[i][1])<<6) | (int(inst[i][2])<<14) | (int(inst[i][3])<<22) | (int(inst[i][4])<<30) | (int(inst[i][5])<<34)
        inst_bin.append(tmp)

    elif inst[i][0] == 'R_BUF':
        tmp = funcDic['R_BUF'] | (int(inst[i][1][3:])<<6) 
        inst_bin.append(tmp)
    
    elif inst[i][0] == 'R_FIFO':
        tmp = funcDic['R_FIFO'] | (int(inst[i][1][3:])<<6) | (int(inst[i][2])<<12)
        inst_bin.append(tmp)


    elif inst[i][0] == 'M_DIS':
        hex_tmp = int(inst[i][3],16) if ( inst[i][3][0:2] == '0x' ) else int(inst[i][3])
        res_id = (int(inst[i][4])<<26)| (int(inst[i][5])<<30)| (int(inst[i][6])<<34)| (int(inst[i][7])<<38)| (int(inst[i][8])<<42)| (int(inst[i][9])<<46)| (int(inst[i][10])<<50)| (int(inst[i][11])<<54)
        tmp = funcDic['M_DIS'] | (int(inst[i][1][3:])<<6) | (int(inst[i][2][3:])<<12) | (hex_tmp<<18) | res_id
        inst_bin.append(tmp)

    elif inst[i][0] == 'R_FIFO_WIDE':
        hex_tmp = int(inst[i][1],16) if ( inst[i][1][0:2] == '0x' ) else int(inst[i][1])
        tmp = funcDic['R_FIFO'] | (hex_tmp<<6) | (1<<63) | (int(inst[i][2])<<15)
        inst_bin.append(tmp)

 
    elif inst[i][0] == 'SL' :
        hex_tmp = int(inst[i][2],16) if ( inst[i][2][0:2] == '0x' ) else int(inst[i][2][3:])
        if int(inst[i][4])==1: 
            tmp = funcDic['SL'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<24) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<63)
        else:
            tmp = funcDic['SL'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<12) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<63)
        inst_bin.append(tmp)

    elif inst[i][0] == 'RL' :
        hex_tmp = int(inst[i][2],16) if ( inst[i][2][0:2] == '0x' ) else int(inst[i][2][3:])
        if int(inst[i][4])==1:
            tmp = funcDic['RL'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<24) | (int(inst[i][3][3:])<<18)| (int(inst[i][4])<<63)
        else:
            tmp = funcDic['RL'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<12) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<63)
        inst_bin.append(tmp)
        
    elif inst[i][0] == 'LRS' :
        hex_tmp = int(inst[i][2],16) 
        hex_tmp1 = int(inst[i][3],16) 
        tmp = funcDic['LRS'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<12) | (hex_tmp1<<24) | (int(inst[i][4][3:])<<18)| (int(inst[i][5])<<63)
        inst_bin.append(tmp)


    elif inst[i][0] == 'BIT_AND' :
        hex_tmp = int(inst[i][2],16) if ( inst[i][2][0:2] == '0x' ) else int(inst[i][2][3:])
        if int(inst[i][4])==1:
            tmp = funcDic['BIT_AND'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<24) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<63)
        else:
            tmp = funcDic['BIT_AND'] | (int(inst[i][1][3:])<<6) | (hex_tmp<<12) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<63)
        inst_bin.append(tmp)

    elif inst[i][0] == 'IF':
        #reg62 is fifo_wide stats, reg63 is stack full flag
        tmp = funcDic['IF'] | (int(inst[i][1][3:])<<6) | (int(inst[i][2])<<12) | (int(inst[i][3])<<18) | (int(inst[i][4])<<28) | (int(inst[i][5])<<63)
        inst_bin.append(tmp)
    
    elif inst[i][0] == 'POP':
        tmp = funcDic['POP'] | (int(inst[i][1][3:])<<6) 
        inst_bin.append(tmp)

    elif inst[i][0] == 'STALL':
        tmp = funcDic['STALL'] | (int(inst[i][1])<<6) 
        inst_bin.append(tmp)

    elif inst[i][0] == 'PUSH':
        tmp = funcDic['PUSH'] | (int(inst[i][1][3:])<<6) 
        inst_bin.append(tmp)

    elif inst[i][0] == 'S_LOAD':
        tmp = funcDic['S_LOAD'] | (int(inst[i][1][3:])<<6) 
        inst_bin.append(tmp)

    elif inst[i][0] == 'C_CMP':
        tmp = funcDic['C_CMP'] | (int(inst[i][1][3:])<<6) | (int(inst[i][2][3:])<<12) | (int(inst[i][3][3:])<<18) | (int(inst[i][4][3:])<<24)  
        inst_bin.append(tmp)

    elif inst[i][0] == 'SEARCH':
        tmp = funcDic['SEARCH'] | (int(inst[i][1][3:])<<6) | (int(inst[i][2][3:])<<12) | (int(inst[i][3][3:])<<18) | (int(inst[i][4])<<24)| (int(inst[i][5][3:])<<30)| (int(inst[i][6][3:])<<36) | (int(inst[i][7])<<42)
        inst_bin.append(tmp)


    elif inst[i][0] == 'SEARCH_S':
        tmp = funcDic['SEARCH_S'] | (int(inst[i][1][3:])<<6) 
        inst_bin.append(tmp)

    elif inst[i][0] == 'SEARCH_RST':
        tmp = funcDic['SEARCH_RST']  
        inst_bin.append(tmp)

for i in range(len(inst_bin)):
    if type(inst_bin[i]) != type('str'):
        print (hex(inst_bin[i]))   


fd.close()

fd = open('inst_bin.txt',mode='w')
for i in range(len(inst_bin)):
    if( len(sys.argv)>1):
        if(sys.argv[1] == 'FPGA'):
            if type(inst_bin[i]) != type('str'):
                fd.write(hex(inst_bin[i]))
            else :
                fd.write((inst_bin[i]))
            fd.write('\n')
        else:
            fd.write('instruction[')
            fd.write(str(i))
            fd.write(']=')
            if type(inst_bin[i]) != type('str'):
                fd.write(hex(inst_bin[i]))
            else :
                fd.write((inst_bin[i]))
            fd.write(';')
            fd.write('\n')
    else:
        fd.write('instruction[')
        fd.write(str(i))
        fd.write(']=')
        if type(inst_bin[i]) != type('str'):
            fd.write(hex(inst_bin[i]))
        else :
            fd.write((inst_bin[i]))
        fd.write(';')
        fd.write('\n')

fd.close()
