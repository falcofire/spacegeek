package com.spacegeek.configuration;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import twitter4j.MediaEntity;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class TwitterHandler {
	
	TwitterFactory tf;
	TwitterHandler th;
	public Twitter twitter;
	
	public TwitterHandler() {
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
		  .setOAuthConsumerKey("YtQOX3RwVARjSS9r2LJmkl9vL")
		  .setOAuthConsumerSecret("VbvYlVkUsyIMsgeFSc9I4FkDMP7GzkIcT5pvDJ8ZYF2BU0bJmx")
		  .setOAuthAccessToken("4520336956-1FOcSE6BxCQIToJP0J3xyVW1TNQQU53btK0D6AE")
		  .setOAuthAccessTokenSecret("m2nAbx7KuqCA67ATiUQTsAFQYBWHYz3TyaMVqlbGaFebP");
		TwitterFactory tf = new TwitterFactory(cb.build());
		twitter = tf.getInstance();
	}
	
	public Twitter getTwitter() {
		return this.twitter;
	}
	
	public static ArrayList<Map<String,String>> getStories(String qParam) {
		ArrayList<Map<String,String>> tweets = new ArrayList<Map<String,String>>();
		Twitter twitter = (new TwitterHandler()).getTwitter();
	    Query query = new Query(qParam);
	    QueryResult result = null;
		try {
			result = twitter.search(query);
			if (result.getCount() > 0) {
				Map<String,String> twit;
				for (Status status : result.getTweets()) {
					twit = new HashMap<String,String>();
					twit.put("id", String.valueOf(status.getId()));
					twit.put("user", status.getUser().getScreenName());
					twit.put("text", status.getText());
					
					String imgUrl = "";
					MediaEntity[] media = status.getMediaEntities();
					if (media.length > 0) {
						imgUrl = media[0].getMediaURL();
					}
					twit.put("imgUrl", imgUrl);
					tweets.add(twit);
				}
			}
		} catch (TwitterException e) {
			e.printStackTrace();
		}
	    return tweets;
	}
}
