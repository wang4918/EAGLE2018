#install.packages("rtweet")
#install.packages("colorfindr")
#install.packages("ggplot2")
#install.packages("maps")

#Logging in and Setup
library(rtweet)
library(colorfindr)
library(ggplot2)
library(maps)

create_token(
  app = "GEOCOMP2018 Group Project",
  consumer_key <- "vnu1NZKvDm9C94iSQ49CFjiuX",
  consumer_secret <- "plhGUFMdtB3ihhzqjglf8ykqOxjnJOyMgJzLEf4U2mpjpvoNr6",
  access_token <- "963892638507196421-IgKuZCCCpdSUQeGZx2oZERdTdJ544nj",
  access_secret <- "3SHnX5AxLwEND3c6pgQyTcvS3rdZE3Oti1OHypzjaG8XU"
)


#Search Twitter and the TweetJSON
tweets <- search_tweets("w\U00FCrzburg", n=1, parse = TRUE) #n up to 18,000
print(tweets)

#Search Booleans and Parameters
tweets <- search_tweets("Samsung OR Apple :)", n = 10) #OR with positive sentiment
View(tweets)

tweets <- search_tweets("Samsung AND Apple :(", n = 10) #AND with negative sentiment
View(tweets)

tweets <- search_tweets("Apple -iPhone", lang="en", n = 10)
View(tweets)

tweets <- search_tweets("cat filter:media", lang="en", n = 10, include_rts = FALSE)
View(tweets)

tweets <- search_tweets("katze", geocode = lookup_coords("germany"))
View(tweets)

#headers
colnames(tweets)

#Users
users <- lookup_users(c("DLR_de", "NASA", "JAXA_jp")) #Gets Twitter User class
View(users)

#Some user data examples
users$description
users$location
users$friends_count
colnames(users)

#Messing with profile image
pacman::p_load(colorfindr, dplyr)
get_colors(
  img = users$profile_image_url[2]
) %>% 
  plot_colors_3d(sample_size = 1000, marker_size = 2.5, color_space = "RGB")

#Timelines
tweets <- get_timelines(users$screen_name, n = 100)
View(tweets)

#Simple data analysis
tweetdata <- ts_data(tweets, by = "days")
ggplot(tweetdata, aes(time)) +
  geom_bar(aes(weight = n),
  position = position_stack(reverse = TRUE)) +
  coord_flip() +
  theme(legend.position = "top")

#Mapping data
tweetdata <- search_tweets(lang = "de", geocode = lookup_coords("usa"), n =1000)
tweetdata <- lat_lng(tweetdata)

par(mar = c(0, 0, 0, 0))
map("state", lwd = .25)
with(tweetdata, points(lng, lat, pch = 20, cex = .75, col = rgb(0, .3, .7, .75)))

#Trends
trends <- get_trends(woeid = 1) #Worldwide trends
View(trends)

trends <- get_trends(lat = 49.788, lng = 9.964) #Nearest to Wuerzburg
View(trends)


#Stream Tweets
tweets <- stream_tweets(loc1, timeout = 10 )
loc1 <- lookup_coords("minneapolis")
loc1 <- lookup_coords("würzburg")
loc1 <- lookup_coords("bavaria")
loc1 <- lookup_coords("germany")

stream_tweets(
  "samsung, apple, nokia, huawei, micromax, xiaomi, oppo, alcatel",
  timeout = 60*60*24*7,
  file_name = "smartphonetweets.json",
  parse = FALSE
)

#Twitter Developer Platform:
#https://developer.twitter.com/en.html

#rtweet:
#https://rtweet.info/index.html

#Ethics:
#https://developer.twitter.com/en/developer-terms/more-on-restricted-use-cases


