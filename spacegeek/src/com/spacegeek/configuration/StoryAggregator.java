package com.spacegeek.configuration;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Map;

import facebook4j.FacebookException;

public class StoryAggregator {
	
	SimpleDateFormat df = new SimpleDateFormat("E MMM dd HH:mm:ss z yyyy");
	
	public ArrayList<Map<String,String>> getCombinedStories(String account) {
		ArrayList<Map<String,String>> combinedStories = new ArrayList<Map<String,String>>();
		try {
			combinedStories = FacebookHandler.getUserFeed(account);
		} catch (FacebookException e) {
			e.printStackTrace();
		}
		if (account.equals("iss")) {
			account = "Space_Station";
		}
		combinedStories.addAll(TwitterHandler.getStories("from:" + account));
		
		Collections.sort(combinedStories, new Comparator<Map<String, String>>() {
		    @Override
		    public int compare(final Map<String, String> map1, final Map<String, String> map2) {
		    	try {
					Date date1 = df.parse(map1.get("ts"));
					Date date2 = df.parse(map2.get("ts"));
					return date2.compareTo(date1);
				} catch (ParseException e) {
					e.printStackTrace();
				}
		    	return 0;
		    }
		});
		
		return combinedStories;
	}
	
}
