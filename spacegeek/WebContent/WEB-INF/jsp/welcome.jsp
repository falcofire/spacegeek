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
					<br>
					<button class="btn btn-default btn-sm" type="submit" onclick='toggleImages();'>Show/Hide images</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<c:forEach var="t" items="${tweets}" varStatus="status" end="${fn:length(tweets)}" step="3">
			<div class="row">
				<div class="col-md-4 col-md-offset-0">
					<div class="feedElement">
						<b>${tweets[status.index].user}</b> ${tweets[status.index].text}
						<br>
						<c:if test="${not empty tweets[status.index].imgUrl }">
							<div class="text-center">
								<a data-toggle="collapse" data-target="${ '#' += status.index}">${tweets[status.index].imgUrl}</a>
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
						<b>${tweets[status.index+1].user}</b> ${tweets[status.index+1].text}
						<br>
						<c:if test="${not empty tweets[status.index+1].imgUrl }">
							<div class="text-center">
								<a data-toggle="collapse" data-target="${ '#' += status.index+1}">${tweets[status.index+1].imgUrl}</a>
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
						<b>${tweets[status.index+2].user}</b> ${tweets[status.index+2].text}
						<br>
						<c:if test="${not empty tweets[status.index+2].imgUrl }">
							<div class="text-center">
								<a data-toggle="collapse" data-target="${ '#' += status.index+2}">${tweets[status.index+2].imgUrl}</a>
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
	</div>
</body>
</html>