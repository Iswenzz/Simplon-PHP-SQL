<?php

$password = htmlspecialchars($_GET["password"] ?? "");
if ($password === "toto")
	header("Location: test.php");
else
	echo "Wrong Login";