# zet working derectory
setwd("locatie/ergens/op/je/computer")
# count matrix inladen
counts <- read.delim("official_countmatrix/count_matrix.txt", row.names = 1)
library(DESeq2)
library(KEGGREST)

# DESeq2-analyse
# tabel met behandelingen
treatment <- c("control", "control", "control", "control", "Rheumatoid", "Rheumatoid", "Rheumatoid", "Rheumatoid")
treatment_table <- data.frame(treatment)
rownames(treatment_table) <- c("SRR4785819", "SRR4785820", "SRR4785828", "SRR4785831",	"SRR4785979",	"SRR4785980",	"SRR4785986", "SRR4785988")
# Maak DESeqDataSet aan
counts <- data.frame(lapply(counts, function(col) as.integer(round(col))), row.names = rownames(counts))
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = treatment_table,
                              design = ~ treatment)
# Voer analyse uit
dds <- DESeq(dds)
resultaten <- results(dds)
# Resultaten opslaan in een bestand
write.table(resultaten, file = 'locatie/ergens/op/je/computer/mapje/voor/resultaten/dds.resultaten', row.names = TRUE, col.names = TRUE)
