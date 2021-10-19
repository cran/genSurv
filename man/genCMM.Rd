\encoding{UTF-8}
\name{genCMM}
\alias{genCMM}
\title{Generation of Cox Markov data from an illness-death model}
\description{Generation of Cox Markov data from an illness-death model.}
\usage{genCMM(n, model.cens, cens.par, beta, covar, rate)}

\arguments{
\item{n}{Sample size.}
\item{model.cens}{Model for censorship. Possible values are "uniform" and "exponential".}
\item{cens.par}{Parameter for the censorship distribution. Must be greater than 0.}
\item{beta}{Vector of three regression parameters for the three transitions: (beta_12,beta_13,beta_23).}
\item{covar}{Parameter for generating the time-fixed covariate. An uniform distribution is used.}
\item{rate}{
	Vector of dimension six: (shape1, scale1, shape2, scale2, shape3, scale3).
	A Weibull baseline hazard function is assumed (with two parameters) for each transition (see details below).}
}

\details{
The Weibull distribution with shape parameter \eqn{\lambda} and scale parameter \eqn{\theta} has hazard function given by:

\deqn{\alpha(t)=\lambda\theta t^{\theta-1}}
}

\value{
An object with two classes, \code{data.frame} and \code{CMM}.
The data structure used for generating survival data from the Cox Markov Model (CMM) is similar as for the time-dependent Cox model (TDCM).
In this case the data structure has one more variable representing the transition (variable \code{trans}).
\code{trans=1} denotes the transition from State 1 to State 3 (without observing the intermediate event; State 2);
\code{trans=2} denotes the transition from State 1 to State 2; and \code{trans=3} denotes the transition from State 2 to State 3 (absorbing).
}

\references{
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
\code{\link{genCPHM}},
\code{\link{genTDCM}},
\code{\link{genTHMM}}.
}

\examples{
cmmdata <- genCMM( n=1000, model.cens="uniform", cens.par=2.5, beta=c(2,1,-1),
covar=10, rate=c(1,5,1,5,1,5) )
head(cmmdata, n=20L)
library(survival)
fit_13<-coxph(Surv(start,stop,event)~covariate, data=cmmdata, subset=c(trans==1))
fit_13
fit_12<-coxph(Surv(start,stop,event)~covariate, data=cmmdata, subset=c(trans==2))
fit_12
fit_23<-coxph(Surv(start,stop,event)~covariate, data=cmmdata, subset=c(trans==3))
fit_23
}

\keyword{datagen}
\keyword{survival}
