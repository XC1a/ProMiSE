

echo "+++++++++++++++"
echo "401 hdfi------------"
echo "+++++++++++++++"
cd ../run_401_hdfi/
./bzip2 control 
../rdebug/rdebug 

cd ../specrun
#401 done


echo "+++++++++++++++"
echo "445 hdfi------------"
echo "+++++++++++++++"
cd ../run_445_hdfi/
./gobmk ./connection1.sgf 
../rdebug/rdebug 

cd ../specrun
#445 done


echo "+++++++++++++++" 
echo "456 hdfi------------"
echo "+++++++++++++++"
cd ../run_456_hdfi
./hmmer --fixed 0 --mean 500 --num 5000 --sd 350 --seed 0 ./retro.hmm 
../rdebug/rdebug 

cd ../specrun
#456 done


echo "+++++++++++++++" 
echo "458 hdfi------------"
echo "+++++++++++++++"
cd ../run_458_hdfi
./sjeng ./test.txt 
../rdebug/rdebug


cd ../specrun
#458 done
echo "+++++++++++++++" 
echo "462 hdfi------------"
echo "+++++++++++++++"
cd ../run_462_hdfi
./libquantum 100 33 
../rdebug/rdebug 

cd ../specrun
#462done


echo "+++++++++++++++" 
echo "470 hdfi------------"
echo "+++++++++++++++"
cd ../run_470_hdfi
./lbm 3000 reference.dat 0 0 ./100_100_130_cf_a.of 
../rdebug/rdebug

cd ../specrun
#470 done


echo "+++++++++++++++" 
echo "473 hdfi------------"
echo "+++++++++++++++"
cd ../run_473_hdfi
./astar ./rivers.cfg 
../rdebug/rdebug 

cd ../specrun
#473 done


echo "+++++++++++++++" 
echo "429 hdfi------------"
echo "+++++++++++++++"
cd ../run_429_hdfi
./mcf ./inp.in
../rdebug/rdebug 


cd ../specrun
#429 done


echo "+++++++++++++++" 
echo "433 hdfi------------"
echo "+++++++++++++++"
cd ../run_433_hdfi
./run_433
../rdebug/rdebug 


cd ../specrun
#433 done