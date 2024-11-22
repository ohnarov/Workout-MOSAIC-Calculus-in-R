#Lesson 2
#library(mosaic)
#library(mosaicCore)
#library(mosaicCalc)

?Engines # example df

#Exploring data
names(Engines) # the names of the df variables
head(Engines) # the first several df rows
nrow(Engines) # how many rows in the df
View(Engines) # view small/middle-sized df content

#Plotting data
gf_point(stroke ~ bore, data = Engines) # scatterplot or point plot
slice_plot(stroke_model(bore) ~ bore, domain(bore=0:1000))

#define the model
stroke_model <- 
  fitModel(stroke ~ A*bore^b, 
           data = Engines)
#plot the model
gf_point(stroke ~ bore, data = Engines) |>
  slice_plot(stroke_model(bore) ~ bore, 
             color="blue")

#Modeling functions
#model(x) = Ag_pattern_function(ax + b) + B
#ax + b => input scaling
#Ag(x) + B => output scaling

#Assembling functions
Heaviside <- makeFun(ifelse(0 <= x, 1, 0) ~ x)

#Fitting function to the data
T_water <- makeFun(74*exp(-0.0173*t) + 25 ~ t) #define the function model

gf_point(temp ~ time, data = CoolingWater, alpha = 0.5 ) %>% #plot
  slice_plot(T_water(time) ~ time, color = "blue") %>%
  gf_labs(x = "Time (minutes)", y = "Temperature (deg. C)")

#Extracting info from functions

#Zero finding
func1 <- makeFun(sqrt(x) ~ x)
func1(2)
Zeros(func1(x) + 10 ~ x, domain(x=0:10))
slice_plot(func1(x) ~ x, domain(-100:100))

#Optimization
argM(func1(x) ~ x, domain(x=-6:6))

#Iteration
Iterate(func1(x) ~ x, x0=4, 8)
