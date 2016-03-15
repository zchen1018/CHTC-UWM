### Steps to Run the First CHTC Jobs

Reference: http://chtc.cs.wisc.edu/helloworld.shtml

1. Create *hello-chtc.sub* and *hello-chtc.sh* on a local directory and copy them to the CHTC server using the command: 

	scp *filename1* *[filename2]* *username*@submit-3.chtc.wisc.edu:/home/*username*/

2. Connect to to submit-3: 

	ssh *username*@submit-3.chtc.wisc.edu

3. Tell the filesystem that hello-chtc.sh should have executable permissions:

	chmod +x hello-chtc.sh

4. Submit the job:

	condor_submit hello-chtc.sub
	
5. Check the status of the jobs:

	condor_q $USER

6. Print the contents of the output files one after another:

	cat *.out

 
7. Logout:

	logout






