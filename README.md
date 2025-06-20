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

- `data/raw/` – fictionele datasets voor de analyse van spreuk effectiviteit, gevaar en welke spreuken het beste samengaan met verschillende types staf.  
- `data/processed` - verwerkte datasets gegenereerd met scripts 
- `scripts/` – scripts om prachtige onzin te genereren
- `resultaten/` - grafieken en tabellen
- `bronnen/` - gebruikte bronnen 
- `README.md` - het document om de tekst hier te genereren
- `assets/` - overige documenten voor de opmaak van deze pagina
- `data_stewardship/` - Voor de competentie beheren ga je aantonen dat je projectgegevens kunt beheren met behulp van GitHub. In deze folder kan je hulpvragen terugvinden om je op gang te helpen met de uitleg van data stewardship. 

---

## Introductie

Deze GitHub pagina staat in het teken van magische spreuken en hun eigenschappen (Harry Potter⚡). Met behulp van historische registergegevens kan de **kracht**, **nauwkeurigheid** en het **risiconiveau** geanalyseerd worden. Voor een goede tovenaar is het van belang dat de gebruikte spreuken effectief en veilig zijn om te gebruiken. Daarnaast is het van belang voor elke tovenaar om rekening te houden met de compatibiliteit van het type toverstok dat gebruikt wordt om de geschiktheid van spreukgebruik af te stemmen.  

Heb je Harry Potter nooit gelezen? Moet je echt doen, [klik maar hier](bronnen/harry-potter.pdf).

## Methoden

De data is verstrekt door de Afdeling Magische Wetshandhaving en Ollivanders Wandwinkel Archieven. 

De ruwe data van spreuken is eerst bewerkt voor analyse met behulp van [scripts/01_clean_spell_data.R](scripts/01_clean_spell_data.R). Vervolgens zijn de spreuken geanalyseerd op kracht en nauwkeurigheid met [scripts/02_spell_analysis.R](scripts/02_spell_analysis.R).

Vervolgens is er onderzocht welke KEGG pathway hierbij zou passen hieruit kwam hsa04612, Antigen processing and presentation
## 📊 Resultaten
Om te onderzoeken ofdat Rheumatoid arthritis invloed heeft op de exspressie van genen is er een DESeq2 analyse uitgevoerd te zien in [deze tabel](resultaten/dds.resultaten). Hierin zijn alle genen met een p waarde en foldchange zichtbaar. Vervolgens zijn er een twee volcano plots gemaakt te zien hier [volcanoplot1](resultaten/vulcano plot 1.png) en [volcano plot 2](resultaten/vulcano plot 1.png). In de figuren is de log2 foldchange uitgezet tegen de log10 van de p waarden. In figuur 1 zijn alle significante genen groen gekleurd. In figuur 2 de groene waarden significant voor de foldchange maar niet voor de p waarden, de rode genen zijn dit wel [welke reden is er dat sommige genen wel een naam hebben en sommige niet?]. 

Er is ook een Gene Ontology (GO)-verrijkingsanalyse uitgevoerd, te zien in [deze tabel](resultaten/GO-analyse.csv). Adaptive immune response, GO:0002250
blijkt hieruit de laagste P-waarde te hebben bij de over-represented genes [p = 0.004]. Daarna is er een KEGG pathway analyse uitgevoerd naar de hsa04612 pathway te zien in [dit figuur](resultaten/hsa04612.png). In dit figuur zijn alle downregulated genen groen gekleurd.  

## Conclusie

Uit de resultaten is gebleken dat Rheumatoid arthritis op verschillende genen invloed heeft waardoor sommige een hogere exspressie hebben en sommige een lagere. Ook is er extra gekeken naar de exspressie in de hsa04612 KEGG pathway hierin is te zien dat veel genen een lagere exspressie hebben dan normaal. Dit komt ook evereen met andere onderzoeken [Song et al., z.d.](bronnen/Identifying key genes in rheumatoid arthritis using bioinformatics analysis). Voor een vervolg onderzoek is aan te raden om verder te kijken naar andere pathways om nog meer inzicht te krijgen hoe Rheumatoid arthritis de exspressie van genen kan veranderen.


Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 





