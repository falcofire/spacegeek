<html>
<head>
<%@include file="/WEB-INF/jsp/meta.jsp" %>
<title>SpaceGeek</title>
</head>
<body background="${pageContext.request.contextPath}/images/space.jpg" style="background-size:100% 100%; background-attachment:fixed;" />
	<br>
	<div class="spacegeek-main">
		<div style="text-align:center">
			<h2>
				<font color="white">Top Stories</font><br> <br>
			</h2>
			<%@include file="/WEB-INF/jsp/imgModal.jsp" %>
			<div class="container-fluid">
				<div class="jumbotron topStories">
					<div class="container-fluid">
						<div class="row-fluid">
							<table class="table table-bordered" style="display:inline; overflow-x:scroll;">
								<c:forEach var="t" items="${topStories}" varStatus="status">
									<div class="col-md-3 col-md-offset-0">
										<div class="feedElement">
											<div class="container-fluid">
												<b>${t.user}</b> - ${t.ts } - RT: <b>${t.retweets}x</b>
												<p>${t.text}</p>
												<c:if test="${not empty t.imgUrl }">
													<div class="text-center">
														<div id="${status.index}">
															<img src="${t.imgUrl}" class="img-responsive">
														</div>
													</div>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>