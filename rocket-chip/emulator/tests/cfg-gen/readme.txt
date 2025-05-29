
这个二进制文件格式是：
所有trans table总共的entry数量（这个信息占8byte）
trans table的每一个entry的byte数（现在是8）（这个信息占4byte）
result table的每一个entry的byte数（现在是8）（这个信息占4byte）
**new result addr 8bytes
所有trans table，第一级（用pc的最低位索引的）的放在最开始。每个entry紧密排列
所有的result table。每个entry紧密排列

trans table的每个entry的格式：
[0-1bit，下一级需要索引的table的起始位置在从初级trans table的开始算第几个entry的位置-63bit]
或者[1-1bit，这个branch的target数量-31bit，这个branch的target记录在result table的第几个entry-32bit]
