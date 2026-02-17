# msb-thesis

Quarto template for theses at Münster School of Business (MSB), FH Münster.

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

## Contributing 🤝

Contributions are welcome.

1. Create a feature branch.
2. Keep changes focused and documented.
3. Open a pull request with short test/build notes.

## License ⚖️

MIT

## Support 🆘

- Issues: https://github.com/mchlbckr/msb-thesis/issues

