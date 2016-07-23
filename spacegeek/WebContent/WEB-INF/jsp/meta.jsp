<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel='stylesheet' href='css/bootstrap.min.css'>
<link rel='stylesheet' href='css/bootstrap-theme.min.css'>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/spacegeek.css'>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico" />
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
    	$('.img-responsive').on('click', function(e) {
		    $("#modal-img").attr("src", this.src);
		    $("#img-link").attr("href", this.src);
		    $('#imgModal').modal('show');
		});
    	$('.videoLink').on('click', function(e)	{
    		$('#video').attr("src", this.id);
    		$('#vidModal').modal('show');
    	});
    	$("#vidModal").on('hidden.bs.modal', function (e) {
    		alert('closed!');
    	    $("#vidModal iframe").attr("src", $("#vidModal iframe").attr("src"));
    	});
    	$('#allFilter, #fbFilter, #twitterFilter').on('click', function(e) {
    		var checked = $(this).is(':checked');
    		var filter = $(this).attr('id');
			var posts = document.getElementsByClassName("feedElement");
    		if (filter == "allFilter" && checked) {
    			$('#fbFilter').prop('checked', true);
        		$('#fbFilter').attr('disabled', true);
        		$('#twitterFilter').prop('checked', true);
        		$('#twitterFilter').attr('disabled', true);
        		filter = "all";
        		for (i=0; i<posts.length; i++) {
    				$(posts[i]).show();
    			}
    		} else if (filter == "allFilter") {
    			$('#fbFilter').prop('checked', false);
        		$('#fbFilter').attr('disabled', false);
        		$('#twitterFilter').prop('checked', false);
        		$('#twitterFilter').attr('disabled', false);
        		filter = null;
    		} 
    		//Facebook filter only
    		else if ($('#fbFilter').is(':checked') && !$('#twitterFilter').is(':checked')) {
    			if (checked) {
    				$('#allFilter').prop('checked', false);
    			}
    			var i = 0;
    			if (checked) {}
    			for (i=0; i<posts.length; i++) {
    				if ($(posts[i]).attr('name') != "fb") {
    					$(posts[i]).hide();
    				} else {
    					$(posts[i]).show();
    				}
    			}
   			} 
    		//Twitter filter only
    		else if ($('#twitterFilter').is(':checked') && !$('#fbFilter').is(':checked')) {
   				if (checked) {
    				$('#allFilter').prop('checked', false);
    			}
    			var i = 0;
    			for (i=0; i<posts.length; i++) {
    				if ($(posts[i]).attr('name') != "tweet") {
    					$(posts[i]).hide();
    				} else {
    					$(posts[i]).show();
    				}
    			}
   			}
    		//All feeds checked
    		else if ($('#twitterFilter').is(':checked') && $('#fbFilter').is(':checked')) {
    			$('#allFilter').prop('checked', true);
    			$('#allFilter').attr('disabled', false);
    			$('#fbFilter').attr('disabled', true);
    			$('#twitterFilter').attr('disabled', true);
    			for (i=0; i<posts.length; i++) {
    				$(posts[i]).show();
    			}
    		}
    		//No feeds checked
    		else if (!$('#fbFilter').is(':checked') && !$('#twitterFilter').is(':checked')) {
    			$('#allFilter').prop('checked', true);
    			for (i=0; i<posts.length; i++) {
    				$(posts[i]).show();
    			}
    		}
    		
    	});
	})
</script>
</head>
<body>
	<nav class="nav navbar-default navbar-fixed-top">
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
	      			<li role="presentation"><a href="iss">ISS</a></li>
	      			<li role="presentation"><a href="nasa">NASA</a></li>
	      			<li role="presentation"><a href="jpl">JPL</a></li>
	      			<li role="presentation"><a href="esa">ESA</a></li>
	      		</ul>
	      	</div>
		</div>
	</nav>
</body>
</html>