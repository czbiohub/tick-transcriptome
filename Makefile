run_aws:
	nextflow run sourmash_comapre.nf \
		-e.process.executor='awsbatch' \
		-e.process.queue='nextflow' \
		-e.executor.awscli='/home/ec2-user/miniconda/bin/aws' \
		-e.workDir='s3://czb-nextflow/work' \
		-e.docker.enabled=true \
		-with-trace -with-timeline -with-dag -with-report -latest -resume \
		--signatures /mnt/ibm_lg/olga/tick-genome/transcriptome/*.sig
