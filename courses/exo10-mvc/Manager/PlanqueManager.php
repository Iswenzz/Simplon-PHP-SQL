<?php

require './Manager/DBManager.php';
require './Model/Planque.php';

class PlanqueManager extends DBManager
{
	public function getAll()
	{
		$result = [];
		$stmt = $this->getConnexion()->query('SELECT * FROM Planque');

		while ($row = $stmt->fetch()) {
			$planque = new Planque();
			$planque->setAdresse($row['adressePlanque']);
			$planque->setCode($row["code"]);

			$result[] = $planque;
		}

		return $result;
	}

	public function add(Planque $planque)
	{
		$stmt = $this->getConnexion()->prepare("INSERT INTO Planque (adressePlanque) VALUES (:adresse)");
		$stmt->execute([
			"adresse" => $planque->getAdresse()
		]);
	}

	public function delete(string $code)
	{
		$stmt = $this->getConnexion()->prepare("DELETE FROM Planque WHERE code = :code");
		$stmt->execute([
			"code" => $code
		]);
	}

	public function update(Planque $planque)
	{
		$stmt = $this->getConnexion()->prepare("UPDATE Planque SET adressePlanque = :adresse WHERE code = :code");
		$stmt->execute([
			"adresse" => $planque->getAdresse(),
			"code" => $planque->getCode()
		]);
	}
}
