#FUN
devtools::install_github("gaborcsardi/praise")
library(praise)

praise()

devtools::install_github("brooke-watson/BRRR")

library(BRRR)

for(x in 1:2){
  skrrrahh("bigboi")
}

skrrrahh_list()

#Importing vector data
library(rgdal)
avectorfile <- readOGR("steiger.shp")

plot(avectorfile)

#NDVI
ndvifun <- function(nir, red){
  (nir-red)/(nir+red)
}

ndvi <- overlay(lsat$B4_dn, lsat$B3_dn, fun = ndvifun)
plot(ndvi)

library(RStoolbox)
msavi <- spectralIndices(lsat, red = "B3_dn", nir ="B4_dn", indices = "MSAVI")
plot(msavi)


#ggplot2
#install.packages("ggplot2")
library(ggplot2)
x11()
x <- data.frame(x=1, y=1, label="ggplot intro \nEAGLE")
ggplot(data=x, aes(x=x, y=y)) +geom_text(aes(label=label), size = 15)

df <- data.frame(a = bigdf$measure2, b = bigdf$measure3)
ggplot(df, aes(a,b, color = bigdf$measure1)) + 
  geom_point(alpha = .5) + 
  labs(title = "Nonsensical Unsinn",x = "Nonsense", y = "Unsinn", color = "Gibberish")
       
       
       