# genSurv
Generating Multi-State Survival Data.

## Description
The **genSurv** software permits to generate data with one binary time-dependent covariate and data stemming from a progressive illness-death model.

## Installation
If you want to use the release version of the **genSurv** package, you can install the package from CRAN as follows:
```r
install.packages(pkgs="genSurv");
```
If you want to use the development version of the **genSurv** package, you can install the package from GitHub via the [**remotes** package](https://remotes.r-lib.org):
```r
remotes::install_github(
  repo="arturstat/genSurv",
  build=TRUE,
  build_manual=TRUE
);
```

## Authors
Artur Araújo, Luís Meira-Machado <lmachado@math.uminho.pt> \
and Susana Faria <sfaria@math.uminho.pt> \
Maintainer: Artur Araújo <artur.stat@gmail.com>

## Funding
This research was financed by **FEDER** Funds through *Programa Operacional Factores de Competitividade* -- **COMPETE** and by Portuguese Funds through **FCT** -- *Fundação para a Ciência e a Tecnologia*, in the form of grants PTDC/MAT/104879/2008 and Est-C/MAT/UI0013/2011.

## References
Anderson, P.K., Gill, R.D. (1982). Cox's regression model for counting processes: a large sample study. *Annals of Statistics*, **10**(4), 1100-1120. [doi:10.1214/aos/1176345976](https://doi.org/10.1214/aos/1176345976)

Cox, D.R. (1972). Regression models and life tables. *Journal of the Royal Statistical Society: Series B*, **34**(2), 187-202. [doi:10.1111/j.2517-6161.1972.tb00899.x](https://doi.org/10.1111/j.2517-6161.1972.tb00899.x)

Jackson, C. (2011). Multi-State Models for Panel Data: The msm Package for R. *Journal of Statistical Software*, **38**(8), 1–28. [doi:10.18637/jss.v038.i08](https://doi.org/10.18637/jss.v038.i08)

Johnson, M. E. (1987). *Multivariate Statistical Simulation*, John Wiley and Sons.

Johnson, N., Kotz, S. (1972). *Distribution in statistics: continuous multivariate distributions*, John Wiley and Sons.

Lu J., Bhattacharya G. (1990). Some new constructions of bivariate weibull models. *Annals of Institute of Statistical Mathematics*, **42**(3), 543-559. [doi:10.1007/BF00049307](https://doi.org/10.1007/BF00049307)

Meira-Machado, L., Cadarso-Suárez, C., De Uña- Álvarez, J., Andersen, P.K. (2009). Multi-state models for the analysis of time to event data. *Statistical Methods in Medical Research*, **18**(2), 195-222. [doi:10.1177/0962280208092301](https://doi.org/10.1177/0962280208092301)

Meira-Machado L., Faria S. (2014). A simulation study comparing modeling approaches in an illness-death multi-state model. *Communications in Statistics - Simulation and Computation*, **43**(5), 929-946. [doi:10.1080/03610918.2012.718841](https://doi.org/10.1080/03610918.2012.718841)

Meira-Machado, L., Roca-Pardiñas, J. (2011). p3state.msm: Analyzing Survival Data from an Illness-Death Model. *Journal of Statistical Software*, **38**(3), 1-18. [doi:10.18637/jss.v038.i03](https://doi.org/10.18637/jss.v038.i03)

Meira-Machado, L., Sestelo M. (2019). Estimation in the progressive illness-death model: a nonexhaustive
review. *Biometrical Journal*, **61**(2), 245–263. [doi:10.1002/bimj.201700200](https://doi.org/10.1002/bimj.201700200)

Therneau, T.M., Grambsch, P.M. (2000). *Modelling survival data: Extending the Cox Model*, New York: Springer.
