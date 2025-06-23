#  Expressie in de KEGG pathway hsa04612, Antigen processing and presentation pathway wordt sterk verminderd bij mensen met Reumatoïde artritis.
Er is onderzocht hoe Reumatoïde artritis de expressie van genen veranderd doormiddel van verschillende transcriptomics analyses zoals DESeq en KEGG pathway.

## 📁 Inhoud

- `data/raw/` – ruwe dataset
- `data/processed` - verwerkte datasets gegenereerd met scripts 
- `scripts/` – scripts voor de analyses
- `resultaten/` - grafieken en tabellen
- `bronnen/` - gebruikte bronnen 
- `README.md` - het document om de tekst hier te genereren
- `assets/` - overige documenten voor de opmaak van deze pagina
- `data_stewardship/` - Voor de competentie beheren ga je aantonen dat je projectgegevens kunt beheren met behulp van GitHub. In deze folder kan je hulpvragen terugvinden om je op gang te helpen met de uitleg van data stewardship. 

---

## Inleiding

Reumatoïde artritis is een auto-immuunziekte, dit betekend dat je eigen immuunsysteem je eigen lichaam aanvalt. Hierdoor komen er ontstekingseiwitten vrij, dit komt vaak voor in de gewrichten en deze gaan hierdoor ontsteken. De oorzaak van Reumatoïde artritis is niet bekend wel zijn er verschillende factoren die de kans op Reumatoïde artritis zouden kunnen vergroten zoals, gender, leeftijd, genetische aanleg en overgewicht [Mayo Clinic, april 2025](https://www.mayoclinic.org/diseases-conditions/rheumatoid-arthritis/symptoms-causes/syc-20353648?p=1). Reumatoïde artritis heeft verschillende symptomen zoals, zoals, stijf en/of gezwollen gewrichten, vermoeidheid en minder goed kunnen bewegen [ClevelandClinic, juni 2024](https://my.clevelandclinic.org/health/diseases/4924-rheumatoid-arthritis). Er is op dit moment nog geen medicijn voor Reumatoïde artritis daarom is het belangrijk om precies te weten hoe dat deze ziekte werkt. In dit onderzoek wordt daarom onderzocht met behulp van transcriptomics welk effect Reumatoïde artritis heeft op de expressie van genen en pathways. Er wordt dan gekeken naar hoeveel genen er in totaal omhoog of omlaag gereguleerd worden, daarnaast wordt er ook gekeken naar de biologische processen en pathways om zo hopelijk beter de ziekte te begrijpen en hopelijk ooit een medicijn te vinden.

## Methoden

Om te onderzoeken of dat Reumatoïde artritis de expressie van genen veranderd zijn er van acht deelnemers samples genomen uit het synoviumbiopt. Vier deelnemers waren gezond en vier hebben Reumatoïde artritis langer dan twaalf maanden, alle deelnemers zijn een vrouw. De gemiddelde leeftijd van de deelnemers met Reumatoïde artritis licht hoger dan de controlegroep dit is terug tie zien in [deze tabel](assets/ruw_data_deelnemers.csv). De methoden van de data-analyses zijn in deze [flowchart](assets/flowchard.PNG) in een versimpelde manier weergeven. Hieronder worden ze in meer diepte uitgelegd.


De reads zijn als eerste gemapt tegen het [menselijk genoom versie GCF_000001405.40](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000001405.40/) met [dit script](scripts/mapping_data.R). hiervoor is de package [Rsubread versie 2.22.1](https://bioconductor.org/packages/release/bioc/html/Rsubread.html) gebruikt. Na het mappen is van de data een count matrix gemaakt met [Rsamtools versie 2.24.0](https://bioconductor.org/packages/release/bioc/html/Rsamtools.html) volgens [dit script](scripts/count_matrix.R). Daarna is er een [DESeq2 versie 1.48.1](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) analyse gedaan om de significante resultaten in een [deze tabel](resultaten/dds.resultaten) te zetten, er is gebruik gemaakt van [dit script](scripts/DESeq2-analyse.R). Met de resultaten van de DESeq2 analyse zijn vervolgens drie andere analyses gedaan met [dit script](scripts/vulcano_plot,GO-analyse&KEGG_pathway.R).

- Er is een vulcano plot gemaakt met et [vulcano package versie 1.26.0](https://bioconductor.org/packages/release/bioc/html/EnhancedVolcano.html) om te laten zien welke genen significant veranderen en of de foldchange hoger of lager is.

- Er is een Gene Ontology-analyse [GO-analyse] gedaan met [goseq versie 1.60.0](https://bioconductor.org/packages/release/bioc/html/goseq.html) om te zien welke biologische processen betrokken zijn bij de significant veranderde genen.

- Er is een KEG pathway analyse gedaan met [pathview](https://bioconductor.org/packages/release/bioc/html/pathview.html) op de hsa04612, Antigen processing and presentation pathway. Deze is gekozen aan de hand van de resultaten van de GO-analyse. 

## Resultaten
Om te onderzoeken of dat Reumatoïde artritis invloed heeft op de expressie van genen is er een DESeq2 analyse uitgevoerd te zien in [deze tabel](resultaten/dds.resultaten). Hierin zijn alle genen met een p waarde en foldchange zichtbaar. Vervolgens is er een vulcano plot gemaakt te zien hier [vulcano plot](resultaten/vulcano_plot.png). In het figuur zijn de log2 foldchange uitgezet tegen de log10 van de p waarden. De groene waarden zijn biologisch significant en de rode waarden zijn biologisch en statistisch significant. In totaal zijn er 2487 genen neer gereguleerd en 2085 genen omhoog gereguleerd. 

Er is ook een Gene Ontology (GO)-verrijkingsanalyse uitgevoerd, te zien in [deze tabel](resultaten/GO-analyse.csv). Adaptive immune response, GO:0002250
blijkt hieruit de laagste P-waarde te hebben bij de over-represented genes [p = 0.004]. Daarna is er een KEGG pathway analyse uitgevoerd naar de hsa04612 pathway te zien in [dit figuur](resultaten/hsa04612.png). In dit figuur zijn alle omlaag gereguleerde genen groen gekleurd.  

## Conclusie

Uit de resultaten is gebleken dat Reumatoïde artritis op verschillende genen invloed heeft waardoor sommige een hogere expressie hebben en sommige een lagere. Ook is er extra gekeken naar de expressie in de hsa04612 KEGG pathway hierin is te zien dat veel genen een lagere expressie hebben dan normaal. Dit komt ook overeen met andere onderzoeken [Song et al., z.d.](bronnen/Identifying_key_genes_in_rheumatoid_arthritis_using_bioinformatics_analysis). Voor een vervolgonderzoek is nodig om eventuele leeftijd verschillen te beperken, aangezien de gemiddelde leeftijd van de controlegroep een heel stuk lager is dan de behandelgroep.
