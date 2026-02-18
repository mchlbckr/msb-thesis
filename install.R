packages <- c(
  "tibble",
  "ggplot2",
  "broom",
  "knitr",
  "rmarkdown",  # required by Quarto's knitr engine
  "reticulate"  # required for Python chunks in knitr documents
)

install.packages(packages)
