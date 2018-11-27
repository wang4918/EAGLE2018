####FUN
#install.packages("ggimage")
#install.packages("network")
#install.packages("sna")
#install.packages("GGally")
library(ggplot2)
library(ggimage)

ggplot(bigdf, aes(x = measure1, y=measure2))+
  geom_image(aes(image="iconforgoogle.png"), size = .05, by="height")

library(maps)
library(network)
library(sna)
library(GGally)

ggnetworkmap(usa, flights, size = 4, great.circles = TRUE,
             node.group = mygroup, segment.color = "steelBlue",
             ring.group = degree, weight = degree)

###############################################################

##Geocoding with tmaptools
#install.packages("tmap")
library(tmap)
library(sp)
library(tmaptools)

cities <- geocode_OSM(tweetdata$location)
#cities <- geocode_OSM(c("Shenyang", "Minneapolis", "Wuerzburg"))
coordinates(cities) <- ~lon+lat

current.mode <- tmap_mode("view")
tm_shape(cities) + 
  tm_dots(col = "blue")

##Spatial Data with ggplot2
library(RStoolbox)

ggR(lsat$B2_dn, geom_raster = T)+
  scale_fill_gradient(low = "lightblue", high = "darkblue", name = "", na.value = NA)+
  labs(x="", y="")+
  ggtitle("Band 2")+
  theme(plot.title = element_text(hjust = 0.5, face="bold", size = 10))+
  theme(legend.title = element_text(size = 10, face = "bold"))+
  theme(legend.text = element_text(size = 6))+
  theme(axis.text.y = element_text(angle = 45, size = 6))+
  scale_y_continuous(breaks = seq(5527000,5538000,4000))+
  xlab("")+
  ylab("")


