x <- 1:100000000
sum_vector(x)
system.time(sum_vector(x))

system("R CMD SHLIB sum.c")
dyn.load("sum.dll")
.Call("sum_vector", as.numeric(x))
system.time(.Call("sum_vector", as.numeric(x)))



A <- matrix(as.numeric(1:9000000), nrow = 3000, ncol = 3000)
B <- matrix(as.numeric(1:9000000), nrow = 3000, ncol = 3000)
C <- A %*% B
system.time(C <- A %*% B)

system("R CMD SHLIB multi.c")
dyn.load("multi.dll")
.Call("matrix_multiply", A, B)
dyn.unload("multi.dll")
system.time(.Call("matrix_multiply", A, B))

system("R CMD SHLIB -fopenmp multi_parallel.c")
dyn.load("multi_parallel.dll")
.Call("matrix_multiply_parallel", A, B)
system.time(.Call("matrix_multiply_parallel", A, B))
