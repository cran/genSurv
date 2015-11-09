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
Cox, D.R. (1972). Regression models and life tables (with discussion). Journal of the Royal Statistical Society, Series B 34:187-220.
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
