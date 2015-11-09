\encoding{UTF-8}
\name{as.THMM}
\alias{as.THMM}
\alias{is.THMM}
\title{Coerce to an object of class \code{THMM}}
\description{Function to coerce objects of class \code{CMM} and \code{TDCM} to objects of class \code{THMM}.}
\usage{as.THMM(x)
is.THMM(x)}

\arguments{
\item{x}{Any R object.}
}

%\details{
%}

\value{An object with two classes one being \code{data.frame} and the other \code{THMM}.}

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
\code{\link{as.TDCM}},
\code{\link{genCMM}},
\code{\link{genTDCM}},
\code{\link{genTHMM}}.
}

\examples{
# generate CMM data
cmmdata <- genCMM( n=1000, model.cens="uniform", cens.par=2.5, beta=c(2,1,-1),
covar=10, rate=c(1,5,1,5,1,5) )

# coerce CMM data to THMM data
thmmdata0 <- as.THMM(cmmdata)
head(thmmdata0, n=20L)

# generate TDCM data
tdcmdata <- genTDCM(n=100, dist="exponential", corr=0, dist.par=c(1,1),
model.cens="uniform", cens.par=1, beta=c(-3,2), lambda=10)

# coerce TDCM data to THMM data
thmmdata1 <- as.THMM(tdcmdata)
head(thmmdata1, n=20L)
}

\keyword{manip}
\keyword{methods}
\keyword{survival}
