<html>
<head>
<%@include file="/WEB-INF/jsp/meta.jsp" %>
<title>${title}</title>
<style type="text/javascript">
	$(document).ready(function() {
    	$('ul.nav.navbar-nav').find('a[href="' + location.pathname + '"]')
        .closest('li').addClass('active');
	});
</style>
</head>
<body background="${pageContext.request.contextPath}/images/space.jpg" style="background-size:100% 100%; background-attachment:fixed;" />
	<div class="container-fluid">
		<div class="pull-left">
			<h3><font color="white">${account} feed</font></h3>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
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
						<button id="toggleImages" class="btn btn-default btn-sm" type="submit">Show/Hide images</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/jsp/imgModal.jsp" %>
	<div class="container">
		<c:choose>
			<c:when test="${tweets[0] != null}">
				<table class="table table-bordered">
					<c:forEach var="t" items="${tweets}" varStatus="status" end="${fn:length(tweets)}" step="3">
						<div class="row">
							<c:if test="${tweets[status.index] != null}">
								<div class="col-md-4 col-md-offset-0">
									<div class="container-fluid">
										<div class="feedElement">
											<b>${tweets[status.index].user}</b> - ${tweets[status.index].ts } - RT: <b>${tweets[status.index].retweets}x</b>
											<p>${tweets[status.index].text}</p>
											<c:if test="${not empty tweets[status.index].imgUrl }">
												<div class="text-center">
													<a data-toggle="collapse" data-target="${ '#' += status.index}">Image [+/-]</a>
													<div id="${status.index}" class="collapse out">
														<img src="${tweets[status.index].imgUrl}" class="img-responsive">
														<br>
													</div>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${tweets[status.index+1] != null}">
								<div class="col-md-4 col-md-offset-0">
									<div class="container-fluid">
										<div class="feedElement">
											<b>${tweets[status.index+1].user}</b> - ${tweets[status.index+1].ts }  - RT: <b>${tweets[status.index+1].retweets}x</b>
											<p>${tweets[status.index+1].text}</p>
											<c:if test="${not empty tweets[status.index+1].imgUrl }">
												<div class="text-center">
													<a data-toggle="collapse" data-target="${ '#' += status.index+1}">Image [+/-]</a>
													<div id="${status.index+1}" class="collapse out">
														<img src="${tweets[status.index+1].imgUrl}" class="img-responsive">
														<br>
													</div>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${tweets[status.index+2] != null}">
								<div class="col-md-4 col-md-offset-0">
									<div class="container-fluid">
										<div class="feedElement">
											<b>${tweets[status.index+2].user}</b> - ${tweets[status.index+2].ts } - RT: <b>${tweets[status.index+2].retweets}x</b>
											<p>${tweets[status.index+2].text}</p>
											<c:if test="${not empty tweets[status.index+2].imgUrl }">
												<div class="text-center">
													<a data-toggle="collapse" data-target="${ '#' += status.index+2}">Image [+/-]</a>
													<div id="${status.index+2}" class="collapse out">
														<img src="${tweets[status.index+2].imgUrl}" class="img-responsive">
														<br>
													</div>
												</div>
											</c:if>
										</div>
									</div>  
								</div>
							</c:if>
							<br>
						</div>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<div class="outer">
					<div class="middle">
						<div class="inner">
							<div class="jumbotron">
								<center><h3>${account} has not posted content in the last 7 days</h3></center>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>