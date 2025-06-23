# zet working derectory
setwd("locatie/ergens/op/je/computer")
# unzip files
unzip("raw_data/Data_RA_raw.zip", exdir = "raw_data") #Hiermee worden de bestanden uitgepakt in een submap 'ethanol_data'
# install Rsubread
install.packages('BiocManager')
BiocManager::install('Rsubread')
library(Rsubread)

# referentiegenoom indexeren
# link human refseq https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/
buildindex(
  basename = 'ref_human_29_file',
  reference = 'hooman_genome/ncbi_dataset/data/GCA_000001405.29/GCA_000001405.29_GRCh38.p14_genomic.fna',
  memory = 10000,
  indexSplit = TRUE)
# Mapping uitvoeren
align.ruma1 <- align(index = "ref_human_29_file", readfile1 = "raw_data/SRR4785819_1_subset40k.fastq", readfile2 = "raw_data/SRR4785819_2_subset40k.fastq", nthreads = 12, output_file = "bamfiles/control1.BAM")
align.ruma2 <- align(index = "ref_human_29_file", readfile1 = "raw_data/SRR4785820_1_subset40k.fastq", readfile2 = "raw_data/SRR4785820_2_subset40k.fastq", nthreads = 12, output_file = "bamfiles/control2.BAM")
align.ruma3 <- align(index = "ref_human_29_file", readfile1 = "raw_data/SRR4785828_1_subset40k.fastq", readfile2 = "raw_data/SRR4785828_2_subset40k.fastq", nthreads = 12, output_file = "bamfiles/control3.BAM")
align.ruma4 <- align(index = "ref_human_29_file", readfile1 = "raw_data/SRR4785831_1_subset40k.fastq", readfile2 = "raw_data/SRR4785831_2_subset40k.fastq", nthreads = 12, output_file = "bamfiles/control4.BAM")
align.control1 <- align(index = "ref_human_29_file", readfile1 = "raw_data/SRR4785979_1_subset40k.fastq", readfile2 = "raw_data/SRR4785979_2_subset40k.fastq", nthreads = 12, output_file = "bamfiles/ruma1.BAM")
align.control2 <- align(index = "ref_human_29_file", readfile1 = "raw_data/SRR4785980_1_subset40k.fastq", readfile2 = "raw_data/SRR4785980_2_subset40k.fastq", nthreads = 12, output_file = "bamfiles/ruma2.BAM")
align.control3 <- align(index = "ref_human_29_file", readfile1 = "raw_data/SRR4785986_1_subset40k.fastq", readfile2 = "raw_data/SRR4785986_2_subset40k.fastq", nthreads = 12, output_file = "bamfiles/ruma3.BAM")
align.control4 <- align(index = "ref_human_29_file", readfile1 = "raw_data/SRR4785988_1_subset40k.fastq", readfile2 = "raw_data/SRR4785988_2_subset40k.fastq", nthreads = 12, output_file = "bamfiles/ruma4.BAM")

# Laad Rsamtools voor sorteren en indexeren
BiocManager::install('Rsamtools')
library(Rsamtools)
# Bestandsnamen van de monsters
samples <- c('ruma1', 'ruma2', 'ruma3', 'ruma4', 'control1', 'control2', 'control3', 'control4')
# Voor elk monster: sorteer en indexeer de BAM-file
# Sorteer BAM-bestanden
setwd("locatie/ergens/op/je/computer/map/voor/bamfiles")
lapply(samples, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
}) 
setwd("locatie/ergens/op/je/computer")
#Indexeer BAM-bestanden
indexBam("bamfiles/ruma1.sorted.bam")
indexBam("bamfiles/ruma2.sorted.bam")
indexBam("bamfiles/ruma3.sorted.bam")
indexBam("bamfiles/ruma4.sorted.bam")

indexBam("bamfiles/control1.sorted.bam")
indexBam("bamfiles/control2.sorted.bam")
indexBam("bamfiles/control3.sorted.bam")
indexBam("bamfiles/control4.sorted.bam")
#indexeer het FASTA bestand
indexFa("hooman_genome/ncbi_dataset/data/GCA_000001405.29/GCA_000001405.29_GRCh38.p14_genomic.fna")