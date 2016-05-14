<html>
<head>
<link rel='stylesheet' href='css/bootstrap.min.css'>
<script type='text/javascript' src='js/jquery-2.2.3.min.js'></script>
<script type='text/javascript' src='js/bootstrap.min.js'></script>
<script>
	$(function() {
	    $('.navbar-nav').click(function() {
			alert(this.siblings);
			$( this ).addClass( 'active' ).siblings().removeClass( 'active' );
	    });
	 });
</script>
</head>
<body>
	<nav class="nav navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">SpaceGeek</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav" id="navList">
        			<li class="active"><a href="spaceX">SpaceX</a></li>
        			<li><a href="nasa">NASA</a></li>
        			<li><a href="jpl">JPL</a></li>
        			<li><a href="esa">ESA</a></li>
   				</ul>
			</div>	
		</div>
	</nav>
</body>
</html>