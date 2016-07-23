package com.spacegeek.configuration;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.FacebookFactory;
import facebook4j.Photo;
import facebook4j.Post;
import facebook4j.Reading;
import facebook4j.ResponseList;
import facebook4j.User;
import facebook4j.auth.AccessToken;

@Controller
public class FacebookHandler {
	
	private static Facebook facebook = new FacebookFactory().getInstance();
	public final String ESA_ID = "54912575666";
	public final String ISS_ID = "168170833215856";
	public final String NASAJPL_ID = "8261258923";
	public final String NASA_ID = "54971236771";
	public final String SPACEX_ID = "353851465130";
	
	public static final String FB_APP_ID = "282870535397392";
	public static final String FB_APP_SECRET = "e99885f82abc6fd7c746dc098ef39a27";
	public static final String REDIRECT_URI = "http://local.host:8080/spacegeek";
	public static AccessToken accessToken = null;
	public static String code = "";
	public static Boolean isAuthenticated = false;
	
	private static Pattern pattern = Pattern.compile("http[s]?://\\S+");
	private static Matcher matcher;
	
	public FacebookHandler() {
	}
	
	//Method to hit Facebook login URL and get OAuth code.
	@RequestMapping("/facebookLogin")
	public String facebookLogin(HttpServletRequest request, HttpServletResponse response) {
		facebook.setOAuthAppId(FB_APP_ID, FB_APP_SECRET);
		facebook.setOAuthPermissions("user_likes, user_photos, user_subscriptions, user_status, user_videos");
		String redirectUrl = request.getScheme() + "://www.facebook.com/dialog/oauth?client_id=" + FB_APP_ID + "&redirect_uri=" + REDIRECT_URI;
		return "redirect:" + redirectUrl;
	}
	
	public static void getAccessToken() {
		if (code != null) {
			try {
				accessToken = facebook.getOAuthAccessToken(code, "http://local.host:8080/spacegeek");
				isAuthenticated = true;
			} catch (FacebookException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static ArrayList<Map<String,String>> getUserFeed(String userId) throws FacebookException {
		ResponseList<Post> feeds = facebook.getPosts(userId, new Reading().limit(25).fields("likes, comments, shares, source, object_id, created_time, link, message, type, picture"));
		ArrayList<Map<String,String>> fbStories = new ArrayList<Map<String,String>>();
		User user = facebook.getUser(userId);
		Map<String,String> story;
		for (Post post : feeds) {
			story = new HashMap<String,String>();
			story.put("type", "fb");
			story.put("id", post.getId());
			story.put("ts", post.getCreatedTime().toString());
			story.put("user", user.getName());
			story.put("text", post.getMessage());
			if (post.getSharesCount() != null) {
				story.put("shares", post.getSharesCount().toString());
			} else {
				story.put("shares", "0");
			}
			if (post.getMessage() != null && post.getMessage().contains("http")) {
				matcher = pattern.matcher(post.getMessage());
				if (matcher.find()) {
					story.put("text", post.getMessage().replaceAll(matcher.group(), "<a target=\"_blank\" href=\"" + matcher.group() + "\">" + matcher.group() + "</a>"));
				}
			}
			if (post.getType() != null) {
				if (post.getType().equals("photo")) {
					String objId = post.getObjectId();
					Photo photo = facebook.getPhoto(objId, new Reading().limit(1).fields("link, picture, source"));
					String photoLink = photo.getSource().toString();
					story.put("imgUrl", photoLink);
					
				} else if (post.getType().equals("video")) {
					story.put("videoSource", post.getSource().toString());
				}
			}
			fbStories.add(story);
		}
		return fbStories;
	}
	
	public ResponseList<Post> getPublicPosts(String query) throws FacebookException {
		return facebook.searchPosts(query);
	}
	
	public static String getUserId(String username) throws FacebookException {
		return facebook.getUsers(username).get(0).getUsername();
	}

}
