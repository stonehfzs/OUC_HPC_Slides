#include <Rinternals.h>
SEXP sum_vector(SEXP x) {
    int n = LENGTH(x);
    double sum = 0;
    for (int i = 0; i < n; i++) 
    {
        sum += REAL(x)[i];
    }
    return ScalarReal(sum);
}