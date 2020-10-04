<?php 
	// FORM CONTROLS
	require './Manager/PlanqueManager.php';

	$planqueManager = new PlanqueManager();

	// CODE AJOUT
	if (isset($_POST["addAdresse"])) {
		$planque = new Planque();
		$planque->setAdresse($_POST["addAdresse"]);
		$planqueManager->add($planque);
	}

	// CODE DELETE
	if (isset($_POST["deleteCode"])) {
		$planqueManager->delete($_POST["deleteCode"]);
	}

	// CODE UPDATE
	if (isset($_POST["updateCode"])) {
		$planque = new Planque();
		$planque->setCode($_POST["updateCode"]);
		$planque->setAdresse($_POST["updateAdresse"]);
		$planqueManager->update($planque);
	}

	// GET ALL
	$planques = $planqueManager->getAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	<h3>Add</h3>
	<form action="index.php" method="POST">
		<label for="addAdresse">Adresse</label>
		<input id="addAdresse" type="text" name="addAdresse" autocomplete="off" required>
		<button id="valider" type="submit">Add</button>
	</form>

	<h3>Update</h3>
	<form action="index.php" method="POST">
		<label for="updateCode">Code</label>
		<input id="updateCode" type="text" name="updateCode" autocomplete="off" required>
		<label for="updateAdresse">Adresse</label>
		<input id="updateAdresse" type="text" name="updateAdresse" autocomplete="off" required>
		<button id="valider" type="submit">Update</button>
	</form>
	
	<h3>Delete</h3>
	<form action="index.php" method="POST">
		<label for="deleteCode">Code</label>
		<input id="deleteCode" type="text" name="deleteCode" autocomplete="off" required>
		<button id="valider" type="submit">Delete</button>
	</form>

	<table border="1">
		<thead>
			<tr>
				<th>Adresse</th>
			</tr>
		</thead>
		<tbody>
			<?php
				foreach ($planques as $planque) {
			?>
				<tr>
					<td>
						<p><?= $planque->getAdresse(); ?></p>
						<button id="planqueButton" data-code=<?= $planque->getCode(); ?>>X</button>
					</td>
				</tr>
			<?php
				}
			?>
		</tbody>
	</table>
</body>
<script>
	// AJAX VERSION

	// ES6
	const deletePlanqueES6 = (button) => {
		// delete from database
		fetch("delete.php", {
			method: "POST",
			body: JSON.stringify({
				"code": button.target.getAttribute("data-code")
			})
		}).then(r => console.log(r));
		// remove html element
		button.target.parentNode.remove();
	}

	// ES5
	function deletePlanqueES5() {
		// delete from database
		fetch("delete.php", {
			method: "POST",
			body: {
				code: this.getAttribute("data-code")
			}
		}).then(r => console.log(r));
		// remove html element
		this.parentNode.remove();
	}

	const planqueButtons = document.querySelectorAll("#planqueButton");
	for (const button of planqueButtons) {
		button.addEventListener("click", deletePlanqueES6.bind(button));
	}
</script>
</html>