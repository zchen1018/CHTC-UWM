Reference:

http://chtc.cs.wisc.edu/r-jobs.shtml

ssh zchen387@submit-3.chtc.wisc.edu

### Steps to Submit R Scripts

1. Download the .tar.gz source file from CRAN. 
2. Create a interactive.sub file as in step 2 [here](http://chtc.cs.wisc.edu/inter-submit.shtml). In the file content, set

	transfer_input_files = R-3.x.x.tar.gz
	
3. Copy these files to the submit server.
4. Submit the interactive.sub file: 

	condor_submit -i interactive.sub

5. After that, follow steps starting at B.2 on the [instruction page](http://chtc.cs.wisc.edu/r-jobs.shtml) to install R:

	tar -xzf R-3.x.x.tar.gz
	cd R-3.x.x
	./configure --prefix=$(pwd)
	make
	make install
	cd ..
	
6. Install Packages. When prompted to choose a "CRAN mirror", choose any **http** (not https!) option:

	R-3.x.x/lib64/R/bin/R
	install.packages('package_name')
	
	After having installed all the packages, exit the R seesion:
	
	quit()

7. Edit the R executable:

	nano R-3.x.x/lib64/R/bin/R
	
	Change the first line to: R_HOME_DIR=$(pwd)/R

8. Move the directory to the main working directory, create the installation and exit:

	mv R-3.x.x/lib64/R ./
	tar -czvf R.tar.gz R/
	exit
	
After step 8, we already have our own installation on submit server. Next, create the files needed to submit R scripts.

9. Check how big your R.tar.gz file is:

	du -h R.tar.gz
	
	If this is too large (~20M), use SQUID instead:
	
	cp R.tar.gz /squid/*username*/
	
	Add the following within run_R.sh to download the file:
	
	wget http://proxy.chtc.wisc.edu/SQUID/*username*/R.tar.gz

10. Copy run_R.sh, run_R.sub and sample.R to the submit server and run:

	chmod +x run_R.sh
	condor_submit run_R.sub



	
	
