\encoding{UTF-8}
\name{as.TDCM}
\alias{as.TDCM}
\alias{is.TDCM}
\title{Coerce to an object of class \code{TDCM}}
\description{Function to coerce objects of class \code{CMM} and \code{THMM} to objects of class \code{TDCM}.}
\usage{as.TDCM(x)
is.TDCM(x)}

\arguments{
\item{x}{Any R object.}
}

%\details{
%}

\value{An object with two classes one being \code{data.frame} and the other \code{TDCM}.}

\references{
	Cox, D.R. (1972). Regression models and life tables (with discussion). Journal of the Royal Statistical Society, Series B 34:187-220.

	Jackson, C. (2007). Multi-state modelling with R: the msm package, Cambridge, U.K.

	Meira-Machado, L., Cadarso-Suárez, C., De Uña- Álvarez, J., Andersen, P.K. (2009). Multi-state models for the analysis of time to event data. Statistical Methods in Medical Research 18(2):195-222.

	Meira-Machado, L., Roca-Pardiñas, J. (2011). p3state.msm: Analyzing Survival Data from an Illness-Death Model. Journal of Statistical Software, 38(3): 1-18.

	Therneau, T.M., Grambsch, P.M. (2000). Modelling survival data: Extending the Cox Model. New York: Springer.
}

\author{Artur Araújo, Luís Meira Machado and Susana Faria}

%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{as.CMM}},
\code{\link{as.THMM}},
\code{\link{genCMM}},
\code{\link{genTDCM}},
\code{\link{genTHMM}}.
}

\examples{
# generate CMM data
cmmdata <- genCMM( n=1000, model.cens="uniform", cens.par=2.5, beta=c(2,1,-1),
covar=10, rate=c(1,5,1,5,1,5) )

# coerce CMM data to TDCM data
tdcmdata0 <- as.TDCM(cmmdata)
head(tdcmdata0, n=20L)

# generate THMM data
thmmdata <- genTHMM( n=100, model.cens="uniform", cens.par=80, beta= c(0.09,0.08,-0.09),
covar=80, rate= c(0.05,0.04,0.05) )

# coerce THMM data to TDCM data
tdcmdata1 <- as.TDCM(thmmdata)
head(tdcmdata1, n=20L)
}

\keyword{manip}
\keyword{methods}
\keyword{survival}
