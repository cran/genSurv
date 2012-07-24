\encoding{UTF-8}
\name{convert}
\alias{convert}
\title{Converting data between different formats}
\description{Converting data between different formats}
\usage{convert(data, to)}

\arguments{
\item{data}{An object with one of the following classes: \code{CMM}; \code{TDCM}; \code{THMM}.}
\item{to}{A character string specifying the destination class. Possible options are "CMM", "TDCM" or "THMM".}
}

%\details{
%}

\value{An object with two classes one being \code{data.frame} and the other equal to the character string specifyed by argument \code{to}.}

\references{
	Cox, D.R. (1972). Regression models and life tables (with discussion). Journal of the Royal Statistical Society, Series B 34:187-220.

	Jackson, C. (2007). Multi-state modelling with R: the msm package, Cambridge, U.K.

	Meira-Machado, L., Cadarso-Suárez, C., De Uña- Álvarez, J., Andersen, P.K. (2009). Multi-state models for the analysis of time to event data. Statistical Methods in Medical Research 18(2):195-222.

	Meira-Machado, L., Roca-Pardiñas, J. (2011). p3state.msm: Analyzing Survival Data from an Illness-Death Model. Journal of Statistical Software, 38(3): 1-18.

	Therneau, T.M., Grambsch, P.M. (2000). Modelling survival data: Extending the Cox Model. New York: Springer.
}

\author{Artur Agostinho Araújo, Luís Meira Machado and Susana Faria}

%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{genCMM}},
\code{\link{genTDCM}},
\code{\link{genTHMM}}.
}

\examples{
tdcmdata <- genTDCM(n=100, dist="exponential", corr=0, dist.par=c(1,1),
model.cens="uniform", cens.par=1, beta=c(-3,2), lambda=10)
thmmdata <- convert(tdcmdata, to="THMM")
head(thmmdata, n=20L)
}
