# Block 2 Differentiation

#Lesson 2
#library(mosaic)
#library(mosaicCore)
#library(mosaicCalc)

D(t * sin(t) ~ t) #derivative example

g <- makeFun(x + 4 * x ~ x) # define the function
D(g(x) ~ x)

#Function with several variables derivative
mf <- makeFun(pnorm(1 + x^2, mean=2, sd=y) ~ x & y) #define the function
dx_mf <- D(mf(x,y) ~ x) #differentiate derivative
dx_mf

#Second derivative
dxx_mf <- D(mf(x,y) ~ x & x)