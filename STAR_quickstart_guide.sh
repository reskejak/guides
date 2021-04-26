# STAR quick-start usage for typical alignment and gene-level quantification of RNA-seq data
# STAR is only suitable for RNA-seq data and should not be used for ChIP/ATAC/etc.

# note: \ (backslash) in unix is interpreted as "disregard next character"
# we can break up long lines of code by following \ with carriage return

# note: STAR uses a LOT of resources and can take a few hours. You will need to request resources in the form of an interactive job on HPCC:
# srun -t 08:00:00 --ntasks=1 --cpus-per-task=2 --mem-per-cpu=32G --pty /bin/bash
# this will request 8 hours of CPU time for 2 cores and 32 gb RAM per core
# once you type it into terminal console, may take a minute until job access granted
# see below for usage

######################################
# install STAR via conda
# https://anaconda.org/bioconda/star
conda install -c bioconda star

######################################
# index genome via STAR (upon first time using this genome/annotation/read-length with STAR)
# you only have to do this once!
# we will do this in the folder containing the reference genome fasta file
# first make a reference genome folder and enter it
cd ~
mkdir ref_genome
cd ~/ref_genome

# download reference hg38/GRCh38 human genome from UCSC (using wget)
# file is 1 gb so may take a minute
wget http://hgdownload.cse.ucsc.edu/goldenpath/hg38/bigZips/hg38.fa.gz
# unzip it (with gunzip)
gunzip hg38.fa.gz
# note: .fa is a fasta file; https://en.wikipedia.org/wiki/FASTA_format

# download hg38 feature annotation file (i.e. where genes are located)
# we are using GENCODE's latest release (e.g. v37); https://www.gencodegenes.org/human/
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_37/gencode.v37.annotation.gff3.gz
# unzip it (with gunzip)
gunzip gencode.v37.annotation.gff3.gz
# gff3 is a genome annotation format; https://m.ensembl.org/info/website/upload/gff3.html

# make directory for indexed genome output files
mkdir hg38_STAR_index

# request resources for STAR indexing
srun -t 08:00:00 --ntasks=1 --cpus-per-task=2 --mem-per-cpu=32G --pty /bin/bash
# index hg38 to the GENCODE v37 annotation
STAR --runMode genomeGenerate \ 
--runThreadN 16 \ 
--genomeDir ~/ref_genome/hg38_STAR_index \ 
--genomeFastaFiles ~/ref_genome/hg38.fa \ 
--sjdbGTFfile ~/ref_genome/annotation.gff3 \ 
--sjdbGTFtagExonParentTranscript Parent \ 
--sjdbOverhang 49
# note: --sjdbOverang should equal [read length]-1, or 50-1 = 49 (for PE 50bp reads)
# note: "--sjdbGTFtagExonParentTranscript Parent" must be used with gff3 annotation files

# the result is a folder containing the annotated genome index:
# ~/ref_genome/hg38_STAR_index

#############################################
# align RNA-seq reads to indexed reference via STAR
# navigate to directory with trimmed fastq.gz files
cd ~/my_rnaseq_data/trimmed/

# first, unzip fastq files (using gunzip)
# STAR is supposed to accept gz files, but bugs for me sometimes
gunzip sample1_R1_val_1.fq.gz
gunzip sample1_R2_val_2.fq.gz 
# unzipped fastq files are really big and should be re-zipped after use

# request resources for STAR indexing
srun -t 08:00:00 --ntasks=1 --cpus-per-task=2 --mem-per-cpu=32G --pty /bin/bash
# align to indexed genome with annotation
STAR --runMode alignReads \ 
--runThreadN 16 \ 
--genomeDir ~/ref_genome/genome_STAR_index \ 
--readFilesIn sample1_R1_val_1.fq sample1_R2_val_2.fq \ 
--outFileNamePrefix sample1_ \ 
--outSAMtype BAM SortedByCoordinate \ 
--quantMode GeneCounts

# the resulting gene-level read counts for each sample can be found in the output file: 
# sample1_ReadsPerGene.out.tab

# finally, re-zip fastq files (using gzip)
gzip sample1_R1_val_1.fq
gzip sample1_R2_val_2.fq
