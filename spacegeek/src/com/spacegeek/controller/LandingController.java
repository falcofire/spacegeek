package com.spacegeek.controller;

import com.spacegeek.configuration.TwitterHandler;

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
	
	@RequestMapping("/welcome")
	public ModelAndView helloWorld() {
 
		String message = "<br><div style='text-align:center;'>"
				+ "<h3>********** Hello World, Spring MVC Tutorial</h3>This message is coming from LandingController .java **********</div><br><br>";
		return new ModelAndView("welcome", "account", message);
	}
	
	@RequestMapping("/esa")
	public ModelAndView esa(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String account = "ESA";
		ArrayList<Map<String,String>> tweets = TwitterHandler.getStories("from:esa");
		session.setAttribute("tweets", tweets);
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
		ArrayList<Map<String,String>> tweets = TwitterHandler.getStories("from:Space_Station");
		session.setAttribute("tweets", tweets);
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
		ArrayList<Map<String,String>> tweets = TwitterHandler.getStories("from:NASAJPL");
		session.setAttribute("tweets", tweets);
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
		ArrayList<Map<String,String>> tweets = new ArrayList<Map<String,String>>();
		tweets = TwitterHandler.getStories("from:NASA");
		session.removeAttribute("tweets");
		session.setAttribute("tweets", tweets);
		session.setAttribute("title", "NASA");
		session.setAttribute("background", "nasa.png");
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
	
	@RequestMapping("/spaceX")
	public ModelAndView spaceX(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		String account = "SpaceX";
		ArrayList<Map<String,String>> tweets = TwitterHandler.getStories("from:spacex");
		session.setAttribute("tweets", tweets);
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