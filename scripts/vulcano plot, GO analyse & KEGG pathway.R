# zet working derectory
setwd("locatie/ergens/op/je/computer")
# inladen DESeq2 analyse
resultaten <- read.table("results/dds.resultaten", 
                  header = TRUE, 
                  sep = " ", 
                  quote = "\"", 
                  stringsAsFactors = FALSE)


# vulcano plot
if (!requireNamespace("EnhancedVolcano", quietly = TRUE)) {
  BiocManager::install("EnhancedVolcano")
}
library(EnhancedVolcano)

EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj')

# Alternatieve plot zonder p-waarde cutoff (alle genen zichtbaar)
EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj',
                pCutoff = 0)


# go analyse
library(goseq)
library(biomaRt)
library(org.Hs.eg.db)
library(ggplot2)
library(GOplot)
library(dplyr)
# filter signifecant results
sigData <- as.integer(!is.na(resultaten$padj) & resultaten$padj < 0.01)
names(sigData) <- rownames(resultaten)
#PWF gebruiken
pwf <- nullp(sigData, "hg19", "geneSymbol", bias.data = resultaten$padj)
goResults <- goseq(pwf, "hg19","geneSymbol", test.cats=c("GO:BP"))
#plot go results
goResults %>% 
  top_n(10, wt=-over_represented_pvalue) %>% 
  mutate(hitsPerc=numDEInCat*100/numInCat) %>% 
  ggplot(aes(x=hitsPerc, 
             y=term, 
             colour=over_represented_pvalue, 
             size=numDEInCat)) +
  geom_point() +
  expand_limits(x=0) +
  labs(x="Hits (%)", y="GO term", colour="p value", size="Count")
# view en save go results
View(goResults)
setwd("locatie/ergens/op/je/computer/mapje/voor/resultaten")
write.csv(goResults, "dds.resultaten.csv", row.names = TRUE)


# kegg pathway analyse
if (!requireNamespace("pathview", quietly = TRUE)) {
  BiocManager::install("pathview")
}
library(pathview)
#visualiseer KEGG pathway
setwd("locatie/ergens/op/je/computer/mapje/voor/resultaten")
resultaten[1] <- NULL
resultaten[2:5] <- NULL
pathview(
  gene.data = gene_vector,
  pathway.id = "hsa04612",  
  species = "hsa",          
  gene.idtype = "KEGG",     
  limit = list(gene = 5)    
)
# resultaten zichtbaar als png file