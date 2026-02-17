# msb-thesis

Quarto-Template für Abschlussarbeiten an der Münster School of Business (MSB), FH Münster.

**Status: Beta - Vollständig funktionsfähig**

## Features

- ✅ **Deutsch & Englisch** - Sprachumschaltung für alle Labels
- ✅ **PDF & HTML Output** - Beide Formate unterstützt
- ✅ **MSB-Formatierung** - 12pt, 1,5-zeilig, A4, korrekte Seitenränder
- ✅ **Code-Highlighting** - R und Python mit Syntax-Färbung
- ✅ **Bibliographie** - APA-Style (citeproc), funktionierende Zitation
- ✅ **Tabellen & Abbildungen** - Automatische Nummerierung & Cross-References
- ✅ **6 Beispiel-Kapitel** - Mit R/Python-Code, Tabellen, Plots

## Systemanforderungen

### Erforderlich

| Tool | Version | Zweck |
|------|---------|-------|
| **Quarto** | ≥1.4.0 | Dokumentenerstellung |
| **TinyTeX** | aktuell | PDF-Generierung (LaTeX) |

### Optional (für R/Python-Code)

| Tool | Zweck |
|------|-------|
| **R** + knitr | R-Code ausführen |
| **Python** + Jupyter | Python-Code ausführen |

---

## Installation

### Paketmanager erklärt

#### 🍺 Homebrew (macOS)

**Was ist Homebrew?**
Homebrew (oder kurz "brew") ist der Standard-Paketmanager für macOS. Ähnlich wie `apt` unter Linux, ermöglicht es das einfache Installieren von Software über die Kommandozeile.

**Installation:**
```bash
# Homebrew installieren (einmalig)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Verwendung:**
```bash
# Paket suchen
brew search quarto

# Paket installieren
brew install quarto

# Paket aktualisieren
brew upgrade quarto

# Alle Pakete aktualisieren
brew update && brew upgrade
```

**Vorteile:**
- Einfache Installation und Deinstallation
- Automatische Updates
- Abhängigkeiten werden automatisch installiert

---

#### 🪟 Winget (Windows)

**Was ist Winget?**
Winget (Windows Package Manager) ist Microsoft's offizieller Paketmanager für Windows, inkludiert in Windows 10/11. Ähnlich wie brew für macOS oder apt für Linux.

**Installation:**
Winget ist in Windows 10 (ab Version 1809) und Windows 11 bereits vorinstalliert.

Falls nicht vorhanden:
1. Microsoft Store öffnen
2. "App Installer" suchen und installieren
3. Oder: https://github.com/microsoft/winget-cli/releases

**Verwendung:**
```powershell
# In PowerShell oder CMD

# Paket suchen
winget search quarto

# Paket installieren
winget install quarto

# Paket aktualisieren
winget upgrade quarto

# Alle Pakete auflisten
winget list

# Alle Pakete aktualisieren
winget upgrade --all
```

**Vorteile:**
- Von Microsoft offiziell unterstützt
- In Windows integriert
- Keine zusätzliche Software nötig

---

### 1. Quarto installieren

#### Linux (Ubuntu/Debian)

```bash
# Methode 1: DEB-Paket (empfohlen)
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.37/quarto-1.6.37-linux-amd64.deb
sudo dpkg -i quarto-1.6.37-linux-amd64.deb
sudo apt-get install -f

# Methode 2: apt-Repository
wget -qO- https://quarto.org/install-quarto.sh | sudo bash

# Verify
quarto --version
```

#### macOS

```bash
# Homebrew (empfohlen) 🍺
brew install quarto

# Oder manuell
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.37/quarto-1.6.37-macos.pkg
sudo installer -pkg quarto-1.6.37-macos.pkg -target /

# Verify
quarto --version
```

#### Windows

```powershell
# Winget (empfohlen) 🪟
winget install quarto

# Oder Chocolatey
choco install quarto

# Oder manuell: https://quarto.org/docs/get-started/

# Verify (neues Terminal öffnen)
quarto --version
```

---

### 2. TinyTeX installieren

TinyTeX ist eine minimale LaTeX-Distribution, die automatisch von Quarto verwaltet wird.

```bash
# Via Quarto (empfohlen)
quarto install tinytex

# Verify
quarto list tools
```

**Alternative: TeX Live (Linux)**

```bash
# Ubuntu/Debian - Vollständig (~5GB)
sudo apt-get install texlive-full

# Oder minimal
sudo apt-get install texlive-xetex texlive-lang-german texlive-fonts-recommended
```

---

### 3. R installieren (optional)

#### Linux (Ubuntu/Debian)

```bash
# Repository hinzufügen
sudo apt update
sudo apt install -y wget gnupg
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/r-project.gpg
echo "deb [signed-by=/usr/share/keyrings/r-project.gpg] https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" | sudo tee /etc/apt/sources.list.d/r-project.list

# R installieren
sudo apt update
sudo apt install -y r-base r-base-dev

# Wichtige Pakete für Quarto
sudo apt install -y r-cran-knitr r-cran-rmarkdown r-cran-tidyverse r-cran-ggplot2 r-cran-broom

