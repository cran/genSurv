\name{NEWS}

\title{NEWS file for the genSurv package}

\section{Changes in version 1.0.3}{
  \itemize{
    \item{Corrected NAMESPACE file.}
  }
}

\section{Changes in version 1.0.2}{
  \itemize{
    \item{Improved the documentation.}

    \item{Added research article to the CITATION file.}
  }
}

\section{Changes in version 1.0.1}{
	\itemize{
		\item{Changed parameterization of the bivariate and univariate exponential models of
		distribution available for the genTDCM function. Now the mean of the univariate exponential
		model of distribution is equal to it's parameter. This change also affects the cens.par
		parameter available in the genCMM, genCPHM, genTDCM and genTHMM functions.}

		\item{Replaced convert function by three functions: as.CMM, as.TDCM and as.THMM.
		This reflects R's function naming convention for the conversion of S3 objects.}

		\item{Changed the row names of all data.frames to integer vectors that start at 1.
		In the previous version the row names of some data.frames started at 2.}

		\item{Added CITATION file.}

		\item{Added missing zzz.R file.}
	}
}

\section{Changes in version 1.0}{
	\itemize{
		\item{First release.}
	}
}
