#install.packages("twitteR")
library(twitteR)

consumer_key <- "vnu1NZKvDm9C94iSQ49CFjiuX"
consumer_secret <- "plhGUFMdtB3ihhzqjglf8ykqOxjnJOyMgJzLEf4U2mpjpvoNr6"
access_token <- "963892638507196421-IgKuZCCCpdSUQeGZx2oZERdTdJ544nj"
access_secret <- "3SHnX5AxLwEND3c6pgQyTcvS3rdZE3Oti1OHypzjaG8XU"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tweets <- searchTwitteR("w\U00FCrzburg", n=10)
print(tweets)