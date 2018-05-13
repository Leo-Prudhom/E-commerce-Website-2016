

<link href="../assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
	
	<h1>Administration connexion</h1>
	<form action="" method="POST">
		<label for="pseudo">Pseudo</label> : <input type="text" name="pseudo" /><br />
		<label for="password">Mot de passe</label> : <input type="password" name="password" /><br />
		<input type="submit" name="envoyer" />
	</form>


<?php
session_start();
	
	$user = "user";
	$mdp = "password";

	if(isset($_POST["envoyer"]))
	{

		$pseudo = $_POST['pseudo'];
		$password = $_POST['password'];

		if(!empty($pseudo && $password))
		{

			if ($pseudo==$user && $password==$mdp) 
			{
				$_SESSION['pseudo'] = $pseudo;

				header('Location: admin.php');
			}
			
			else
			{
				echo "pseudo ou mdp incorrect";
			}

		}
		else
		{
			echo "Veuillez remplir les champs";
		}
		
	}
?>

