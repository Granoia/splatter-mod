\name{NEWS}
\title{News for Package \pkg{splatter}}

\section{Version 1.8.0, Bioconductor 3.9 Release (2018-04-18)}{
  \itemize{
    \item{Add a Splat parameters vignette}
    \item{Rename the Splat path.length parameter to path.nSteps}
    \item{Fix a bug with parameter order in setParams}
    \item{Fix a bug where Splat groups were being simulated in alphanumeric
          order}
    \item{Protect against integer overflow in simulation functions}
  }
}

\section{Version 1.6.0, Bioconductor 3.8 Release (2018-10-29)}{
  \itemize{
    \item{Fix bug and improve normality testing in splatEstLib}
    \item{Fixes for compatibility with the latest version of BASiCS,
          BASiCSEstimate now uses the regression method}
    \item{Fix bug in getLNormFactors when reversing factors less than one}
    \item{Various updates to tests and documentation}
  }
}

\section{Version 1.3.5, Bioconductor 3.7 Release (2018-04-25)}{
  \itemize{
    \item{Move scater to Imports and add scater version}
    \item{Remove lingering references to SCESets}
    \item{Add option to use a normal distribution for library sizes in Splat
    simulations}
    \item{Allow Splat dropout parameters to be specified by experiment, batch,
    group or cell}
    \item{Add SparseDC simulation}
    \item{Rename params in metadata slot of simulation to Params for
    consistency}
    \item{Improve and colourise Params print output}
    \item{Improve test coverage}
    \item{Various other minor updates and bug fixes}
  }
}

\section{Version 1.1.8, Bioconductor 3.6 Release (2017-10-13)}{
  \itemize{
    \item{Now published in Genome Biology!}
    \item{Converted to the SingleCellExperiment object}
    \item{Added new simulations: BASiCS, mfa, PhenoPath, ZINB-WaVE}
    \item{Added batch effects to the Splat simulation. This required a change
          to the SplatParams object.}
    \item{Improved scDD estimation}
    \item{Added and improved comparison functions}
    \item{Improved default Splat parameters and estimation}
    \item{Improvements to the Lun2Params object}
    \item{Added addGeneLength function}
    \item{Updated simulation references}
    \item{Various other minor updates and bug fixes}
  }
}

\section{Version 0.99.16, Bioconductor 3.5 Release (2017-04-23)}{
  \itemize{
    \item{Splatter is a package for the simple simulation of single-cell
    RNA-seq data, including:}
    \item{Multiple simulation models}
    \item{Parameter estimation from real data}
    \item{Functions for comparing simulations and real datasets}
    \item{Simulation of complex groups and differentiation paths}
  }
}

\section{Version 0.99.0 (2016-12-05)}{
  \itemize{
    \item Package prepared for Bioconductor submission.
  }
}
