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
						<span class="dropdown">
							<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    Sort / Filter <span class="caret"></span>
						  	</button>
						  	<ul class="dropdown-menu">
						  		<li class="dropdown-header"><b>Sort</b></li>
							    <li role="separator" class="divider"></li>
						    	<li><a href="${requestScope['javax.servlet.forward.request_uri']}?sort=recent">
						    		<c:choose>
							    		<c:when test="${param.sort == 'recent' or param.sort == null}">
							    			<font style="font-weight:bold;">Most Recent</font>
							    		</c:when>
							    		<c:otherwise>
							    			Most Recent
							    		</c:otherwise>
						    		</c:choose>
					    		</a></li>
							    <li><a href="${requestScope['javax.servlet.forward.request_uri']}?sort=popular">
							    	<c:choose>
							    		<c:when test="${param.sort == 'popular'}">
							    			<font style="font-weight:bold;">Most Popular</font>
							    		</c:when>
							    		<c:otherwise>
							    			Most Popular
							    		</c:otherwise>
						    		</c:choose>
							    </a><br/></li>
							    <li class="dropdown-header"><b>Filter</b></li>
							    <li role="separator" class="divider"></li>
							    <div id="mediaFilters" class="mediaFilters">
							    	<li style="padding-left:10px;"><input type="checkbox" id="allFilter"/>&nbsp;All</li>
							    	<li style="padding-left:10px;"><input type="checkbox" id="fbFilter"/>&nbsp;Facebook</li>
							    	<li style="padding-left:10px;"><input type="checkbox" id="twitterFilter"/>&nbsp;Twitter<br/></li>
							    </div>
						  	</ul>
					  	</span>
						<button id="toggleImages" class="btn btn-default btn-sm" type="submit" style="float:right;">Show/Hide images</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/jsp/imgModal.jsp" %>
	<%@include file="/WEB-INF/jsp/vidModal.jsp" %>
	<div class="container">
		<c:choose>
			<c:when test="${posts[0] != null}">
				<table class="table table-bordered">
					<c:forEach var="t" items="${posts}" varStatus="status" end="${fn:length(posts)}" step="3">
						<div class="row">
							<c:if test="${posts[status.index] != null}">
								<div class="col-md-4 col-md-offset-0">
									<div class="container-fluid">
										<div class="feedElement" name="${posts[status.index].type}">
											<b>${posts[status.index].user}</b> - ${posts[status.index].ts } 
											<c:choose>
												<c:when test="${posts[status.index].type == 'tweet'}">
												<br/>
												RT: <b>${posts[status.index].retweets}x</b></c:when>
												<c:when test="${posts[status.index].type == 'fb'}">
												<br/>
												Shares: <b>${posts[status.index].shares}</b></c:when>
											</c:choose>
											<p>${posts[status.index].text}</p>
											<c:if test="${not empty posts[status.index].imgUrl }">
												<div class="text-center">
													<a data-toggle="collapse" data-target="${ '#' += status.index}">Image [+/-]</a>
													<div id="${status.index}" class="collapse out">
														<img src="${posts[status.index].imgUrl}" class="img-responsive">
														<br>
													</div>
												</div>
											</c:if>
											<c:if test="${not empty posts[status.index].videoSource}">
												<div class="text-center">
													<a href="#" class="videoLink" id="${posts[status.index].videoSource}">Video [+/-]</a>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${posts[status.index+1] != null}">
								<div class="col-md-4 col-md-offset-0">
									<div class="container-fluid">
										<div class="feedElement" name="${posts[status.index+1].type}">
											<b>${posts[status.index+1].user}</b> - ${posts[status.index+1].ts } 
											<c:choose>
												<c:when test="${posts[status.index+1].type == 'tweet'}">
												<br/>
												RT: <b>${posts[status.index+1].retweets}x</b></c:when>
												<c:when test="${posts[status.index+1].type == 'fb'}">
												<br/>
												Shares: <b>${posts[status.index+1].shares}</b></c:when>
											</c:choose>
											<p>${posts[status.index+1].text}</p>
											<c:if test="${not empty posts[status.index+1].imgUrl }">
												<div class="text-center">
													<a data-toggle="collapse" data-target="${ '#' += status.index+1}">Image [+/-]</a>
													<div id="${status.index+1}" class="collapse out">
														<img src="${posts[status.index+1].imgUrl}" class="img-responsive">
														<br>
													</div>
												</div>
											</c:if>
											<c:if test="${not empty posts[status.index+1].videoSource}">
												<div class="text-center">
													<a href="#" class="videoLink" id="${posts[status.index+1].videoSource}">Video [+/-]</a>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${posts[status.index+2] != null}">
								<div class="col-md-4 col-md-offset-0">
									<div class="container-fluid">
										<div class="feedElement" name="${posts[status.index+2].type}">
											<b>${posts[status.index+2].user}</b> - ${posts[status.index+2].ts } 
											<c:choose>
												<c:when test="${posts[status.index+2].type == 'tweet'}">
												<br/>
												RT: <b>${posts[status.index+2].retweets}x</b></c:when>
												<c:when test="${posts[status.index+2].type == 'fb'}">
												<br/>
												Shares: <b>${posts[status.index+2].shares}</b></c:when>
											</c:choose>
											<p>${posts[status.index+2].text}</p>
											<c:if test="${not empty posts[status.index+2].imgUrl }">
												<div class="text-center">
													<a data-toggle="collapse" data-target="${ '#' += status.index+2}">Image [+/-]</a>
													<div id="${status.index+2}" class="collapse out">
														<img src="${posts[status.index+2].imgUrl}" class="img-responsive">
														<br>
													</div>
												</div>
											</c:if>
											<c:if test="${not empty posts[status.index+2].videoSource}">
												<div class="text-center">
													<a href="#" class="videoLink" id="${posts[status.index+2].videoSource}">Video [+/-]</a>
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