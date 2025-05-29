echo "+++++++++++++++"
echo "dfi test"
echo "+++++++++++++++"
./hdfi_att 1 256 240 257 3 256 # u2 - u1
sleep 1s
./hdfi_att 1 256 2 256 240 257 # u3 - u2
sleep 1s
./hdfi_att 1 256 3 256 2 258 # u3 - u1

