# zet working derectory
setwd("locatie/ergens/op/je/computer")
# count matrix maken
library(readr)
library(dplyr)
library(Rsamtools)
library(Rsubread)
# definieert een vector met namen van BAM-bestanden. Elke BAM bevat reads van een RNA-seq-experiment (bijv. behandeld vs. controle).
allsamples <- c("bamfiles/control1.BAM", "bamfiles/control2.BAM", "bamfiles/control3.BAM", "bamfiles/control4.BAM", "bamfiles/ruma1.BAM", "bamfiles/ruma2.BAM", "bamfiles/ruma3.BAM", "bamfiles/ruma4.BAM")
count_matrix <- featureCounts(
  files = allsamples,
  annot.ext = "hooman_genome/ncbi_gtf/genomic.gtf",
  isPairedEnd = FALSE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)
#  tellingen eruit halen
counts <- count_matrix$counts
colnames(counts) <- c("GeneID", "bamfiles/control1.BAM", "bamfiles/control2.BAM", "bamfiles/control3.BAM", "bamfiles/control4.BAM", "bamfiles/ruma1.BAM", "bamfiles/ruma2.BAM", "bamfiles/ruma3.BAM", "bamfiles/ruma4.BAM")
rownames(counts) <- counts[, 1]
# matrix opslaam
write.csv(counts, "locatie/ergens/op/je/computer/mapje/voor/resultaten/countmatrix.csv")