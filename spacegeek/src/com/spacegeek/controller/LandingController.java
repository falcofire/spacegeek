package com.spacegeek.controller;

import com.spacegeek.configuration.FacebookHandler;
import com.spacegeek.configuration.StoryAggregator;
import com.spacegeek.controller.AggregateSorter;

import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
/*
 * author: spacegeek.com
 * 
 */
 
@Controller
public class LandingController {
	
	AggregateSorter aggSort = new AggregateSorter();
	FacebookHandler fHandler = new FacebookHandler();
	StoryAggregator storyAgg = new StoryAggregator();
	
	@RequestMapping("/esa")
	public ModelAndView esa(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String account = "ESA";
		ArrayList<Map<String,String>> posts = new ArrayList<Map<String,String>>();
		posts = storyAgg.getCombinedStories("esa");
		session.setAttribute("posts", posts);
		session.setAttribute("title", "ESA");
		session.setAttribute("background", "esa.jpg");
		String sortType = (String) request.getParameter("sort");
		if (sortType != null) {
			TweetSorter tS = new TweetSorter();
			if (sortType.equals("recent")) {
				tS.sortRecent(request, response);
			}
			else if (sortType.equals("retweet")) {
				tS.sortRetweet(request, response);
			}
		}
		return new ModelAndView("welcome", "account", account);
	}
	
	@RequestMapping("/iss")
	public ModelAndView iss(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String account = "ISS";
		ArrayList<Map<String,String>> posts = new ArrayList<Map<String,String>>();
		posts = storyAgg.getCombinedStories("iss");
		session.setAttribute("posts", posts);
		session.setAttribute("title", "ISS");
		String sortType = (String) request.getParameter("sort");
		if (sortType != null) {
			TweetSorter tS = new TweetSorter();
			if (sortType.equals("recent")) {
				tS.sortRecent(request, response);
			}
			else if (sortType.equals("retweet")) {
				tS.sortRetweet(request, response);
			}
		}
		return new ModelAndView("welcome", "account", account);
	}
	
	@RequestMapping("/jpl")
	public ModelAndView jpl(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String account = "JPL";
		ArrayList<Map<String,String>> posts = new ArrayList<Map<String,String>>();
		posts = storyAgg.getCombinedStories("NASAJPL");
		session.setAttribute("posts", posts);
		session.setAttribute("title", "JPL");
		session.setAttribute("background", "jpl.jpg");
		String sortType = (String) request.getParameter("sort");
		if (sortType != null) {
			TweetSorter tS = new TweetSorter();
			if (sortType.equals("recent")) {
				tS.sortRecent(request, response);
			}
			else if (sortType.equals("retweet")) {
				tS.sortRetweet(request, response);
			}
		}
		return new ModelAndView("welcome", "account", account);
	}
	
	@RequestMapping("/nasa")
	public ModelAndView nasa(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String account = "NASA";
		ArrayList<Map<String,String>> posts = new ArrayList<Map<String,String>>();
		posts = storyAgg.getCombinedStories("nasa");
		session.removeAttribute("posts");
		session.setAttribute("posts", posts);
		session.setAttribute("title", "NASA");
		session.setAttribute("background", "nasa.png");
		String sortType = (String) request.getParameter("sort");
		if (sortType != null) {
			TweetSorter tS = new TweetSorter();
			if (sortType.equals("recent")) {
				aggSort.sortRecent(request, response);
			}
			else if (sortType.equals("retweet")) {
				tS.sortRetweet(request, response);
			}
		}
		return new ModelAndView("welcome", "account", account);
	}
	
	@RequestMapping("/spaceX")
	public ModelAndView spaceX(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String account = "SpaceX";
		ArrayList<Map<String,String>> posts = new ArrayList<Map<String,String>>();
		posts = storyAgg.getCombinedStories("spacex");
		session.setAttribute("posts", posts);
		session.setAttribute("title", "SpaceX");
		session.setAttribute("background", "spacex.jpg");
		String sortType = (String) request.getParameter("sort");
		if (sortType != null) {
			TweetSorter tS = new TweetSorter();
			if (sortType.equals("recent")) {
				tS.sortRecent(request, response);
			}
			else if (sortType.equals("retweet")) {
				tS.sortRetweet(request, response);
			}
		}
		return new ModelAndView("welcome", "account", account);
	}
}