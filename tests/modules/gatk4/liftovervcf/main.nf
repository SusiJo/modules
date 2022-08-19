#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { GATK4_LIFTOVERVCF } from '../../../../modules/gatk4/liftovervcf/main.nf'

workflow test_gatk4_liftovervcf {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['homo_sapiens']['illumina']['test2_haplotc_ann_vcf_gz'], checkIfExists: true),
        file(params.test_data['homo_sapiens']['illumina']['test2_haplotc_ann_vcf_gz_tbi'], checkIfExists: true)

    ]
    chain = file(params.test_data['homo_sapiens']['genome']['genome_chain_gz'], checkIfExists: true)
    fasta = file(params.test_data['homo_sapiens']['genome']['genome_21_fasta'], checkIfExists: true)
    fai = file(params.test_data['homo_sapiens']['genome']['genome_21_fasta_fai'], checkIfExists: true)
    dict = file(params.test_data['homo_sapiens']['genome']['genome_21_dict'], checkIfExists: true)

    GATK4_LIFTOVERVCF ( input, chain, fasta, fai, dict )
}
