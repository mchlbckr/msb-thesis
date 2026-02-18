# msb-thesis

Quarto template for theses at Münster School of Business (MSB), FH Münster.

[![Build and Deploy](https://github.com/mchlbckr/msb-thesis/actions/workflows/build.yml/badge.svg)](https://github.com/mchlbckr/msb-thesis/actions/workflows/build.yml)
[![Release](https://img.shields.io/github/v/release/mchlbckr/msb-thesis)](https://github.com/mchlbckr/msb-thesis/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Quarto >=1.4.0](https://img.shields.io/badge/Quarto-%3E%3D1.4.0-39729E)](https://quarto.org/)

**Release:** `v1.0.0` (stable) 🚀

This template is designed for students who want a working thesis setup with as little technical setup pain as possible.

## Who This Is For 👥

- Students writing a Bachelor or Master thesis at MSB
- Students with limited command-line experience
- Supervisors who want a reproducible thesis template for PDF and HTML outputs (me 🙋)

## What You Get ✅

- Thesis structure with chapter files
- MSB/FH title-page options (logos, pattern, thesis metadata)
- PDF and HTML output
- German and English language support
- APA citation styles (`csl/apa-de.csl`, `csl/apa.csl`)
- Example bibliography, references, figures, and code chunks

## Fastest Path (5 Minutes) ⚡

If you already have Quarto + TinyTeX installed:

```bash
quarto use template mchlbckr/msb-thesis
cd msb-thesis
quarto render
```

If build succeeds, your outputs are here:

- `_output/index.html` (default book output)
- `_output-pdf/Thesis-Title.pdf` (if using `make pdf`)

## Full Setup (Beginner-Friendly) 🧭

If you are new to this, follow these steps in order.

### 1. Install Quarto 📦

Official docs: https://quarto.org/docs/get-started/

#### Windows (easy path)

1. Open PowerShell.
2. Run:

```powershell
winget install quarto
```

3. Close and reopen PowerShell.
4. Verify:

```powershell
quarto --version
```

#### macOS (easy path)

1. Open Terminal.
2. Run:

```bash
brew install quarto
```

3. Verify:

```bash
quarto --version
```

#### Ubuntu/Debian (easy path)

```bash
wget -qO- https://quarto.org/install-quarto.sh | sudo bash
quarto --version
```

### 2. Install TinyTeX (for PDF export) 📝

Run in terminal:

```bash
quarto install tinytex
```

Verify:

```bash
quarto list tools
```

### 3. Optional: Install R and/or Python 🧪

You only need this if your thesis includes executable R/Python code chunks.

- R needed for `{r}` chunks
- Python + Jupyter needed for `{python}` chunks

## Create a Thesis Project 📚

### Option A: Start from GitHub template (recommended)

```bash
quarto use template mchlbckr/msb-thesis
cd msb-thesis
```

### Option B: If you already cloned this repository

```bash
cd msb-thesis
```

## Build Commands 🛠️

### Default Quarto build

```bash
quarto render
```

This uses the output directory configured in `_quarto.yml`:

- `_output/`

### Makefile shortcuts in this repository

```bash
make all   # builds HTML and PDF into separate folders
make html  # builds HTML to _output-html/
make pdf   # builds PDF to _output-pdf/
make clean # removes _output-html/ and _output-pdf/
```

## First Things to Edit ✍️

### `index.qmd`

Set your thesis metadata here:

- `title`
- `subtitle`
- `author`
- `date`
- `program`
- `supervisor`
- `second-supervisor` (optional)
- `abstract`
- `acknowledgements`

### `_quarto.yml`

Main project configuration:

- chapter order
- language (`lang: de` or `lang: en`)
- bibliography (`bib/references.bib`)
- citation style (`csl/apa-de.csl` or `csl/apa.csl`)
- title-page style and pattern
- logos and FH color metadata

## Typical Student Workflow 🔁

1. Open `index.qmd` and fill metadata.
2. Write chapter content in `chapters/*.qmd`.
3. Add sources to `bib/references.bib`.
4. Insert citations with `@citationKey`.
5. Build with `quarto render`.
6. Submit generated PDF.

## Writing Tips (Quarto Basics) 💡

### Citation 📖

```markdown
Single source: @smith2020
Multiple sources: [@smith2020; @miller2019]
```

### Cross-references 🔗

- Figure labels: `#fig-...`, reference with `@fig-...`
- Table labels: `#tbl-...`, reference with `@tbl-...`
- Equation labels: `#eq-...`, reference with `@eq-...`

### Figure formats 🖼️

Recommended:

- PDF for vector graphics
- PNG/JPG for screenshots/photos

Important: SVG is not directly supported in typical LaTeX PDF builds. Convert SVG to PDF first.

## Project Structure 🗂️

```text
msb-thesis/
├── _quarto.yml
├── index.qmd
├── chapters/
│   ├── 02-literature.qmd
│   ├── 03-methodology.qmd
│   ├── 04-results.qmd
│   ├── 05-discussion.qmd
│   └── 06-conclusion.qmd
├── references.qmd
├── bib/references.bib
├── csl/
├── figures/
├── _extensions/msb/thesis/
└── Makefile
```

## Troubleshooting (Common Errors) 🧯

### Error: `quarto: command not found`

Cause: Quarto is not installed or terminal was not restarted.

Fix:

1. Install Quarto.
2. Restart terminal.
3. Run `quarto --version` again.

### Error: `LaTeX Error: File 'xyz.sty' not found`

Cause: TinyTeX/LaTeX package missing.

Fix:

```bash
quarto install tinytex
```

If needed, install specific package with TinyTeX `tlmgr`.

### Error: R package missing

Cause: Your R chunk needs a package not installed locally.

Fix in R console:

```r
install.packages("packageName")
```

### Error: Python/Jupyter execution fails

Cause: Python/Jupyter not installed or not available to Quarto.

Fix:

1. Install Python.
2. Install Jupyter.
3. Restart terminal and rerun `quarto render`.

### Error: Image not found

Cause: Wrong relative path.

Fix:

- Use paths relative to project root
- Check filename and extension exactly
- Prefer PDF/PNG/JPG for PDF output

## Release Notes for v1.0.0 📦

- Promoted from release candidate to stable `1.0.0`
- README reorganized for beginner-first onboarding
- Build and configuration guidance aligned with repository layout
- Troubleshooting rewritten with explicit symptom-to-fix steps

## Extending the Template

This section is for developers who want to customise or extend the template beyond the options available in `_quarto.yml`.

### Adding new title-page patterns

1. Place the new PDF pattern file in `figures/pattern/pdf/` using the naming convention `Pattern_A4_CMYK_Blau_<NN>.pdf` (zero-padded, e.g. `13`).
2. Update `MAX_PATTERNS` at the top of `_extensions/msb/thesis/pattern-selector.lua` to match the new total count.
3. Set `title-pattern: <NN>` in `_quarto.yml` or `index.qmd` to use the new pattern.

### Modifying the Lua filter

`_extensions/msb/thesis/pattern-selector.lua` runs as a Pandoc filter during every render. It:

- Resolves `title-pattern: <N>` to a concrete file path (`title-pattern-file`).
- Converts the IETF `lang` code to the boolean `lang-english` flag used in the LaTeX template.
- Marks the references chapter header as unnumbered.

The filter has access to the full Pandoc Lua API. See the [Pandoc Lua filters documentation](https://pandoc.org/lua-filters.html) for reference.

### Adding language support

Currently supported languages: `de` (German) and `en` (English).

To add a new language:

1. Add the language code to the `SUPPORTED_LANGS` table in `pattern-selector.lua` (line 2).
2. Add a new `$if(lang-<code>)$` branch in `_extensions/msb/thesis/template.tex` inside the `$if(msb-thesis)$` block to define localised label commands (`\labelauthor`, `\labelprogram`, etc.).
3. Add the corresponding APA CSL file to `csl/` and update `csl:` in `_quarto.yml`.

### Modifying colours, fonts, and margins

All layout parameters are centralised in `_quarto.yml`:

| Setting | Key | Example |
|---------|-----|---------|
| Margins | `geometry` | `top=2.5cm` |
| Line spacing | `linestretch` | `1.5` |
| Font size | `fontsize` | `11pt` |
| Main font (PDF) | `mainfont` | `Liberation Sans` |
| FH brand colours | `fh-blue`, `fh-yellow`, … | `#0014a0` |

HTML colours are defined as CSS variables in `_extensions/msb/thesis/fh-colors.scss`.

### Architecture overview

```
_quarto.yml               ← project config (chapters, metadata, format options)
_extensions/msb/thesis/
  _extension.yml          ← extension metadata and format defaults
  pattern-selector.lua    ← Pandoc Lua filter (runs at render time)
  template.tex            ← Pandoc LaTeX template (PDF output)
  fh-colors.scss          ← SCSS variables for HTML output
  html-tweaks.html        ← JavaScript injected into HTML output
```

## Contributing 🤝

Contributions are welcome.

1. Create a feature branch.
2. Keep changes focused and documented.
3. Open a pull request with short test/build notes.

## License ⚖️

MIT

## Support 🆘

- Issues: https://github.com/mchlbckr/msb-thesis/issues
