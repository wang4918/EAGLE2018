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

#Creating raster data
#install.packages("RStoolbox")
library(RStoolbox)
data(lsat)
lsat

