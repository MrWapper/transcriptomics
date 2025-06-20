# transcriptomics
project over transcriptomics van het ruema gen

<p align="center">
  <img src="assets/Logo_SpellMetrics.png" alt="Wizarding Spell Metrics Logo" width="600"/>
</p>


# 🧙‍♂️ Wizarding Spell Metrics

Welkom in **Wizarding Spell Metrics**, waar de data nep is, maar de structuur *verrassend oké* is. Deze repo is gemaakt om te laten zie hoe je een bio-informatica project structureert in GitHub met behulp van een onzin dataset. files mogen gedownload en hergebruikt worden (zoals [deze README.md file](README.md)). Vraag ook gerust AI voor tips!

Perfect voor:
- Wegwijs worden in GitHub
- Het leren structureren van data

> `I will not have you in my class if you continue to be a babbling, bumbling band of baboons who can't even SORT their data!`

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

Rheumatoid arthritis is een auto-immuunziekte, dit betekend dat je eigen immuunsysteem je eigen lichaam aanvalt. Hierdoor komen er ontstekingseiwitten vrij. Dit komt vaak voor in de gewrichten en deze gaan hierdoor ontsteken. De oorzaak van Rheumatoid arthritis is niet bekend wel zijn er verschillende factoren die de kans op Rheumatoid arthritis zouden kunnen vergroten zoals, gender, leeftijd, genetische aanleg en overgewicht [Mayo Clinic, april 2025](https://www.mayoclinic.org/diseases-conditions/rheumatoid-arthritis/symptoms-causes/syc-20353648?p=1). Rheumatoid arthritis heeft verschillende symptomen zoals, zoals, stijfe en/of gezwollen gewrichten, vermoeidheid en minder goed kunnen bewegen [ClevelandClinic, juni 2024](https://my.clevelandclinic.org/health/diseases/4924-rheumatoid-arthritis). Er is op dit moment nog geen medicijn voor Rheumatoid arthritis daarom is het belangrijk om precies te weten hoe dat deze ziekte werkt. In dit onderzoek wordt daarom onderzocht welk effect Rheumatoid arthritis heeft op de expressie van genen en pathways.

## Methoden

De data is verstrekt door de Afdeling Magische Wetshandhaving en Ollivanders Wandwinkel Archieven. 

De ruwe data van spreuken is eerst bewerkt voor analyse met behulp van [scripts/01_clean_spell_data.R](scripts/01_clean_spell_data.R). Vervolgens zijn de spreuken geanalyseerd op kracht en nauwkeurigheid met [scripts/02_spell_analysis.R](scripts/02_spell_analysis.R).

Vervolgens is er onderzocht welke KEGG pathway hierbij zou passen hieruit kwam hsa04612, Antigen processing and presentation
## Resultaten
Om te onderzoeken ofdat Rheumatoid arthritis invloed heeft op de expressie van genen is er een DESeq2 analyse uitgevoerd te zien in [deze tabel](resultaten/dds.resultaten). Hierin zijn alle genen met een p waarde en foldchange zichtbaar. Vervolgens zijn er een twee volcano plots gemaakt te zien hier [volcano plot 1](resultaten/vulcano plot 1.png) en [volcano plot 2](resultaten/vulcano plot 1.png). In de figuren is de log2 foldchange uitgezet tegen de log10 van de p waarden. In figuur 1 zijn alle significante genen groen gekleurd. In figuur 2 de groene waarden significant voor de foldchange maar niet voor de p waarden, de rode genen zijn dit wel [welke reden is er dat sommige genen wel een naam hebben en sommige niet?]. 

Er is ook een Gene Ontology (GO)-verrijkingsanalyse uitgevoerd, te zien in [deze tabel](resultaten/GO-analyse.csv). Adaptive immune response, GO:0002250
blijkt hieruit de laagste P-waarde te hebben bij de over-represented genes [p = 0.004]. Daarna is er een KEGG pathway analyse uitgevoerd naar de hsa04612 pathway te zien in [dit figuur](resultaten/hsa04612.png). In dit figuur zijn alle downregulated genen groen gekleurd.  

## Conclusie

Uit de resultaten is gebleken dat Rheumatoid arthritis op verschillende genen invloed heeft waardoor sommige een hogere expressie hebben en sommige een lagere. Ook is er extra gekeken naar de expressie in de hsa04612 KEGG pathway hierin is te zien dat veel genen een lagere expressie hebben dan normaal. Dit komt ook overeen met andere onderzoeken [Song et al., z.d.](bronnen/Identifying key genes in rheumatoid arthritis using bioinformatics analysis). Voor een vervolgonderzoek is aan te raden om verder te kijken naar andere pathways om nog meer inzicht te krijgen hoe Rheumatoid arthritis de expressie van genen kan veranderen.






