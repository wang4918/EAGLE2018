#Fun stuff to do and mess with
install.packages(fun)
library(fun)
if (.Platform$OS.type = "windows") x11() else x11(type = "Xlib")
mine_sweeper

install.packages("colorfindr")

install.packages("pacman")



#Playing with Colorfindr
library(colorfindr)
pacman::p_load(colorfindr, dplyr)
get_colors(
  img = "https://upload.wikimedia.org/wikipedia/commons/f/ff/Flag_of_China_%281912%E2%80%931928%29.svg",
  min_share = 0.05
) %>% 
  plot_colors(sort = "size")

library(colorfindr)
pacman::p_load(colorfindr, dplyr)
get_colors(
  img = "https://upload.wikimedia.org/wikipedia/commons/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg"
) %>% 
  plot_colors_3d(sample_size = 5000, marker_size = 2.5, color_space = "RGB")


#Changing values in vector

x <- sample(1:1000, 100)
print(x)

#Matricies
m <- matrix(c(sample(1:100), 50 ), nrow = 10)
print(m)
print(m[3,2])

normnum <- rnorm(100, mean =0, sd=2)
print(normnum)

normnummat <- matrix(normnum,nrow = 10)
normnummat

#Dataframes, they have NAMES!!!
#Rows and columns, with various data types, each column is a single type
df <- data.frame(normnummat)

names(df) <- c('One', 'Two', 'Three', 'Four', 
               'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten')
df

df1 <- data.frame(plot="loc1", measure1 = runif(100)*1000, measure2 = round(runif(100)*100),
                  value=rnorm(100,2,1), ID=rep(LETTERS, len = 100))
df2 <- data.frame(plot="loc2", measure1 = runif(50), measure2 = round(runif(50)),
                  value=rnorm(50), ID=rep(LETTERS, len = 50))
bigdf <- rbind(df1, df2)
bigdf        

#list
a <- seq(1:12)
b <- runif(12)

clist <- list(a, b)
clist[[2]][1]
clist$a[2]

#Indexing #REMEMBER: [ROW, COLUMN]

bigdf[bigdf$measure1>900 & bigdf$measure2>3,] #querying for rows

bigdf$measure3 <- round(bigdf$measure1 * bigdf$measure2) #add new 

bigdf[grep('P', bigdf$ID,ignore.case=T), ]

#Some functions
x1 <- rbinom(10, size = 1, prob= 0.5)
x2 <- factor(x1, labels = c('one', 'zero'))
x2
summary(x2)
levels(x2)

#steigerwald
sw <- read.csv2("steigerwald.csv", header = TRUE, sep = ",", quote = "\"")

spdf.obj <- sw
install.packages("spdf")
names(spdf.obj)

library(sp)
coordinates(spdf.obj) <- ~x+y

class(spdf.obj)
library(rgdal)
writeOGR(spdf.obj, "steiger.shp", driver ="ESRI Shapefile", "data")
