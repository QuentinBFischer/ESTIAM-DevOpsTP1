<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
	<head>
		<title>QBF - DevOps TP 1</title>
	</head>

	<script type="text/javascript">
		$( document ).ready(function() {
		    console.log( "ready!" );
		    select();
		});
	</script>

	<body>
		<button onclick="select();">SELECT</button>
		<br><br>
		<div id="select"></div>
		<br>
		<button onclick="update();">UPDATE</button>
		<br>(Random data)
		<div id="error"></div>
		<script type="text/javascript">
			function select() {
				console.log("select");
				$.ajax({
					type : 'POST',
				    url : 'select.php',
				    success : function(data) {
				    	console.log("select success");
				    	$("#select").empty();
				    	$("#select").html(data);
				    },
				    error : function(request,error)
				    {
				        $("#select").html("Request: "+JSON.stringify(request));
				    }
				});
			}

			function update() {
				console.log("update");
				$.ajax({
					type : 'POST',
				    url : 'update.php',
				    success : function(data) {
				    	console.log("update success");
				    },
				    error : function(request,error)
				    {
				        $("#error").html("Request: "+JSON.stringify(request));
				    }
				});
			}
	</script>
	</body>
</html>