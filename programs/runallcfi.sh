echo "+++++++++++++++"
echo "401------------"
echo "+++++++++++++++"
cd ../run_401_oriexit/
./bzip2 control 
../rdebug/rdebug 

echo "+++++++++++++++"
echo "401 cfi------------"
echo "+++++++++++++++"
cd ../run_401_cfi/
./bzip2 control 
../rdebug/rdebug 

cd ../specrun
#401 done
echo "               "
echo "               "
echo "+++++++++++++++"
echo "445------------"
echo "+++++++++++++++"
cd ../run_445_oriexit/
./gobmk ./connection1.sgf 
../rdebug/rdebug 

echo "+++++++++++++++"
echo "445 cfi------------"
echo "+++++++++++++++"
cd ../run_445_cfi/
./gobmk ./connection1.sgf 
../rdebug/rdebug 

cd ../specrun
#445 done
echo "               "
echo "               "
echo "+++++++++++++++" 
echo "456------------"
echo "+++++++++++++++"
cd ../run_456_oriexit
./hmmer --fixed 0 --mean 500 --num 5000 --sd 350 --seed 0 ./retro.hmm 
../rdebug/rdebug 

echo "+++++++++++++++" 
echo "456 cfi------------"
echo "+++++++++++++++"
cd ../run_456_cfi
./hmmer --fixed 0 --mean 500 --num 5000 --sd 350 --seed 0 ./retro.hmm 
../rdebug/rdebug 

cd ../specrun
#456 done
echo "               "
echo "               "
cd ../run_458_oriexit
echo "+++++++++++++++" 
echo "458------------"
echo "+++++++++++++++"
./sjeng ./test.txt 
../rdebug/rdebug 

echo "+++++++++++++++" 
echo "458 cfi------------"
echo "+++++++++++++++"
cd ../run_458_cfi
./sjeng ./test.txt 
../rdebug/rdebug


cd ../specrun
#458 done
echo "               "
echo "               "
cd ../run_462_oriexit
echo "+++++++++++++++" 
echo "462------------"
echo "+++++++++++++++"
./libquantum 100 33 
../rdebug/rdebug 

echo "+++++++++++++++" 
echo "462 cfi------------"
echo "+++++++++++++++"
cd ../run_462_cfi
./libquantum 100 33 
../rdebug/rdebug 

cd ../specrun
#462done
echo "               "
echo "               "
cd ../run_470_oriexit
echo "+++++++++++++++" 
echo "470------------"
echo "+++++++++++++++"
./lbm 3000 reference.dat 0 0 ./100_100_130_cf_a.of 
../rdebug/rdebug 

echo "+++++++++++++++" 
echo "470 cfi------------"
echo "+++++++++++++++"
cd ../run_470_cfi
./lbm 3000 reference.dat 0 0 ./100_100_130_cf_a.of 
../rdebug/rdebug

cd ../specrun
#470 done
echo "               "
echo "               "
cd ../run_473_oriexit
echo "+++++++++++++++" 
echo "473------------"
echo "+++++++++++++++"
./astar ./rivers.cfg 
../rdebug/rdebug 

echo "+++++++++++++++" 
echo "473 cfi------------"
echo "+++++++++++++++"
cd ../run_473_cfi
./astar ./rivers.cfg 
../rdebug/rdebug 

cd ../specrun
#473 done
echo "               "
echo "               "
cd ../run_429_oriexit
echo "+++++++++++++++" 
echo "429------------"
echo "+++++++++++++++"
./mcf ./inp.in 
../rdebug/rdebug 

echo "+++++++++++++++" 
echo "429 cfi------------"
echo "+++++++++++++++"
cd ../run_429_cfi
./mcf ./inp.in
../rdebug/rdebug 


cd ../specrun
#429 done
echo "               "
echo "               "
cd ../run_433_oriexit
echo "+++++++++++++++" 
echo "433------------"
echo "+++++++++++++++"
./run_433 
../rdebug/rdebug 

echo "+++++++++++++++" 
echo "433 cfi------------"
echo "+++++++++++++++"
cd ../run_433_cfi
./run_433
../rdebug/rdebug 


cd ../specrun
#433 done