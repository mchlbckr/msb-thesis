# msb-thesis

Quarto-Template für Abschlussarbeiten an der Münster School of Business (MSB), FH Münster.

## Installation

```bash
quarto add mchlbckr/msb-thesis
```

## Verwendung

1. Neues Projekt erstellen:
```bash
quarto use template mchlbckr/msb-thesis
```

2. Metadaten in `index.qmd` anpassen:
   - Titel, Autor, Datum
   - Studiengang (`program`)
   - Betreuer (`supervisor`)

3. Logo ersetzen:
   - Datei in `_extensions/msb/thesis/assets/logo.png`

4. Kapitel in `chapters/` bearbeiten

5. Rendern:
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
│   └── references.bib    # Literatur
└── _extensions/          # Template-Dateien
```

## Formatierung

Standardmäßig:
- Schriftgröße: 12pt
- Zeilenabstand: 1,5-zeilig
- Seitenränder: links 3cm, rechts 2,5cm
- Papierformat: A4

Anpassbar in `_extensions/msb/thesis/template.tex`.

## Lizenz

MIT
