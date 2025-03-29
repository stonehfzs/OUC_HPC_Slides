#include <R.h>
#include <Rinternals.h>

SEXP matrix_multiply(SEXP A, SEXP B) {

  int nrowA = Rf_nrows(A);
  int ncolA = Rf_ncols(A);
  int nrowB = Rf_nrows(B);
  int ncolB = Rf_ncols(B);
  
  if (ncolA != nrowB) {
    Rf_error("The input cannot do the multiplication.");
  }
  
  SEXP result = PROTECT(Rf_allocMatrix(REALSXP, nrowA, ncolB));
  
  double *a = REAL(A);
  double *b = REAL(B);
  double *res = REAL(result);
  
  for (int i = 0; i < nrowA; i++) {
    for (int j = 0; j < ncolB; j++) {
      double sum = 0.0;
      for (int k = 0; k < ncolA; k++) {
        sum += a[i + k * nrowA] * b[k + j * nrowB];
      }
      res[i + j * nrowA] = sum;
    }
  }
  
  UNPROTECT(1);
  return result;
}