<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel='stylesheet' href='css/bootstrap.min.css'>
<link rel='stylesheet' href='css/bootstrap-theme.min.css'>
<link rel='stylesheet' href='css/spacegeek.css'>
<script type='text/javascript' src='js/jquery-2.2.3.min.js'></script>
<script type='text/javascript' src='js/bootstrap.min.js'></script>
<script>
	$(document).ready(function() {
    	$('ul.nav.navbar-nav').find('a[href="' + location.pathname.replace('/spacegeek/', '') + '"]')
        .closest('li').addClass('active');
    	var toggle = "show";
    	$('#toggleImages').on('click', function() {
    		var imgDivs = document.getElementsByClassName('collapse out');
    		var imgArray = [];
    		var i = 0;
    		var j = 0;
    		for (i=0; i<imgDivs.length; i++) {
    			imgArray[i] = imgDivs[i];
    		}
   			for (i=0; i<imgArray.length; i++) {
    			$(imgArray[i]).collapse(toggle);
       		}
   			toggle = (toggle == "show") ? "hide" : "show";
    	});
	})
</script>
<script type="text/javascript">
	function toggleImages(action) {
		alert('action: ' + action);
		var toggleButton = document.getElementById('toggleImages');
		var imgDivs = document.getElementsByClassName('collapse out');
		var imgArray = [];
		var i;
		for (i=0; i<imgDivs.length; i++) {
			imgArray[i] = imgDivs[i];
		}
		for (i=0; i<imgArray.length; i++) {
			$(imgArray[i]).collapse(action);
		}
		if (action == "show") {
			alert('true');
			$("#toggleButton").attr('onclick', '');
		} else {
			$("#toggleButton").attr('onclick', '');
		}
	}
</script>
</head>
<body>
	<nav class="nav navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/spacegeek">SpaceGeek</a>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
		      	</button>
	      	</div>
	      	<div class="collapse navbar-collapse">
	      		<ul class="nav navbar-nav navbar-left">
	      			<li role="presentation"><a href="spaceX">SpaceX</a></li>
	      			<li role="presentation"><a href="nasa">NASA</a></li>
	      			<li role="presentation"><a href="jpl">JPL</a></li>
	      			<li role="presentation"><a href="esa">ESA</a></li>
	      		</ul>
	      	</div>
		</div>
	</nav>
</body>
</html>