
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
	double u1, u2, v, a;
	u1 = runif(0, 1);
	v = runif(0, 1);
	a = *pcorr*(2*u1-1);
	u2 = 2*v/( 1-a+sqrt(R_pow_di(1-a, 2)+4*a*v) );
	*t1 = -pdistpar[0]*log(1-u1);
	*t2 = -pdistpar[1]*log(1-u2);
	return;
} // expt

static void weibullt(
	CdoubleCP pcorr,
	CdoubleCP pdistpar,
	doubleCP t1,
	doubleCP t2)
{
	register int i;
	double u[5], v;
	for (i = 0; i < 5; i++) u[i] = runif(0, 1);
	if (u[4] > *pcorr) v = -log(u[3]);
	else v = -log(u[1])-log(u[2]);
	*t1 = R_pow(u[0], *pcorr/pdistpar[0])*R_pow(v, 1/pdistpar[0])*pdistpar[1];
	*t2 = R_pow(1-u[0], *pcorr/pdistpar[2])*R_pow(v, 1/pdistpar[2])*pdistpar[3];
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
