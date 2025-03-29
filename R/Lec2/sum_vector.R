sum_vector <- function ( x ) {
  sum <- 0
  for ( i in 1 : length ( x ) ) {
    sum <- sum + x [ i ]
  }
  return (sum)
}