# Verify
R --version
```

#### macOS

```bash
# Homebrew 🍺
brew install r

# Oder CRAN-Installer: https://cran.r-project.org/bin/macosx/
```

#### Windows

```powershell
# Winget 🪟
winget install RProject.R

# Oder Download: https://cloud.r-project.org/bin/windows/base/
```

---

### 4. Python installieren (optional)

#### Linux (Ubuntu/Debian)

```bash
sudo apt install -y python3 python3-pip python3-venv python3-pandas python3-numpy python3-matplotlib python3-scipy python3-jupyter
```

#### macOS

```bash
# Homebrew 🍺
brew install python

# Jupyter nachinstallieren
pip3 install jupyter
```

#### Windows

```powershell
# Winget 🪟
winget install Python.Python.3

# Jupyter nachinstallieren
pip install jupyter pandas numpy matplotlib scipy
```

---

## Template verwenden

### Schnellstart

```bash
# 1. Neues Projekt erstellen
quarto use template mchlbckr/msb-thesis

# 2. In das Verzeichnis wechseln
cd msb-thesis

# 3. PDF generieren
quarto render
```

### Konfiguration

#### Metadaten anpassen (`index.qmd`)

```yaml
---
title: "Ihre Thesis-Titel"
author: "Ihr Name"
date: today
program: "Business Administration"
supervisor: "Prof. Dr. Erstbetreuer Name"
# second-supervisor: "Prof. Dr. Zweitbetreuer Name"  # Optional
abstract: |
  Deutsche Zusammenfassung Ihrer Arbeit...
acknowledgements: |
  Danksagung...
---
```

**Hinweis:** `second-supervisor` ist optional. Einfach auskommentieren wenn nicht benötigt.

#### Sprache wählen (`_quarto.yml`)

```yaml
# Deutsch (Standard)
lang: ngerman

# Für Englisch:
# lang: english
# lang-english: true
```

#### Logos hinzufügen (`_quarto.yml`)

```yaml
# Header: FH Logo (oben rechts)
fh-logo: path/to/fh-logo.png

# Footer: MSB Logo (unten rechts)
msb-logo: path/to/msb-logo.png

# Titelseite (optional)
logo: path/to/title-logo.png
```

---

## Projektstruktur

```
msb-thesis/
├── _quarto.yml           # Hauptkonfiguration
├── index.qmd             # Titelseite & Metadaten
├── chapters/             # Inhaltliche Kapitel
│   ├── 01-introduction.qmd
│   ├── 02-literature.qmd
│   ├── 03-methodology.qmd
│   ├── 04-results.qmd
│   ├── 05-discussion.qmd
│   └── 06-conclusion.qmd
├── references.qmd        # Literaturverzeichnis
├── bib/
│   └── references.bib    # BibTeX-Datenbank
├── csl/
│   ├── apa.csl          # APA-Style (Englisch)
│   └── apa-de.csl       # APA-Style (Deutsch)
├── figures/              # Externe Abbildungen
└── _extensions/
    └── msb/thesis/       # Template-Dateien
        ├── _extension.yml
        └── template.tex
```

---

## Formatierung

### Standard-Einstellungen

| Einstellung | Wert |
|-------------|------|
| Schriftart | Liberation Sans (Arial-kompatibel) |
| Schriftgröße | 12pt |
| Zeilenabstand | 1,5-zeilig |
| Seitenränder | 2,5cm (alle Seiten, digitaler Output) |
| Papierformat | A4 |
| Zitierstil | APA (citeproc) |

### Schriftart ändern

Das Template verwendet **Liberation Sans** (Open-Source, Arial-kompatibel).

**Auf Arial ändern** (falls auf Ihrem System installiert - Windows/macOS):

In `_quarto.yml`:
```yaml
format:
  pdf:
    mainfont: "Arial"
    sansfont: "Arial"
    monofont: "Courier New"
```

**Hinweis:** Liberation Sans ist zu 100% Arial-kompatibel und funktioniert auf allen Betriebssystemen.

### Header/Footer Layout

```
┌─────────────────────────────────────┐
│ Thesis-Titel        [FH-Logo]       │  Header
│ Autor-Name                          │
│─────────────────────────────────────│
│                                     │
│           Inhalt                     │  Body
│                                     │
│                                     │
│─────────────────────────────────────│
│ 12                  [MSB-Logo]      │  Footer
└─────────────────────────────────────┘
```

---

## Features im Detail

### Code einbinden

#### R-Code (mit Output)

````markdown
```{r}
#| label: fig-mein-plot
#| fig-cap: "Mein Plot"
#| echo: true   # Code anzeigen
#| warning: false

library(ggplot2)
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()
```

Siehe @fig-mein-plot für die Ergebnisse.
````

#### Python-Code

````markdown
```{python}
#| label: tbl-daten
#| tbl-cap: "Meine Daten"

