\encoding{UTF-8}
\name{genTDCM}
\alias{genTDCM}
\title{Generating data from a Cox model with time-dependent covariates}
\description{Generating data from a Cox model with time-dependent covariates.}
\usage{genTDCM(n, dist, corr, dist.par, model.cens, cens.par, beta, lambda)}

\arguments{
\item{n}{Sample size.}
\item{dist}{
	Bivariate distribution assumed for generating the two covariates (time-fixed and time-dependent).
	Possible bivariate distributions are "exponential" and "weibull" (see details below).
}
\item{corr}{
	Correlation parameter. Possible values for the bivariate exponential distribution
	are between -1 and 1 (0 for independency). Any value between 0 (not included)
	and 1 (1 for independency) is accepted for the bivariate weibull distribution.
}
\item{dist.par}{
	Vector of parameters for the allowed distributions. Two (scale) parameters for the
	bivariate exponential distribution and four (2 shape parameters and 2 scale
	parameters) for the bivariate weibull distribution: (shape1, scale1, shape2, scale2). See details below.
}
\item{model.cens}{Model for censorship. Possible values are "uniform" and "exponential".}
\item{cens.par}{Parameter for the censorship distribution. Must be greater than 0.}
\item{beta}{Vector of two regression parameters for the two covariates.}
\item{lambda}{Parameter for an exponential distribution. An exponential distribution is assumed for the baseline hazard function.}
}

\details{
The bivariate exponential distribution, also known as Farlie-Gumbel-Morgenstern distribution is given by
\deqn{F(x,y)=F_1(x)F_2(y)[1+\alpha(1-F_1(x))(1-F_2(y))]}{F(x,y)=F_1(x)F_2(y)[1+\alpha(1-F_1(x))(1-F_2(y))]}
for \eqn{x\ge0}{x\ge0} and \eqn{y\ge0}{y\ge0}. Where the marginal distribution functions \eqn{F_1}{F_1} and \eqn{F_2}{F_2} are exponential with scale parameters \eqn{\theta_1}{\theta_1} and \eqn{\theta_2}{\theta_2} and correlation parameter \eqn{\alpha}{\alpha}, \eqn{-1 \le \alpha \le 1}{-1 \le \alpha \le 1}. \cr

The bivariate Weibull distribution with two-parameter marginal distributions. It's survival function is given by
\deqn{S(x,y)=P(X>x,Y>y)=e^{-[(\frac{x}{\theta_1})^\frac{\beta_1}{\delta}+(\frac{y}{\theta_2})^\frac{\beta_2}{\delta}]^\delta}}{S(x,y)=P(X>x,Y>y)=exp^(-[(x/\theta_1)^(\beta_1/\delta)+(y/\theta_2)^(\beta_2/\delta)]^\delta)}

Where \eqn{0 < \delta \le 1}{0 < \delta \le 1} and each marginal distribution has shape parameter \eqn{\beta_i}{\beta_i} and a scale parameter \eqn{\theta_i}{\theta_i}, \eqn{i = 1, 2}.
}

\value{
	An object with two classes, \code{data.frame} and \code{TDCM}.
	To accommodate time-dependent effects, we used a counting process data-structure, introduced by Andersen and Gill (1982).
	In this data-structure, apart the time-fixed covariates (named \code{covariate}), an individual's survival data is expressed by three variables:
	\code{start}, \code{stop} and \code{event}. Individuals without change in the time-dependent covariate (named \code{tdcov}) are represented by only one line of data,
	whereas patients with a change in the time-dependent covariate must be represented by two lines.
	For these patients, the first line represents the time period until the change in the time-dependent covariate;
	the second line represents the time period that passes from that change to the end of the follow-up.
	For each line of data, variables \code{start} and \code{stop} mark the time interval (start, stop) for the data,
	while event is an indicator variable taking on value 1 if there was a death at time stop, and 0 otherwise.
	More details about this data-structure can be found in papers by (Meira-Machado et al., 2009).
}

\references{
	Anderson, P. K., Gill, R. D. (1982) Cox's regression model for counting processes: a large sample study. Annals of Statistics, 10:1100-1120.

	Cox, D. R. (1972). Regression models and life tables (with discussion). Journal of the Royal Statistical Society, Series B 34:187-220.

	Johnson, M. E. (1987). Multivariate Statistical Simulation, John Wiley and Sons.

	Johnson, N., Kotz, S. (1972). Distribution in statistics: continuous multivariate distributions, John Wiley and Sons.

	Lu J., Bhattacharya, G. (1990). Some new constructions of bivariate weibull models, Annals of Institute of Statistical Mathematics, 42:543-559.

	Meira-Machado, L., Cadarso-Suárez, C., de Uña-Álvarez, J., Andersen, P.K. (2009). Multi-state models for the analysis of time to event data. Statistical Methods in Medical Research, 18(2):195-222.

	Therneau, T.M., Grambsch, P.M. (2000). Modelling survival data: Extending the Cox Model. New York: Springer.
}

\author{Artur Araújo, Luís Meira Machado and Susana Faria}

%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{genCMM}},
\code{\link{genCPHM}},
\code{\link{genTHMM}}.
}

\examples{
tdcmdata <- genTDCM(n=1000, dist="weibull", corr=0.8, dist.par=c(2,3,2,3),
model.cens="uniform", cens.par=2.5, beta=c(-3.3,4), lambda=1)
head(tdcmdata, n=20L)
library(survival)
fit1<-coxph(Surv(start,stop,event)~tdcov+covariate,data=tdcmdata)
summary(fit1)

tdcmdata2 <- genTDCM(n=1000, dist="exponential", corr=0, dist.par=c(1,1),
model.cens="uniform", cens.par=1, beta=c(-3,2), lambda=0.5)
head(tdcmdata2, n=20L)
fit2<-coxph(Surv(start,stop,event)~tdcov+covariate,data=tdcmdata2)
summary(fit2)
}

\keyword{datagen}
\keyword{survival}
