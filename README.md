This is a modified version of the [Splatter software package](https://github.com/Oshlack/splatter) constructed as a class project for CMSC 701: Computational Genomics.

Since this project is an extension of an existing package, it contains a lot of code that I did not write. All of the important modifications can be found in R/splat-simulate.R (there are also some modifications to files that R uses to build packages, but those are not really worth looking at). Within that script, the modifications I made are localized to the following functions: `splatSimulateMod()`, `grnIsValid()`, `splatSimCrisprGroupDE()`, `splatSimCrisprGroupCellMeans()`, and `getCrisprLNormFactors()`

Package management is kind of a pain in R, and the Splatter package has a lot of dependencies. For this reason, we recommend using conda. If you have conda installed on your machine you can follow these steps to get the package up and running:

1. Install Splatter's dependencies using the environment.yml file included in this repository, and then activate the environment. (Creating the environment is only necessary for first time setup, activating the environment is necessay each time you want to use the package)

    conda env create -f environment.yml
    conda activate splatter-mod-env

2. Open R (simply type `R` into the command prompt) and enter the following lines which install packages necessary to build an R package from source (thanks to Hilary Parker for writing a [clear tutorial](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/) on this topic) 

    install.packages("devtools")
    library("devtools")
    devtools::install_github("klutometis/roxygen")
    library(roxygen2)
 
NOTE: the third step on this list worked on my work machine but not my personal laptop for reasons that I cannot explain. Your mileage may vary. If you encounter an error with that step, try this instead: `install.packages("roxygen2")`

3. (Still in R) set your working directory to be the parent directory of this repository on your computer, and then install the package.

    setwd("<YOUR_PARENT_DIRECTORY_HERE>")
    install("splatter")
