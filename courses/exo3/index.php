<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	<form action="index.php" method="post" enctype="multipart/form-data">
		<h5>Select file to upload:</h5>
		<input type="file" name="upload" id="upload">
		<button type="submit">Upload</button>
	</form>

	<?php include_once("upload.php"); ?>
</body>
</html>