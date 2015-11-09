\encoding{UTF-8}
\name{as.CMM}
\alias{as.CMM}
\alias{is.CMM}
\title{Coerce to an object of class \code{CMM}}
\description{Function to coerce objects of class \code{TDCM} and \code{THMM} to objects of class \code{CMM}.}
\usage{as.CMM(x)
is.CMM(x)}

\arguments{
\item{x}{Any R object.}
}

%\details{
%}

\value{An object with two classes one being \code{data.frame} and the other \code{CMM}.}

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
\code{\link{as.TDCM}},
\code{\link{as.THMM}},
\code{\link{genCMM}},
\code{\link{genTDCM}},
\code{\link{genTHMM}}.
}

\examples{
# generate TDCM data
tdcmdata <- genTDCM(n=100, dist="exponential", corr=0, dist.par=c(1,1),
model.cens="uniform", cens.par=1, beta=c(-3,2), lambda=10)

# coerce TDCM data to CMM data
cmmdata0 <- as.CMM(tdcmdata)
head(cmmdata0, n=20L)

# generate THMM data
thmmdata <- genTHMM( n=100, model.cens="uniform", cens.par=80, beta= c(0.09,0.08,-0.09),
covar=80, rate= c(0.05,0.04,0.05) )

# coerce THMM data to CMM data
cmmdata1 <- as.CMM(thmmdata)
head(cmmdata1, n=20L)
}

\keyword{manip}
\keyword{methods}
\keyword{survival}
