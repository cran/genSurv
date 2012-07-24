
#include <R_ext/Random.h>
#include <Rdefines.h>
#include <Rmath.h>
#include "defines.h"

typedef void (*Tfunc)(CdoubleCP, CdoubleCP, doubleCP, doubleCP);

static void expt(
	CdoubleCP pcorr,
	CdoubleCP pdistpar,
	doubleCP t1,
	doubleCP t2)
{
	double v1, v2, u1, u2, a, b;
	v1 = runif(0, 1);
	v2 = runif(0, 1);
	u1 = v1;
	a = *pcorr*(2*v1-1)-1;
	b = R_pow_di(1-*pcorr*(2*v1-1), 2)+*pcorr*4*v2*(2*v1-1);
	u2 = 2*v2/(sqrt(b)-a);
	*t1 = -(1/pdistpar[0])*log(1-u1);
	*t2 = -(1/pdistpar[1])*log(1-u2);
	return;
} // expt

static void weibullt(
	CdoubleCP pcorr,
	CdoubleCP pdistpar,
	doubleCP t1,
	doubleCP t2)
{
	register int i;
	double u, u2[4], v;
	u = runif(0, 1);
	for (i = 0; i < 4; i++) u2[i] = runif(0, 1);
	if (u2[3] > *pcorr) v = -log(u2[2]);
	else v = -log(u2[0])-log(u2[1]);
	*t1 = R_pow(u, *pcorr/pdistpar[0])*R_pow(v, 1/pdistpar[0])*pdistpar[1];
	*t2 = R_pow(1-u, *pcorr/pdistpar[2])*R_pow(v, 1/pdistpar[2])*pdistpar[3];
	return;
} // weibullt

SEXP dgBIV(
	SEXP n,
	SEXP dist,
	SEXP corr,
	SEXP distpar)
{
	CcharCP pdist = CHAR( STRING_ELT(dist, 0) );
	Tfunc tfunc = expt;
	if (strcmp(pdist, "weibull") == 0) tfunc = weibullt;
	else if (strcmp(pdist, "exponential") == 0) tfunc = expt;
	SEXP mat;
	PROTECT( mat = allocMatrix(REALSXP, *INTEGER(n), 2) );
	register int i;
	GetRNGstate();
	for (i = 0; i < *INTEGER(n); i++) {
		tfunc(REAL(corr), REAL(distpar), &REAL(mat)[i], &REAL(mat)[i+*INTEGER(n)]);
	}
	PutRNGstate();
	UNPROTECT(1);
	return(mat);
} // dgBIV
