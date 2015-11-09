\encoding{UTF-8}
\name{genTHMM}
\alias{genTHMM}
\title{Generation of survival data from a time-homogeneous Markov model}
\description{Generation of survival data from a time-homogeneous Markov model.}
\usage{genTHMM(n, model.cens, cens.par, beta, covar, rate)}

\arguments{
\item{n}{Sample size.}
\item{model.cens}{Model for censorship. Possible values are "uniform" and "exponential".}
\item{cens.par}{Parameter for the censorship distribution. Must be greater than 0.}
\item{beta}{Vector of three regression parameters for the three transitions: (beta_12,beta_13,beta_23).}
\item{covar}{Parameter for generating the time-fixed covariate. An uniform distribution is used.}
\item{rate}{Vector of dimension three. We assume an exponential baseline hazard function with constant hazard rate for each transition.}
}

%\details{
%}

\value{
	An object with two classes, \code{data.frame} and \code{THMM}.
	For generating survival data from the THMM model, the counting process data structure must contain the following variables:
	\code{id}, \code{time}, \code{state}, \code{covariate}. Each patient is identified by id.
	The variable \code{time} represents time for each interval of follow-up while variable \code{state} denotes the state of the individual.
	Variable \code{covariate} is the (time-fixed) covariate to be studied in the regression model.
	Individuals without change in the time dependent covariate are represented by two lines of data,
	whereas patients with a change in the time-dependent covariate must be represented by three lines.
}

\references{
	Jackson, C. (2007). Multi-state modelling with R: the msm package, Cambridge, U.K.

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
\code{\link{genTDCM}},
\code{\link{genCPHM}}.
}

\examples{
thmmdata <- genTHMM( n=100, model.cens="uniform", cens.par=80, beta= c(0.09,0.08,-0.09),
covar=80, rate= c(0.05,0.04,0.05) )
head(thmmdata, n=20L)
}

\keyword{datagen}
\keyword{survival}
