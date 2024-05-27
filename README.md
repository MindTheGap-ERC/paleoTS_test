# paleoTS_test

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.11350840.svg)](https://doi.org/10.5281/zenodo.11350840)

Examine paleoTS model selection performance with time series length

## Introduction

Hohmann et al 2023 ([DOI: 10.1101/2023.12.18.572098](https://doi.org/10.1101/2023.12.18.572098)), supplementary code ([DOI: 10.5281/zenodo.10390267](https://doi.org/10.5281/zenodo.10390267)) found unexpected behavior in the model selection performance of the paleoTS package, version 0.5.3 ([CRAN.R-project.org/package=paleoTS](https://CRAN.R-project.org/package=paleoTS)) when including Ornstein-Uhlenbeck processes in the set of modes of evolution tested for. Here, this behavior is examined using the simulation tools implemented in the paleoTS package.

The code simulates stasis and undirected random walks, and examines how AICc weights for different modes of evolution (stasis, (un)directed random walk) change with time series length.

## Authors

__Niklas Hohmann__ (maintainer)  
Utrecht University  
email: n.h.hohmann [at] uu.nl  
Web page: [www.uu.nl/staff/NHohmann](https://www.uu.nl/staff/NHHohmann)  
ORCID: [0000-0003-1559-1838](https://orcid.org/0000-0003-1559-1838)

__Melanie Hopkins__  
American Museum of Natural History  
Web page: [www.amnh.org/research/staff-directory/melanie-j-hopkins](https://www.amnh.org/research/staff-directory/melanie-j-hopkins)  
ORCID: [0000-0002-3580-2172](https://orcid.org/0000-0002-3580-2172)

Melanie Hopkins provided the original code, which was modified by Niklas Hohmann. For detailed author contributions please inspect the git history.

## Requirements

R (version >= 4) and the RStudio IDE

## Usage

In RStudio, open the file _paleoTS_test.Rproj_. This will open the RProject of the same name, and install the `renv`package (if not already installed). Then, execute

```R
renv::restore()
```

in RStudios console to install all required dependencies, including `paleoTS` version __0.5.3__. Now the environment is set up, and you can run the analysis using

```R
source("code/test.paleots.R")
```

Results of the analysis are already stored in the repository under _figs/_. You can inspect the code in the file _code/test.paleots.R_.

## License

 Apache 2.0, see LICENSE file for full license text.

## Repository structure

* code : folder for code
  * test.paleots.R : R script examining paleoTS model selection with time series length
* figs : folder for figures
  * test_stasis_with_ou.jpeg : AICc weights under stasis model with increasing time series length, including OU in the tested modes
  * test_stasis_without_ou.jpeg : AICc weights under stasis model with increasing time series length, not including OU in the tested modes
  * test_urw_with_ou.jpeg : AICc weights under undirected random walk (URW) model with increasing time series length, including OU in the tested modes
  * test_urw_without_ou.jpeg : AICc weights under undirected random walk (URW) model with increasing time series length, not including OU in the tested modes
* renv : folder for `renv` package
* .Rprofile : R session info
* .gitignore : untracked files
* LICENSE : Apache 2.0 license text
* README.md : readme file
* paleoTS_test.Rproj : RProject file
* renv.lock : lock file for `renv` package

## Citation

Hohmann, N., & Hopkins, M. (2024). paleoTS_test: Examine paleoTS model selection performance with time series length (v1.1.0). Zenodo. https://doi.org/10.5281/zenodo.11350840

## Funding information

Funded by the European Union (ERC, MindTheGap, StG project no 101041077). Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or the European Research Council. Neither the European Union nor the granting authority can be held responsible for them.
![European Union and European Research Council logos](https://erc.europa.eu/sites/default/files/2023-06/LOGO_ERC-FLAG_FP.png)
