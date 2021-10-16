<?php

function uploadFile(): void
{
	$file = $_FILES["upload"];
	$target_dir = "./uploads/";
	$target_file = $target_dir . basename($file["name"]);
	$type = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

	if ($file["error"])
	{
		echo "There was an error during the upload.";
		return;
	}
	if ($file["size"] / 1024 > 5000) // 5MB
	{
		echo "The file size must be below 5MB!";
		return;
	}
	if ($type === "jpg" || $type === "png" || $type === "gif" || $type === "webp")
	{
		move_uploaded_file($file["tmp_name"], $target_file);
		echo "<img src=\"$target_file\" alt=\"uploaded file\">";
	}
	else
		echo "Wrong file type $type";
}
uploadFile();