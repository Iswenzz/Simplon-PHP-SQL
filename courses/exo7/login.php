<?php

function initDB(): PDO
{
	try
	{
		$DB = new PDO("mysql:host=localhost;dbname=cts;port=3306;charset=utf8mb4", "iswenzz", "rootpassword");
		print_r("PDO connection established <br>");
		return $DB;
	}
	catch (PDOException $e)
	{
		print_r("PDO connection failed <br>");
	}
	return null;
}

function dropUser(string $reason): void
{
	setcookie("logindrop", $reason, 0);
	header("Location: index.php");
}

$DB = initDB();

$inputEmail = $_POST["email"] ?? "";
$inputPassword = $_POST["password"] ?? "";

if (!$inputEmail || !$inputPassword)
	dropUser("Inputs are invalid.");

$stmt = $DB->prepare("SELECT mailAdmin, mdpAdmin from Admin WHERE mailAdmin = :mail");
$stmt->execute([
	"mail" => $inputEmail
]);

$row = $stmt->fetch();
if ($row)
{
	if (password_verify($inputPassword, $row["mdpAdmin"]))
	{
		session_start();
		$_SESSION["email"] = $inputEmail;
		header("Location: admin.php");
	}
	else
		dropUser("Wrong password!");
}
else
	dropUser("User not found!");
