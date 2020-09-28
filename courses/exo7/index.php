<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="Description" content="Enter your description here"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<title>Login Page</title>
</head>
<body class="d-flex justify-content-center align-items-center" style="width: 100vw; height: 100vh;">
	<form class="container mx-auto" style="max-width: 30vw" action="login.php" method="POST">
		<div class="my-2 form-group">
			<label for="exampleInputEmail1">Email address</label>
			<input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
		</div>
		<div class="my-2 form-group">
			<label for="exampleInputPassword1">Password</label>
			<input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
		</div>
		<div class="my-3 form-check">
			<input name="remember" type="checkbox" class="form-check-input" id="exampleCheck1">
			<label class="form-check-label" for="exampleCheck1">Check me out</label>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
		<?php
			if (isset($_COOKIE["logindrop"]))
				print_r($_COOKIE["logindrop"]); 
		?>
	</form>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
</html>