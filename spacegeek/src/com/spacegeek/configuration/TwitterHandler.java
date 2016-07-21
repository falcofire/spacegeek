package com.spacegeek.configuration;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import twitter4j.MediaEntity;
import twitter4j.Query;
import twitter4j.Query.ResultType;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.URLEntity;
import twitter4j.conf.ConfigurationBuilder;

public class TwitterHandler {
	
	TwitterFactory tf;
	TwitterHandler th;
	private static Twitter twitter;
	private Calendar cal = Calendar.getInstance();
	private Date today = new Date();
	private static Date oldest;
	private static SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd");
	
	/**
	 * Creates the Twitter configuration builder
	 */
	public TwitterHandler() {
		cal.setTime(today);
		cal.add(Calendar.DATE, -30);
		oldest = cal.getTime();
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
		  .setOAuthConsumerKey("Sxoo08g0j2LPnGVIz3dYiYQPS")
		  .setOAuthConsumerSecret("aUlfvro1Qq5CizPzCmAnMyWXRCD3G7tClnWWom5Me99SHGKNZ4")
		  .setOAuthAccessToken("4520336956-1FOcSE6BxCQIToJP0J3xyVW1TNQQU53btK0D6AE")
		  .setOAuthAccessTokenSecret("m2nAbx7KuqCA67ATiUQTsAFQYBWHYz3TyaMVqlbGaFebP");
		TwitterFactory tf = new TwitterFactory(cb.build());
		twitter = tf.getInstance();
	}
	
	public Twitter getTwitter() {
		return this.twitter;
	}
	
	/**
	 * Gets tweets for the given query
	 * @param qParam
	 * @return ArrayList<Map<String,String>> of parsed tweets
	 */
	public static ArrayList<Map<String,String>> getStories(String qParam) {
		twitter = (new TwitterHandler()).getTwitter();
	    Query query = new Query(qParam);
	    query.setCount(30);
	    String dateString = df.format(oldest);
	    query.since(dateString);
	    query.setSince(dateString);
	    return getTweets(query);
	}
	
	/**
	 * 
	 * @param accounts - list of queries to get top stories for
	 * @return ArrayList<Map<String,String>> of parsed tweets
	 */
	public static ArrayList<Map<String,String>> getTopStories(ArrayList<String> accounts) {
		twitter = (new TwitterHandler()).getTwitter();
		ArrayList<Map<String,String>> tweets = new ArrayList<Map<String,String>>();
		Query query = new Query();
		for (String account : accounts) {
			query.setQuery(account);
			query.setResultType(ResultType.popular);
			query.setCount(1);
			ArrayList<Map<String,String>> story = getTweets(query);
			if (story.size() > 0) {
				tweets.add(getTweets(query).get(0));
			}
		}
		
		return tweets;
	}
	
	/**
	 * 
	 * @param query
	 * @returns ArrayList<Map<String,String>> of parsed tweets
	 */
	private static ArrayList<Map<String,String>> getTweets(Query query) {
		ArrayList<Map<String,String>> tweets = new ArrayList<Map<String,String>>();
		QueryResult result = null;
		try {
			result = twitter.search(query);
			Map<String, String> twit;
			for (Status status : result.getTweets()) {
				twit = new HashMap<String,String>();
				twit.put("type", "tweet");
				twit.put("id", String.valueOf(status.getId()));
				twit.put("ts", String.valueOf(status.getCreatedAt()));
				twit.put("user", status.getUser().getScreenName());
				twit.put("text", status.getText());
				twit.put("favCount", String.valueOf(status.getFavoriteCount()));
				twit.put("retweets", String.valueOf(status.getRetweetCount()));
				if (status.getURLEntities() != null) {
					for (URLEntity link : status.getURLEntities()) {
						twit.put(link.getURL(), link.getExpandedURL());
						String textWithLinks = twit.get("text");
						String url = link.getURL();
						textWithLinks = textWithLinks.replaceAll(url, "<a target=\"_blank\" href=\"" + link.getExpandedURL() + "\">" + link.getURL() + "</a>");
						twit.put("text", textWithLinks);
					}
				}
				
				String imgUrl = "";
				MediaEntity[] media = status.getMediaEntities();
				if (media.length > 0) {
					imgUrl = media[0].getMediaURL();
				}
				twit.put("imgUrl", imgUrl);
				tweets.add(twit);
			}
		} catch (TwitterException e) {
			e.printStackTrace();
		}
		return tweets;
	}
}
