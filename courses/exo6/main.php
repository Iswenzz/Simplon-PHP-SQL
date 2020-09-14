<?php

class Database
{
	private ?PDO $DB = null;

	public function __construct(string $db = "Iswenzz", string $user, string $password)
	{	
		try
		{
			$this->DB = new PDO("mysql:host=localhost;dbname=$db;port=3306;charset=utf8mb4", $user, $password);
		
			print_r("DB Connected!");
		}
		catch (PDOException $e)
		{
			throw new PDOException($e->getMessage());
		}
	}

	public function Fetch(string $table): Array
	{
		$req = $this->DB->query("SELECT * from $table");
		return $req->fetchAll(PDO::FETCH_ASSOC);
	}
}

$DB = new Database("catalogue_edirol", "iswenzz", "rootpassword");
var_dump($DB->Fetch("produit"));