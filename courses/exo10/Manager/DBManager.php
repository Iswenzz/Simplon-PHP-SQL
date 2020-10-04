<?php

class DBManager {
	private $connexion;

	public function __construct()
	{
		$this->connexion = new PDO("mysql:host=localhost;dbname=test;port=3306;charset=utf8mb4", "root", "rootpassword");
	}

	public function getConnexion() {
		return $this->connexion;
	}
}
