#install.packages("rtweet")

library(rtweet)

create_token(
  app = "GEOCOMP2018 Group Project",
  consumer_key <- "vnu1NZKvDm9C94iSQ49CFjiuX",
  consumer_secret <- "plhGUFMdtB3ihhzqjglf8ykqOxjnJOyMgJzLEf4U2mpjpvoNr6",
  access_token <- "963892638507196421-IgKuZCCCpdSUQeGZx2oZERdTdJ544nj",
  access_secret <- "3SHnX5AxLwEND3c6pgQyTcvS3rdZE3Oti1OHypzjaG8XU"
)

#Stream Tweets
tweets <- stream_tweets(lookup_coords("germany"), timeout = 10 )

#Search Twitter
tweets <- search_tweets("w\U00FCrzburg", n=10)
print(tweets)

#Search Booleans and Parameters
tweets <- search_tweets("Samsung OR Apple :)", n = 10) #OR with positive sentiment
View(tweets)

tweets <- search_tweets("Samsung AND Apple :(", n = 10) #AND with negative sentiment
View(tweets)

tweets <- search_tweets("cat filter:media", lang="de", n = 10, include_rts = FALSE)
View(tweets)

tweets <- search_tweets("ist", geocode = "49.78835749241399,9.964599609375, 50mi")
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
library(colorfindr)
pacman::p_load(colorfindr, dplyr)
get_colors(
  img = users$profile_image_url[2]
) %>% 
  plot_colors_3d(sample_size = 100, marker_size = 2.5, color_space = "RGB")

#Timelines
tweets <- get_timelines(users$screen_name, n = 100)
View(tweets)

#Simple data analysis
tweetdata <- ts_data(tweets, by = "days")
ggplot(tweetdata, aes(time)) + geom_bar(aes(weight = n),position = position_stack(reverse = TRUE)) + coord_flip() +
  theme(legend.position = "top")

#Trends
trends <- get_trends(woeid = 1) #Worldwide trends
View(trends)

trends <- get_trends(lat = 49.788, lng = 9.964) #Nearest to Wuerzburg
View(trends)

