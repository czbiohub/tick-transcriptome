run_aws:
	nextflow run sourmash_compare.nf \
		-work-dir 's3://czb-nextflow/work' \
		-bucket-dir 's3://czb-nextflow/work' \
		-e.process.executor='awsbatch' \
		-e.process.queue='nextflow' \
		-e.executor.awscli='/home/ec2-user/miniconda/bin/aws' \
		-e.docker.enabled=true \
		-with-trace -with-timeline -with-dag -with-report -latest -resume
