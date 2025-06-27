# Expressie in de KEGG-pathway hsa04612 – Antigen Processing and Presentation Pathway bij Reumatoïde Artritis

Er is onderzocht hoe Reumatoïde Artritis de genexpressie beïnvloedt, aan de hand van verschillende transcriptomics-analyses zoals DESeq en KEGG-pathway.

## 📁 Inhoud

- `data/raw/` – ruwe dataset  
- `data/processed/` – verwerkte datasets gegenereerd met scripts  
- `scripts/` – scripts voor de analyses  
- `resultaten/` – grafieken en tabellen  
- `bronnen/` – gebruikte bronnen  
- `README.md` – het document dat de tekst op deze pagina genereert  
- `assets/` – overige documenten 
- `data_stewardship/` – informatie voor de competentie beheren

---

## 🧬 Inleiding

Reumatoïde Artritis is een auto-immuunziekte. Dit betekent dat je eigen immuunsysteem je lichaam aanvalt. Hierbij komen ontstekingseiwitten vrij, wat vaak leidt tot ontstekingen in de gewrichten. Ongeveer 0,5–1% van de wereldbevolking heeft Reumatoïde Artritis. Dit percentage verschilt per land [Silman & Pearson, 2002](bronnen/Epidemiology_and_genetics_of_rheumatoid_arthritis.pdf).  
De oorzaak van Reumatoïde Artritis is onbekend, maar er zijn verschillende risicofactoren, zoals geslacht, leeftijd, genetische aanleg en overgewicht [Mayo Clinic, april 2025](https://www.mayoclinic.org/diseases-conditions/rheumatoid-arthritis/symptoms-causes/syc-20353648?p=1).  
De ziekte kent diverse symptomen zoals stijve en/of gezwollen gewrichten, vermoeidheid en verminderde mobiliteit [ClevelandClinic, juni 2024](https://my.clevelandclinic.org/health/diseases/4924-rheumatoid-arthritis).  
Er is momenteel geen genezende behandeling beschikbaar, daarom is het belangrijk om precies te weten hoe dat deze ziekte werkt. In dit onderzoek wordt met behulp van transcriptomics onderzocht welk effect Reumatoïde Artritis heeft op de expressie van genen en pathways.Er wordt dan gekeken naar hoeveel genen er in totaal omhoog of omlaag gereguleerd worden, daarnaast wordt er ook gekeken naar de biologische processen en pathways om zo hopelijk beter de ziekte te begrijpen en hopelijk ooit een medicijn te vinden.

---

## 🧪 Methoden

Om te onderzoeken of dat Reumatoïde artritis de expressie van genen veranderd zijn er van acht deelnemers uit het synoviumbiopten. Vier deelnemers waren gezond, vier hadden langer dan twaalf maanden Reumatoïde Artritis. Alle deelnemers waren vrouwen. De behandelgroep was gemiddeld ouder dan de controlegroep, zoals te zien in [deze tabel](assets/ruw_data_deelnemers.csv). De methoden van de data-analyses zijn in deze [flowchart](assets/flowchard.PNG) in een versimpelde manier weergeven. Hieronder worden ze in meer diepte uitgelegd.

De reads zijn als eerste gemapt tegen het [menselijk genoom versie GCF_000001405.40](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/) met [dit script](scripts/mapping_data.R). hiervoor is de package [Rsubread versie 2.22.1](https://bioconductor.org/packages/release/bioc/html/Rsubread.html) gebruikt. Na het mappen is van de data een count matrix gemaakt met [Rsamtools versie 2.24.0](https://bioconductor.org/packages/release/bioc/html/Rsamtools.html) volgens [dit script](scripts/count_matrix.R). Daarna is er een [DESeq2 versie 1.48.1](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) analyse gedaan om de significante resultaten in een [deze tabel](resultaten/dds.resultaten) te zetten, er is gebruik gemaakt van [dit script](scripts/DESeq2-analyse.R). Met de resultaten van de DESeq2 analyse zijn vervolgens drie andere analyses gedaan met [dit script](scripts/vulcano_plot,GO-analyse&KEGG_pathway.R). Daarna zijn drie aanvullende analyses uitgevoerd met behulp van de DESeq resultaten via [dit script](scripts/vulcano_plot,GO-analyse&KEGG_pathway.R):

- **Vulkaanplot:** Met [EnhancedVolcano v1.26.0](https://bioconductor.org/packages/release/bioc/html/EnhancedVolcano.html) is een vulkaanplot gegenereerd om significante genen te visualiseren.
- **GO-analyse:** Met [goseq v1.60.0](https://bioconductor.org/packages/release/bioc/html/goseq.html) is een GO-verrijkingsanalyse uitgevoerd.
- **KEGG-analyse:** De pathway hsa04612 werd geanalyseerd met [pathview](https://bioconductor.org/packages/release/bioc/html/pathview.html), geselecteerd op basis van GO-resultaten.

---

## 📊 Resultaten

Om te onderzoeken of dat Reumatoïde artritis invloed heeft op de expressie van genen is er een DESeq-analyse uitgevoerd de resultaten hiervan zijn beschikbaar in [deze tabel](resultaten/dds.resultaten). Hierin zijn alle genen met een p waarde en foldchange zichtbaar. 

Een bijbehorende [vulkaanplot](resultaten/vulcano_plot.png) toont de log2 foldchange tegenover de log10 p-waarde.  
- **Groene punten** = biologisch significant  
- **Rode punten** = biologisch én statistisch significant  

| Richting regulatie | Aantal genen |
|--------------------|---------------|
| Neerwaarts         | 2487          |
| Opwaarts           | 2085          |

De [GO-analyse](resultaten/GO-analyse.csv) toont dat het proces *Adaptive immune response* (GO:0002250) de laagste p-waarde had [p = 0.004].

De KEGG-pathwayanalyse van [hsa04612](resultaten/hsa04612.png) laat zien dat veel genen in deze pathway **neerwaarts gereguleerd** zijn (groen gemarkeerd).

---

## ✅ Conclusie

Uit de resultaten is gebleken dat Reumatoïde Artritis invloed heeft op de expressie van meerdere genen, waarvan sommige verhoogd en andere verlaagd zijn. De KEGG-pathway hsa04612 antigen processing and presentation pathway toont duidelijk een afname in expressie, wat overeenkomt met eerdere bevindingen waarin de expressie van de pathway ook afneemt [Song et al., z.d.](bronnen/Identifying_key_genes_in_rheumatoid_arthritis_using_bioinformatics_analysis.pdf). Voor vervolgonderzoek is het aan te bevelen om leeftijdsverschillen tussen behandel- en controlegroep te minimaliseren.

---

