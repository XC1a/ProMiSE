rm -rf ./builds/*
make -f Makefile.vc707-u500devkit verilog -j8
make -f Makefile.vc707-u500devkit mcs -j8
