#Fun
#install.packages("suncalc")
#install.packages("V8")
library(suncalc)
library(V8)
df <- getSunlightTimes(date = Sys.Date(), lat = 49.782332, lon = 9.970187)

#ggplot
df <- data.frame(a = bigdf$measure2, b = bigdf$measure3, c = bigdf$measure1)

#Scatter plot
ggplot(df, aes(b,c, color = a)) + 
  geom_point(alpha = .5) + 
  labs(title = "Nonsensical Unsinn",x = "Nonsense", y = "Unsinn", color = "Gibberish")

#Histogram
ggplot(df, aes(a))+
  geom_histogram(color = "red")

#Density
ggplot(df, aes(a, fill = a))+
  geom_density(alpha = 0.5)

#Hist&Density combo
ggplot(df)+
  geom_histogram(aes(a,..density..), color = "red", fill = "red", color = "grey")+
  geom_density(aes(a,..density..), color="blue")+
  geom_rug(aes(a))

#Boxplot
ggplot(df, aes(bigdf$ID,b))+
  geom_jitter(alpha = .5, color = "blue")+
  geom_boxplot(alpha=.5)

#Split scatter
ggplot(df, aes(a, b, color = c))+
  geom_point(alpha=.5)+
  facet_grid(bigdf$plot~.)

#2d density
ggplot(df, aes(a, b, c))+
  geom_point(size =1)+
  geom_density2d()

#Ploting Steigerwald data
steiger <- read.csv("steigerwald.csv")

ggplot(steiger, aes(x=L8.ndvi, y=SRTM))+
  geom_point(alpha = 0.2, color = "blue", size = 1)+
  geom_density2d(color = "red", size = 1)

ggplot(steiger, aes(x=LCname, y=MOD.evi)) +
  geom_point()+
  coord_flip()

ggplot(steiger, aes(x=LCname, y=MOD.evi)) +
  geom_jitter(alpha = .5, size = steiger$TimeScan.NDVIsd, color = steiger$L8.ndvi)+
  geom_boxplot(alpha = .5)+
  coord_flip()

ggplot(steiger, aes(x=LCname, y=MOD.evi)) +
  geom_violin()+
  coord_flip()

ggplot(steiger, aes(x=L8.ndvi, y=SRTM))+
  geom_point(aes(color = LCname), size =2)+
  facet_grid(.~LCname)+
  coord_flip()

#ggmap #install.packages("ggmap")
library(ggmap)
library(mapproj)
#Not working:
#map.wue <- get_map("germany", force = TRUE, source = "osm", "AIzaSyBl0MmBa_-NRAWalhZAf4QLxcyJCAgySaU")

#LSAT
lsatdf <- data.frame(coordinates(lsat), getValues(lsat))
ggplot(lsatdf)+
  geom_raster(aes(x=x, y=y, fill = B3_dn))+
  scale_fill_gradient(na.value = NA)+
  coord_equal()

library(RStoolbox)
ggRGB(lsat, 3,2,1, stretch = "lin")

ggR(lsat, layer = 3, stretch = "hist", geom_raster = TRUE)+
  scale_fill_gradient(low = "yellow", high = "chartuse")

