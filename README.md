# Reproducible-Science-and-Figures
## Description
This project analyses culmen length variations among Adélie, Chinstrap, and Gentoo penguins from the Palmer Penguins dataset. It applies data cleaning, statistical testing, and visualisation techniques to investigate ecological specialisations across species. 
## Repository Contents
- **data/**: Contains both raw and cleaned datasets.
- **figures/**: Stores generated visualisations such as boxplots and violin plots.
- **functions/**: Contains R scripts for data cleaning and creating custom visualisations.
- **Reproducible Science & Figures Assignment.Rmd**: Main RMarkdown file containing the analysis and report.
- **references.bib**: Manages references and citations used in the analysis.
- **renv.lock**: Dependency lock file to ensure reproducibility.
## Running the Analysis
Clone this repository:
   ```bash
   git clone https://github.com/anonymous240/Reproducible-Science-and-Figures.git
```
To generate the report:
1. Open `Reproducible Science & Figures Assignment.Rmd` in RStudio.
2. Install required dependencies using `renv::restore()` if not already installed.
3. Knit the RMarkdown file to produce the final HTML report.

## Dependencies
Ensure these R packages are installed to reproduce the analysis and visualisations:
```markdown
- `ggplot2`
- `dplyr`
- `car`
- `knitr`
- `bookdown`
- `broom`
- `palmerpenguins`
```
## Acknowledgements
- **Data**: Palmer Penguins dataset by [Horst et al.](https://allisonhorst.github.io/palmerpenguins/).
- **References**: Gorman et al. (2014) for contextual insights into penguin morphology and ecological specialisations.
- **Tools**: RStudio and open-source R packages.
