metaData <- yaml::read_yaml(file = "metadat.yaml")

twitter_token_app1 <- rtweet::create_token(app             = metaData$twitterAPI$app1$appName,
                                           consumer_key    = metaData$twitterAPI$app1$consumer_key,
                                           consumer_secret = metaData$twitterAPI$app1$consumer_secret)

twitter_token_app2 <- rtweet::create_token(app             = metaData$twitterAPI$app2$appName,
                                           consumer_key    = metaData$twitterAPI$app2$consumer_key,
                                           consumer_secret = metaData$twitterAPI$app2$consumer_secret, 
                                           access_token    = metaData$twitterAPI$app2$access_token,
                                           access_secret   = metaData$twitterAPI$app2$access_secret)

# Search for europ-Assistance
covidTweets <- rtweet::search_tweets(q = "covid", 
                                     n = 2000000, 
                                     include_rts = TRUE, 
                                     retryonratelimit = TRUE, 
                                     token = twitter_token_app1)

save(covidTweets, file = "covidTweets.RData")


netflixTweets <- rtweet::search_tweets(q = "netflix", 
                                       n = 2000000,
                                       include_rts = TRUE, 
                                       retryonratelimit = TRUE, 
                                       token = twitter_token_app2)

save(netflixTweets, file = "netflixTweets.RData")