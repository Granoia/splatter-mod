This is a modified version of the [Splatter software package](https://github.com/Oshlack/splatter) constructed as a class project for CMSC 701: Computational Genomics.

Since this project is an extension of an existing package, it contains a lot of code that I did not write. All of the important modifications can be found in R/splat-simulate.R (there are also some modifications to files that R uses to build packages, but those are not really worth looking at). Within that script, the modifications I made are localized to the following functions: `splatSimulateMod()`, `grnIsValid()`, `splatSimCrisprGroupDE()`, `splatSimCrisprGroupCellMeans()`, and `getCrisprLNormFactors()`

Package management is kind of a pain in R, and the Splatter package has a lot of dependencies. For this reason, we recommend using conda. If you have conda installed on your machine you can follow these steps to get the package up and running:

1. Install Splatter's dependencies using the environment.yml file included in this repository, and then activate the environment. (Creating the environment is only necessary for first time setup, activating the environment is necessay each time you want to use the package)

```
conda env create -f environment.yml
conda activate splatter-mod-env
```

2. Open R (simply type `R` into the command prompt) and enter the following lines which install packages necessary to build an R package from source (thanks to Hilary Parker for writing a [clear tutorial](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/) on this topic) 

```R
install.packages("devtools")
library("devtools")
devtools::install_github("klutometis/roxygen")
library(roxygen2) 
```
 
NOTE: the third line in the previous block worked on my work machine but not my personal laptop for reasons that I cannot explain. Your mileage may vary. If you encounter an error with that line, try this instead: `install.packages("roxygen2")`

3. (Still in R) set your working directory to be the parent directory of this repository on your computer, and then create the package. After going through this installation a couple of times, I am not sure whether this step is required, so if you get a warning saying that the package already exists, just proceed to the next line. The next step is to call the document() function, and then to install our local version of Splatter. R may then ask you to update some dependencies. I have always said yes when it asked me to do this - I haven't tested whether it still works if you don't update, but it might. After installing, load Splatter's functions into the namespace.

```R
setwd("<YOUR_PARENT_DIRECTORY_HERE>")
create("splatter")
setwd("./splatter/")
document()
setwd("..")
install("splatter")
library("splatter")
```

4. Now (finally) the modifications we applied to Splatter should be available on your machine. To generate figures similar to those featured in the writeup (generation is stochastic, so they won't be exactly the same), you can enter the following commands:

```R
#generates a figure similar to Fig 2 (left panel) of writeup
sim <- splatSimulateMod(group.prob = c(0.34, 0.33, 0.33), batchCells=500, method="crispr", grn.deg.ls = c(1000,1200))
sim <- normalize(sim)
plotPCA(sim, colour_by="Group")

#generates a figure similar to Fig 2 (right panel) of writeup
sim <- splatSimulateMod(group.prob = c(0.34, 0.33, 0.33), batchCells=500, method="crispr", grn.deg.ls = c(100,200))
sim <- normalize(sim)
plotPCA(sim, colour_by="Group")

#generates a figure similar to Fig S1 of writeup
sim <- splatSimulateMod(group.prob = c(0.5, 0.5), batchCells=c(400,400), method="crispr", grn.deg.ls = c(1000))
sim <- normalize(sim)
plotPCA(sim, colour_by="Group", shape_by="Batch")
```

If you are interested in testing parametrizations of the simulation other than those that can be pattern matched from the previous block of code, you may have to create and edit a splatParams object. I'll include an example but for full details see [this well-written tutorial](https://bioconductor.org/packages/devel/bioc/vignettes/splatter/inst/doc/splatter.html) by Luke Zappia (one of the authors of the Splatter paper).

```
#for example, this sets the number of simulated genes to 10000
params <- newSplatParams()
params <- setParams(params, nGenes=10000)
sim <- splatSimulateMod(params, group.prob = c(0.5, 0.5), method="crispr", grn.deg.ls = c(1000))
...
```
