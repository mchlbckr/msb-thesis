# msb-thesis

Quarto-Template für Abschlussarbeiten an der Münster School of Business (MSB), FH Münster.

**Status: Alpha - Grundfunktionen arbeiten, Bibliographie muss noch konfiguriert werden**

## Features

- Deutsch und Englisch unterstützt
- PDF und HTML Output
- MSB-Formatierung (12pt, 1,5-zeilig, A4)
- 6 Beispiel-Kapitel
- Vorlagen für Abstract, Danksagung, etc.

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

## Lizenz

MIT
