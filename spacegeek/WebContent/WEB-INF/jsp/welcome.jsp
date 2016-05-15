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
	<h3>${message}</h3>
</body>
</html>