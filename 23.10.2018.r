install.packages('raster')
library(raster)

install.packages('rmarkdown')
library(rmarkdown)

#get vector
germany <- getData('GADM', country ='MNE', level=2)
plot(germany)

#get raster for precipitation data
prec <- getData("worldclim", var='prec', res=0.5, lon = 10, lat = 51)
plot(prec)

#crop to germany
prec_ger1 <- crop(prec, germany)
spplot(prec_ger1)

#mask to germany
prec_ger2 <- mask(prec_ger1, germany)
spplot(prec_ger2)


prec_avg <- cellStats(prec_ger2, stat ='mean')
print(prec_avg)

tb <- read.table('table1.csv', header=T, sep=';')

tb[1] = 2015

print(tb)