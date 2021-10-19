\encoding{UTF-8}
\name{genCPHM}
\alias{genCPHM}
\title{Generation of survival data from a Cox Proportional Hazard Model}
\description{Generation of survival data from a Cox Proportional Hazard Model.}
\usage{genCPHM(n, model.cens, cens.par, beta, covar)}

\arguments{
\item{n}{Sample size.}
\item{model.cens}{Model for censorship. Possible values are "uniform" and "exponential".}
\item{cens.par}{Parameter for the censorship distribution. Must be greater than 0.}
\item{beta}{Regression parameter for the time-fixed covariate.}
\item{covar}{Parameter for generating the time-fixed covariate. An uniform distribution is used.}
}

%\details{
%}

\value{An object with two classes, \code{data.frame} and \code{CPHM}.}

\references{
Cox, D.R. (1972). Regression models and life tables. \emph{Journal of the Royal Statistical Society: Series B}, \bold{34}(2), 187-202. \doi{10.1111/j.2517-6161.1972.tb00899.x}

Meira-Machado L., Faria S. (2014). A simulation study comparing modeling approaches in an illness-death multi-state model. \emph{Communications in Statistics - Simulation and Computation}, \bold{43}(5), 929-946. \doi{10.1080/03610918.2012.718841}

Meira-Machado, L., Sestelo M. (2019). Estimation in the progressive illness-death model: a nonexhaustive
review. \emph{Biometrical Journal}, \bold{61}(2), 245–263. \doi{10.1002/bimj.201700200}
}

\author{Artur Araújo, Luís Meira Machado and Susana Faria}

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
cphmdata <- genCPHM(n=1000, model.cens="exponential", cens.par=2, beta= 2, covar=1)
head(cphmdata, n=20L)
library(survival)
fit<-coxph(Surv(time,status)~covariate,data=cphmdata)
summary(fit)
}

\keyword{datagen}
\keyword{survival}
