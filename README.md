# paleoTS_test

Examine paleoTS model selection performance with time series length

## Authors

__Niklas Hohmann__  
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

in RStudios console to install all required dependencies, including `paleoTS` version 0.5.3. Now the environment is set up, and you can run the analysis using

```R
source("code/test.paleots.R")
```

(results are already stored under _figs/_), or inspect the code in _code/test.paleots.R_.

## License

 Apache 2.0, see LICENSE file for full license text.
