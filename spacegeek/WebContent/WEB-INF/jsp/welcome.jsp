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
<script>
	$(document).ready(function() {
		$('.img-responsive').on('click', function(e) {
		    $("#modal-img").attr("src", this.src);
		    $("#img-link").attr("href", this.src);
		    $('#imgModal').modal('show');
		});
	});
</script>
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
						<button id="toggleImages" class="btn btn-default btn-sm" type="submit">Show/Hide images</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="imgModal" class="modal fade">
		<div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body">
	                <a href="" target="_blank" id="img-link"><img id="modal-img" class="img-responsive" src=""></a>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="container-fluid">
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
	</div>
</body>
</html>