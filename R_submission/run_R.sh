#!/bin/bash
wget http://proxy.chtc.wisc.edu/SQUID/zchen387/R.tar.gz

# untar your R installation
tar -xzvf R.tar.gz

# make sure the script will use your R installation
export PATH=$(pwd)/R/bin:$PATH

# run R, with the R script name as an argument to this bash script
R CMD BATCH $@

# Delete downloaded files
rm R.tar.gz
# rm ml-20m.zip
