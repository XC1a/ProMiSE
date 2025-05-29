# **Shadow stack**
RIPE is test based on instrumentation of CFI

Pick 41 attacks in FastCFI, which covers the sistuations
./build_ripe.sh sstack_ripe -whlist

# **White List**
Note that this security policy defends the illegal read access.
Heartbleed is tested.

!! Nullhttpd has no illegal reads
./build_heartbleed.sh whlist_heartbleed -whlist

# **CFI**
1. RIPE  ./build_ripe.sh cfi_ripe -cfi
2. fine-grained test. the source code is `test.c` in `test_test_cfi_fine_grained`
3. stateful test. the source code is `test.c` in `test_test_cfi_stateful`

# **HDFI**
**User instrumentation**
There are some tests need the user to instrument with the id file, the details are in `*.sh`.
With the usr instrumentation, the optmazation of DFI about read/store is off.
User can add the instrumentation like a `*_id` in any hdfi test exmaple.

**Basic 4 attacks** 
1. RIPE ./build_ripe.sh hdfi_ripe -hdfi, "Note" in ripe, we don't detect the "attack library function read". User can manully instrument "store and library, which write or initial the payload(overflow attack)"
2. Heartbleed ./build_heartbleed.sh hdfi_heartbleed -hdfi
3. Nullhttpd ./build_nullhttpd.sh hdfi_nullhttpd -hdfi
4. Note that there is a fine-grained overflow test like in PIM-DFI.   ./build_granined.sh hdfi_grained_xxx -hdfi   <----- `xxx` means the different tags in `u0` `u1` `u2` 
source code is `hdfi_att.c`

# **DFI**
**User reaching defination set (RDS)** 
There are some tests needs to delete or add the rds. 
The example is showed in any case in `genrds.py` `-usrrds` `_rds`.

**Basic 4 attacks**
1. RIPE  ./build_ripe.sh dfi_ripe -hdfi 
2. Heartbleed ./build_heartbleed.sh dfi_heartbleed -dfi 
3. Nullhttpd  ./build_nullhttpd.sh dfi_nullhttpd -dfi 
4. ./build_grained.sh dfi_granined -dfi 
