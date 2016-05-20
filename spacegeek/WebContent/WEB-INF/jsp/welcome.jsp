<html>
<head>
<%@include file="/WEB-INF/jsp/meta.jsp" %>
<title>Spring MVC</title>
<style type="text/javascript">
	$(document).ready(function() {
    	$('ul.nav.navbar-nav').find('a[href="' + location.pathname + '"]')
        .closest('li').addClass('active');
	})
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="pull-left">
			<h3>${message}</h3>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="pull-right">
					<div class="btn-group">
						<br>
						<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    Sort By <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu">
						    <li><a href="${requestScope['javax.servlet.forward.request_uri']}?sort=recent">Most Recent</a></li>
						    <li><a href="${requestScope['javax.servlet.forward.request_uri']}?sort=retweet">Most Retweeted</a></li>
						  </ul>
						<button class="btn btn-default btn-sm" type="submit" onclick='toggleImages();'>Show/Hide images</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<table class="table table-bordered">
			<c:forEach var="t" items="${tweets}" varStatus="status" end="${fn:length(tweets)}" step="3">
				<div class="row">
					<div class="col-md-4 col-md-offset-0">
						<div class="feedElement">
							<b>${tweets[status.index].user}</b> - ${tweets[status.index].ts } - RT: <b>${tweets[status.index].retweets}x</b>
							<p>${tweets[status.index].text}</p>
							<c:if test="${not empty tweets[status.index].imgUrl }">
								<div class="text-center">
									<a data-toggle="collapse" data-target="${ '#' += status.index}">Image [+/-]</a>
									<div id="${status.index}" class="collapse out">
										<a target="_blank" href="${tweets[status.index].imgUrl}"><img src="${tweets[status.index].imgUrl}" class="img-responsive"></a>
										<br>
									</div>
								</div>
							</c:if>
						</div>
					</div>
					<div class="col-md-4 col-md-offset-0">
						<div class="feedElement">
							<b>${tweets[status.index+1].user}</b> - ${tweets[status.index+1].ts }  - RT: <b>${tweets[status.index+1].retweets}x</b>
							<p>${tweets[status.index+1].text}</p>
							<c:if test="${not empty tweets[status.index+1].imgUrl }">
								<div class="text-center">
									<a data-toggle="collapse" data-target="${ '#' += status.index+1}">Image [+/-]</a>
									<div id="${status.index+1}" class="collapse out">
										<a target="_blank" href="${tweets[status.index+1].imgUrl}"><img src="${tweets[status.index+1].imgUrl}" class="img-responsive"></a>
										<br>
									</div>
								</div>
							</c:if>
						</div>
					</div>
					<div class="col-md-4 col-md-offset-0"">
						<div class="feedElement">
							<b>${tweets[status.index+2].user}</b> - ${tweets[status.index+2].ts } - RT: <b>${tweets[status.index+2].retweets}x</b>
							<p>${tweets[status.index+2].text}</p>
							<c:if test="${not empty tweets[status.index+2].imgUrl }">
								<div class="text-center">
									<a data-toggle="collapse" data-target="${ '#' += status.index+2}">Image [+/-]</a>
									<div>
									</div>
									<div id="${status.index+2}" class="collapse out">
										<a target="_blank" href="${tweets[status.index+2].imgUrl}"><img src="${tweets[status.index+2].imgUrl}" class="img-responsive"></a>
										<br>
									</div>
								</div>
							</c:if>
						</div>
					</div>  
					<br>
				</div>
			</c:forEach>
		</table>
	</div>
</body>
</html>