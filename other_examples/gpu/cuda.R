knitr::opts_chunk$set(echo = TRUE)
library("pryr")
library("gpuR")

detectGPUs()

result <- data.frame()

for (exponent in seq(2,24,2)){
  A = matrix(rnorm(2^exponent), nrow=sqrt(2^exponent))
  B = matrix(rnorm(2^exponent), nrow=sqrt(2^exponent))
  
  now <- Sys.time()
  gpuA = gpuMatrix(A, type="double")
  gpuB = gpuMatrix(B, type="double")
  gpuC = gpuA %*% gpuB
  gpu <- Sys.time()-now
  
  now <- Sys.time()
  C = A%*%B
  classic <- Sys.time()-now
  
  now <- Sys.time()
  vclA = vclMatrix(A, type="double")
  vclB = vclMatrix(B, type="double")
  vclC = vclA %*% vclB
  vcl <- Sys.time()-now
  
 result <- rbind(result,c(nrow(A), classic, gpu, vcl)) 
}
colnames(result) <- c("nrow", "time_classic", "time_gpu", "time_vcl")

# see http://www.r-tutor.com/gpu-computing
# and https://cran.r-project.org/web/packages/gpuR/index.html
# https://cran.r-project.org/web/packages/gpuR/gpuR.pdf
# for more examples and complete documentation of R GPU functions