package com.spacegeek.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;

public class AggregateSorter {
	
	@SuppressWarnings("unchecked")
	public String sortRecent(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String returnUrl = request.getHeader("referer").replace("http://localhost:8080/spacegeek/", "");
		ArrayList<Map<String,String>> tweets = (ArrayList<Map<String, String>>) session.getAttribute("tweets");
		Collections.sort(tweets, new DateComparator("ts"));
		session.setAttribute("tweets", tweets);
		return "redirect:/" + returnUrl;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("sortRetweet")
	public String sortRetweet(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String returnUrl = request.getHeader("referer").replace("http://localhost:8080/spacegeek", "");
		ArrayList<Map<String,String>> tweets = (ArrayList<Map<String, String>>) session.getAttribute("tweets");
		Collections.sort(tweets, new RetweetComparator("retweets"));
		session.setAttribute("tweets", tweets);
		return "redirect:/" + returnUrl;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("sortPopular")
	public String sortPopular(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String returnUrl = request.getHeader("referer").replace("http://localhost:8080/spacegeek", "");
		ArrayList<Map<String,String>> posts = (ArrayList<Map<String, String>>) session.getAttribute("posts");
		Collections.sort(posts, new PopularComparator());
		session.setAttribute("stories", posts);
		return "redirect:/" + returnUrl;
	}
	
	class DateComparator implements Comparator<Map<String, String>>
	{
	    private final String key;

	    public DateComparator(String key)
	    {
	        this.key = key;
	    }

	    public int compare(Map<String, String> first, Map<String, String> second)
	    {
	    	DateFormat format = new SimpleDateFormat("EEE MMM d HH:mm:ss z yyyy", Locale.ENGLISH);
	    	Date firstValue = null;
	    	Date secondValue = null;
			try {
				firstValue = format.parse(first.get(key));
		        secondValue = format.parse(second.get(key));
			} catch (ParseException e) {
				e.printStackTrace();
			}
	        return secondValue.compareTo(firstValue);
	    }
	}
	
	class PopularComparator implements Comparator<Map<String,String>>
	{
		public int compare(Map<String,String> tweets, Map<String,String> posts)
		{
			Integer firstValue = Integer.parseInt(tweets.get("retweets"));
			Integer secondValue = Integer.parseInt(posts.get("shares"));
			return secondValue.compareTo(firstValue);
		}
	}
	
	class RetweetComparator implements Comparator<Map<String, String>>
	{
	    private final String key;

	    public RetweetComparator(String key)
	    {
	        this.key = key;
	    }

	    public int compare(Map<String, String> first, Map<String, String> second)
	    {
	        Integer firstValue = Integer.parseInt(first.get(key));
	        Integer secondValue = Integer.parseInt(second.get(key));
	        return secondValue.compareTo(firstValue);
	    }
	}

}
