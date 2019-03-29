signatures = params.signatures ?: []
signatures_ch = Channel(signatures)

params.ksizes = Channel.from([15, 21, 27, 33, 51])
params.molecules = Chanel.from(['dna', 'protein'])

process sourmash_compare_sketches {
	tag "molecule-${molecule}_ksize-${ksize}_"

	container 'czbiohub/nf-kmer-similarity'
	publishDir "${params.outdir}/", mode: 'copy'
	memory { 8.GB * task.attempt }
	errorStrategy 'retry'
  maxRetries 5

	input:
	each ksize from ksizes
	each molecule from molecules
	file signatures_ch

	output:
	file "similarities_molecule-${molecule}_ksize-${ksize}.csv"

	script:
	"""
	sourmash compare \
        --ksize $ksize \
        --$molecule \
        --csv similarities_molecule-${molecule}_ksize-${ksize}.csv \
        $signatures_ch
	"""

}
