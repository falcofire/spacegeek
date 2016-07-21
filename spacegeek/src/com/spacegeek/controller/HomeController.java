package com.spacegeek.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spacegeek.configuration.FacebookHandler;
import com.spacegeek.configuration.TwitterHandler;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<String> accounts = new ArrayList<String>();
		accounts.add("from:spacex");
		accounts.add("from:Space_Station");
		accounts.add("from:NASA");
		accounts.add("from:NASAJPL");
		accounts.add("from:esa");
		
		TwitterHandler twitter = new TwitterHandler();
		
		//Get the Facebook auth code from the request.
		String code = request.getParameter("code");
		if (code != null) {
			FacebookHandler.code = code;
			FacebookHandler.getAccessToken();
		}
		
		//Get top stories for the frontpage.
		ArrayList<Map<String,String>> topStories = TwitterHandler.getTopStories(accounts);

		//Check for authentication.
		if (FacebookHandler.isAuthenticated) {
			return new ModelAndView("index", "topStories", topStories);
		}
		else {
			return new ModelAndView("redirect:/facebookLogin");
		}
	}
}