import pandas as pd
df = pd.DataFrame({'x': [1,2,3], 'y': [4,5,6]})
print(df)
```

Siehe @tbl-daten für die Daten.
````

#### Code-Optionen

| Option | Wert | Bedeutung |
|--------|------|-----------|
| `echo` | true/false | Code anzeigen/verstecken |
| `eval` | true/false | Code ausführen/nicht ausführen |
| `warning` | true/false | Warnungen anzeigen/verstecken |
| `message` | true/false | Messages anzeigen/verstecken |

### Tabellen

#### Mit R

```{r}
knitr::kable(
  data.frame(x = 1:3, y = c("a", "b", "c")),
  caption = "Meine Tabelle"
)
```

#### Mit Markdown

```markdown
| Spalte 1 | Spalte 2 |
|----------|----------|
| Wert 1   | Wert 2   |

: Tabellenüberschrift {#tbl-meine-tabelle}
```

Referenzierung: `@tbl-meine-tabelle`

### Abbildungen

#### Externe Abbildungen

```markdown
![Beschreibung](figures/abbildung.pdf){#fig-meine-abb width="80%"}
```

#### Generierte Plots

Siehe Code-Beispiele oben. Automatisch nummeriert als `fig-*`.

### Cross-References

| Typ | Label | Referenz |
|-----|-------|----------|
| Abbildung | `#fig-name` | `@fig-name` |
| Tabelle | `#tbl-name` | `@tbl-name` |
| Gleichung | `#eq-name` | `@eq-name` |
| Kapitel | (automatisch) | `@sec-name` |

### Bibliographie

#### Eintrag in `bib/references.bib`

```bibtex
@article{smith2020,
  author = {Smith, John},
  title = {A Great Paper},
  journal = {Journal of Research},
  year = {2020},
  volume = {10},
  pages = {1--20}
}
```

#### Zitieren im Text

```markdown
Dies wurde von @smith2020 gezeigt.

Mehrere Quellen [@smith2020; @muller2019].

Klammerzitation [vgl. @smith2020, S. 5].
```

---

## Bildformate

### Empfohlene Formate

| Format | Verwendung | Qualität |
|--------|------------|----------|
| **PDF** | Diagramme, Charts, Vektorgrafiken | ⭐⭐⭐ Beste Qualität |
| **PNG** | Screenshots, Fotos (300 DPI) | ⭐⭐ Gute Qualität |
| **JPG** | Fotos | ⭐ OK für Fotos |

### ⚠️ SVG wird NICHT unterstützt

LaTeX kann SVG nicht direkt verarbeiten. 

**Lösung:** SVG zu PDF konvertieren:

```bash
# Mit Inkscape
inkscape input.svg --export-pdf=output.pdf

# Mit rsvg-convert
rsvg-convert -f pdf -o output.pdf input.svg

# Mit CairoSVG (Python)
pip install cairosvg
cairosvg input.svg -o output.pdf
```

---

## Rendern

```bash
# PDF generieren
quarto render

# Nur PDF
quarto render --to pdf

# HTML generieren
quarto render --to html

# Beide
quarto render --to pdf --to html

# Live-Vorschau (für HTML)
quarto preview
```

---

## Häufige Probleme

### LaTeX-Paket fehlt

```
! LaTeX Error: File `xyz.sty' not found.
```

**Lösung:**
```bash
# Mit TinyTeX
quarto install tinytex

# Oder manuell
~/.TinyTeX/bin/x86_64-linux/tlmgr install xyz
```

### R-Paket fehlt

```
Error: there is no package called 'xyz'
```

**Lösung:**
```bash
# Ubuntu/Debian
sudo apt install r-cran-xyz

# Oder in R
install.packages("xyz")
```

### Bild wird nicht gefunden

```
Unable to load picture or PDF file '...'
```

**Lösung:**
- Pfad relativ zum Projekt-Root angeben
- PNG/PDF statt SVG verwenden
- Datei existiert?

---

## To Do / Roadmap

- [ ] FH Münster Logo hinzufügen
- [ ] MSB Logo hinzufügen
- [ ] Formatvorgaben der MSB finalisieren
- [ ] Word-Output ermöglichen
- [ ] Beispieldaten für Studenten

---

## Entwicklung & Testing

### Ubuntu - Vollständige Installation

```bash
# Quarto
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.37/quarto-1.6.37-linux-amd64.deb
sudo dpkg -i quarto-1.6.37-linux-amd64.deb
sudo apt-get install -f

# TinyTeX
quarto install tinytex

# R + Pakete
sudo apt install -y r-base r-base-dev
sudo apt install -y r-cran-knitr r-cran-rmarkdown r-cran-tidyverse r-cran-ggplot2 r-cran-broom

# Python + Jupyter
sudo apt install -y python3 python3-pip python3-venv
sudo apt install -y python3-pandas python3-numpy python3-matplotlib python3-scipy python3-jupyter

# Verify
quarto --version
R --version
python3 --version
```

---

## Lizenz

MIT

---

## Kontakt & Support

- **Issues:** https://github.com/mchlbckr/msb-thesis/issues
- **FH Münster:** https://www.fh-muenster.de/msb
