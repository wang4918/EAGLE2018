#Some fun
  #install.packages("fortunes")

library(fortunes)
fortune("memory")

  #install.packages("cowsay")
library(cowsay)
sayHello <- function(){
  animal <- sample(names(animals), 1)
  say(paste("Hello, I'm a", animal, ".", collaspe = ""), by = animal)
}

sayFortune <- function(x) {
  animal <- sample(names(animals), 1)
  say(paste(fortune(), collapse = ""), by = animal)
}

sayFortune()

#Data query
with(sw[as.numeric(sw$TimeScan.NDVIavg) < 0.3 & sw$LUCAS_LC == 1,], plot(sw$x, sw$SRTM))
dfdf <- sw[as.numeric(as.character(sw$TimeScan.NDVIavg)) > 0.4,]


#install.packages("RStoolbox")
library(RStoolbox)
data(lsat)
str(lsat@data)


#Creating raster data
library(raster)
r1 <- raster(nrows = 20, ncols = 20) #Empty 20x20 raster
r1[] <- rnorm(400) #Fill with 100 random values
plot(r1)

#New layer
r3$new <- r3[[1]]*r3[[2]]^2

#DF to raster
library(raster)
df1 <- data.frame(measure1 = runif(10000)*100, measure2 = round(rnorm(10000)*100))
r1 <- raster(nrows = 100, ncols = 100)
r2 <- raster(nrows = 100, ncols = 100)
r1[] <- df1$measure1
plot(r1)
r2[] <- df1$measure2
plot(r2)

r3 <- stack(r1, r2) #Stacks the layers into raster stack
r3
plot(r3)
plot(r3@layers[[2]]) #plot one layer or just r3[[1]]

r3$layer.3 <- r3[[1]]+r3[[2]]^2
plot(r3)

dropLayer(r3, c(3))





 thing <- sw[as.numeric(as.character(sw$LUCAS_LC)) == 1 & as.numeric(as.character(sw$SRTM)) > 100,]

 class(sw$LUCAS_LC)
 