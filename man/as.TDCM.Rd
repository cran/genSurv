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
Cox, D.R. (1972). Regression models and life tables. \emph{Journal of the Royal Statistical Society: Series B}, \bold{34}(2), 187-202. \doi{10.1111/j.2517-6161.1972.tb00899.x}

Jackson, C. (2011). Multi-State Models for Panel Data: The msm Package for R. \emph{Journal of Statistical Software}, \bold{38}(8), 1–28. \doi{10.18637/jss.v038.i08}

Meira-Machado, L., Cadarso-Suárez, C., De Uña- Álvarez, J., Andersen, P.K. (2009). Multi-state models for the analysis of time to event data. \emph{Statistical Methods in Medical Research}, \bold{18}(2), 195-222. \doi{10.1177/0962280208092301}

Meira-Machado L., Faria S. (2014). A simulation study comparing modeling approaches in an illness-death multi-state model. \emph{Communications in Statistics - Simulation and Computation}, \bold{43}(5), 929-946. \doi{10.1080/03610918.2012.718841}

Meira-Machado, L., Roca-Pardiñas, J. (2011). p3state.msm: Analyzing Survival Data from an Illness-Death Model. \emph{Journal of Statistical Software}, \bold{38}(3), 1-18. \doi{10.18637/jss.v038.i03}

Meira-Machado, L., Sestelo M. (2019). Estimation in the progressive illness-death model: a nonexhaustive
review. \emph{Biometrical Journal}, \bold{61}(2), 245–263. \doi{10.1002/bimj.201700200}

Therneau, T.M., Grambsch, P.M. (2000). \emph{Modelling survival data: Extending the Cox Model}, New York: Springer.
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
