#Setup and Logging-in
#install.packages("twitteR")
library(twitteR)
consumer_key <- "vnu1NZKvDm9C94iSQ49CFjiuX"
consumer_secret <- "plhGUFMdtB3ihhzqjglf8ykqOxjnJOyMgJzLEf4U2mpjpvoNr6"
access_token <- "963892638507196421-IgKuZCCCpdSUQeGZx2oZERdTdJ544nj"
access_secret <- "3SHnX5AxLwEND3c6pgQyTcvS3rdZE3Oti1OHypzjaG8XU"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)





#Search Twitter
tweets <- searchTwitteR("w\U00FCrzburg", n=10)
print(tweets)

#Search Booleans and Parameters
tweets <- searchTwitteR("Samsung OR Apple :)", n = 10) #OR with positive sentiment
print(tweets)

tweets <- searchTwitteR("Samsung AND Apple :(", n = 10) #AND with negative sentiment
print(tweets)

tweets <- searchTwitteR("cat filter:media", lang="en", n = 10)
print(tweets)

tweets <- searchTwitteR("ist", geocode = "49.78835749241399,9.964599609375, 50mi")
print(tweets)

#headers
colnames(tweetsdf)

#Users
dlr_de <- getUser("DLR_de") #Gets Twitter User class
str(dlr_de) #Structure

#Users data examples
dlr_de$lang
dlr_de$location
dlr_de$followersCount
dlr_de$lastStatus

#User timeline
dlrtweets <- userTimeline("DLR_de", n=100)
print(dlrtweets[5])

#Messing with profile image
library(colorfindr)
pacman::p_load(colorfindr, dplyr)
get_colors(
  img = dlr_de$profileImageUrl
) %>% 
  plot_colors_3d(sample_size = 100, marker_size = 2.5, color_space = "RGB")

#Trends
trending <- getTrends("1") #Worldwide trending, uses WOEID
head(trending)

trendlocation <- closestTrendLocations(49.78835749241399,9.964599609375)
print(trendlocation)

trending <- getTrends(trendlocation[3])
head(trending)

#Rate limits
getCurRateLimitInfo()


#Function to check geoenabled
isGeoEnabled <- function(x) {
  if (is.null(x$longitude))
    return(FALSE)
  else
    return(TRUE)
}

