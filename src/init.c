
#include <R_ext/Visibility.h>
#include <Rinternals.h>
#include <Rversion.h>
#include "dgBIV.h"

#define PREFIX Rf_

#define STRINGIFY2(x) #x
#define STRINGIFY(x) STRINGIFY2(x)
#define PASTE2(a, b) a##b
#define PASTE(a, b) PASTE2(a, b)

#define CALLDEF(name, n)  {STRINGIFY(PASTE(PREFIX, name)), (DL_FUNC) &name, n}

static const R_CallMethodDef CallEntries[] = {
  CALLDEF(dgBIV, 4),
  {NULL, NULL, 0}
};

void attribute_visible R_init_genSurv(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
#if defined(R_VERSION) && R_VERSION >= R_Version(2, 16, 0)
  R_forceSymbols(dll, TRUE);
#endif

  SEXP genSurv_NS = R_FindNamespace( mkString("genSurv") );
  if (genSurv_NS == R_UnboundValue) error("missing 'genSurv' namespace: should never happen");
  if ( !isEnvironment(genSurv_NS) ) error("'genSurv' namespace not determined correctly");
  return;
} // R_init_genSurv
