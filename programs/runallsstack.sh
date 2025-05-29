echo "+++++++++++++++"
echo "401------------"
echo "+++++++++++++++"
cd ../run_401_oriexit/
./bzip2 control 
../rdebug/rdebug 

echo "+++++++++++++++"
echo "401 sstack------------"
echo "+++++++++++++++"
cd ../run_401_sstack/
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
echo "445 sstack------------"
echo "+++++++++++++++"
cd ../run_445_sstack/
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
echo "456 sstack------------"
echo "+++++++++++++++"
cd ../run_456_sstack
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
echo "458 sstack------------"
echo "+++++++++++++++"
cd ../run_458_sstack
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
echo "462 sstack------------"
echo "+++++++++++++++"
cd ../run_462_sstack
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
echo "470 sstack------------"
echo "+++++++++++++++"
cd ../run_470_sstack
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
echo "473 sstack------------"
echo "+++++++++++++++"
cd ../run_473_sstack
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
echo "429 sstack------------"
echo "+++++++++++++++"
cd ../run_429_sstack
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
echo "433 sstack------------"
echo "+++++++++++++++"
cd ../run_433_sstack
./run_433
../rdebug/rdebug 


cd ../specrun
#433 done