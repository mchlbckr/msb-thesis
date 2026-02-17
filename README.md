# msb-thesis

Quarto-Template für Abschlussarbeiten an der Münster School of Business (MSB), FH Münster.

**Status: Alpha - Grundfunktionen arbeiten, Bibliographie muss noch konfiguriert werden**

## Features

- Deutsch und Englisch unterstützt
- PDF und HTML Output
- MSB-Formatierung (12pt, 1,5-zeilig, A4)
- 6 Beispiel-Kapitel
- Vorlagen für Abstract, Danksagung, etc.

## Systemanforderungen

### Erforderlich

| Tool | Version | Zweck |
|------|---------|-------|
| **Quarto** | ≥1.4.0 | Dokumentenerstellung |
| **TinyTeX** | aktuell | PDF-Generierung (LaTeX) |

### Optional (für R/Python-Code)

| Tool | Zweck |
|------|-------|
| **R** | R-Code in der Thesis |
| **Python** | Python-Code in der Thesis |
| **Jupyter** | Interaktive Notebooks |

## Installation

### 1. Quarto installieren

#### Linux (Ubuntu/Debian)

```bash
# Methode 1: DEB-Paket (empfohlen)
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.37/quarto-1.6.37-linux-amd64.deb
sudo dpkg -i quarto-1.6.37-linux-amd64.deb
sudo apt-get install -f  # Abhängigkeiten nachinstallieren

# Methode 2: Tarball
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.37/quarto-1.6.37-linux-amd64.tar.gz
tar -xzf quarto-1.6.37-linux-amd64.tar.gz
sudo mv quarto-1.6.37 /opt/quarto
sudo ln -s /opt/quarto/bin/quarto /usr/local/bin/quarto

# Verify
quarto --version
```

#### macOS

```bash
# Homebrew (empfohlen)
brew install quarto

# Oder manuell
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.37/quarto-1.6.37-macos.pkg
sudo installer -pkg quarto-1.6.37-macos.pkg -target /

# Verify
quarto --version
```

#### Windows

```powershell
# Winget
winget install quarto

# Oder Chocolatey
choco install quarto

# Oder manuell: Download von
# https://github.com/quarto-dev/quarto-cli/releases

# Verify (neues Terminal)
quarto --version
```

### 2. TinyTeX installieren

```bash
# Via Quarto (empfohlen)
quarto install tinytex

# Verify
quarto list tools
```

**Alternative: TeX Live (Linux)**

```bash
# Ubuntu/Debian
sudo apt-get install texlive-full  # ~5GB, alles inklusive
# Oder minimal:
sudo apt-get install texlive-xetex texlive-lang-german texlive-fonts-recommended
```

### 3. R installieren (optional)

#### Linux (Ubuntu/Debian)

```bash
# Repository hinzufügen
sudo apt update
sudo apt install -y wget gnupg
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/r-project.gpg
echo "deb [signed-by=/usr/share/keyrings/r-project.gpg] https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" | sudo tee /etc/apt/sources.list.d/r-project.list

# Installieren
sudo apt update
sudo apt install -y r-base r-base-dev

# Verify
R --version
```

#### macOS

```bash
brew install r
```

#### Windows

```powershell
winget install RProject.R
# Oder Download: https://cloud.r-project.org/bin/windows/base/
```

### 4. Python installieren (optional)

#### Linux (Ubuntu/Debian)

```bash
sudo apt install -y python3 python3-pip python3-venv
```

#### macOS

```bash
brew install python
```

#### Windows

```powershell
winget install Python.Python.3
```

### 5. Jupyter installieren (optional)

```bash
# Mit pip
pip install jupyter

# Oder mit conda
conda install jupyter
```

## Template verwenden

1. Neues Projekt erstellen:
```bash
quarto use template mchlbckr/msb-thesis
```

2. Metadaten in `index.qmd` anpassen:
   - Titel, Autor, Datum
   - Studiengang (`program`)
   - Betreuer (`supervisor`)

3. Sprache wählen in `_quarto.yml`:
   ```yaml
   # Für Deutsch (Standard):
   lang: ngerman
   
   # Für Englisch:
   # lang: english
   # lang-english: true
   ```

4. Logo ersetzen:
   - Datei in `_extensions/msb/thesis/assets/logo.png`

5. Kapitel in `chapters/` bearbeiten

6. Rendern:
```bash
quarto render
```

## Struktur

```
msb-thesis/
├── _quarto.yml           # Konfiguration
├── index.qmd             # Titelseite
├── chapters/             # Kapitel
│   ├── 01-introduction.qmd
│   ├── 02-literature.qmd
│   └── ...
├── bib/
│   └── references.bib    # Literatur (derzeit deaktiviert)
└── _extensions/          # Template-Dateien
```

## Formatierung

Standardmäßig:
- Schriftgröße: 12pt
- Zeilenabstand: 1,5-zeilig
- Seitenränder: links 3cm, rechts 2,5cm, oben/unten 2,5cm
- Papierformat: A4

Anpassbar in `_extensions/msb/thesis/template.tex`.

## Bekannte Einschränkungen

- Bibliographie/Literaturverzeichnis muss noch konfiguriert werden
- Logo ist optional (Template funktioniert ohne)

## To Do

- [ ] Bibliographie mit CSL-Unterstützung
- [ ] MSB-Logo hinzufügen
- [ ] Formatvorgaben der MSB einpflegen
- [ ] Ausführlichere Beispiel-Kapitel

## Entwicklung & Testing

### Ubuntu - Alles global installieren

```bash
# Quarto
wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.37/quarto-1.6.37-linux-amd64.deb
sudo dpkg -i quarto-1.6.37-linux-amd64.deb
sudo apt-get install -f

# TinyTeX
quarto install tinytex

# R (optional)
sudo apt update
sudo apt install -y r-base r-base-dev

# Python & Jupyter (optional)
sudo apt install -y python3 python3-pip python3-venv
pip install jupyter

# Verify alles
quarto --version
R --version
python3 --version
jupyter --version
```

## Lizenz

MIT
