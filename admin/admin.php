<link href="../assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>

<?php

session_start();

	//Connexion à la base de données
	try
		{
			$db = new PDO('mysql:host=localhost;dbname=site_e_commerce;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));

		}
	catch (Exception $e)
		{
		    die('Erreur : ' . $e->getMessage());
		}


//Espace pour ajouter des articles verif url et que tous les champs du formulaire sont remplis
if(isset($_SESSION['pseudo']))
{
	if(isset($_GET['action']))
	{
		if($_GET['action']=='add')
		{
			if(isset($_POST['envoi']))
			{
				$title = $_POST['title'];
				$description = $_POST['description'];
				$price = $_POST['price'];
				$category = $_POST['category'];
				$weight = $_POST['weight'];
				$stock = $_POST['stock'];
				$size = $_POST['size'];
				$gender = $_POST['gender'];
				$brand = $_POST['brand'];


				$img = $_FILES['img']['name'];
				$img_tmp = $_FILES['img']['tmp_name'];



				$img = explode('.', $img);
				$img_ext = end($img);


				//verifie format d'image compatible
				if(!empty($img_ext))
				{

					if (in_array(strtolower($img_ext), array('png', 'jpg', 'jpeg', 'svg'))===false) 
					{
						?>
							<script type="text/javascript"> alert("Format d'image non reconnu") </script>
						<?php
					}

					else
					{
						$img_size = getimagesize($img_tmp);
						if ($img_size['mime']=='image/jpeg') 
						{
							$img_src = imagecreatefromjpeg($img_tmp);
						}

						else if ($img_size['mime']=='image/png') 
						{
							$img_src = imagecreatefrompng($img_tmp);
						}

						else if ($img_size['mime']=='image/svg') 
						{
							$img_src = imagecreatefromsvg($img_tmp);
						}

						else
						{
							$img_src = false;
							?>
								<script type="text/javascript"> alert("Format incorrect, selectionnez une image valide.") 
								</script>
							<?php
						}

						if ($img_src!==false) 
						{
							$img_width = 800;

							if ($img_size[0]==$img_width) 
							{
								$final_img = $img_src;
							}

							else
							{
								$new_width[0]  = $img_width;

								$new_height[1] = 800;
								
								$final_img = imagecreatetruecolor($new_width[0], $new_height[1]);

								imagecopyresampled($final_img, $img_src, 0, 0, 0, 0, $new_width[0], $new_height[1], $img_size[0], $img_size[1]);
							}

							imagejpeg($final_img,'imgs/'.$title.'.jpg');
						}
					}
				}


				if (!empty($title && $description && $price && $category && $stock 
					&& $size && $gender && $brand))
				{
					$select=$db->query("SELECT price FROM weights WHERE value='$weight'");
					$s=$select->fetch(PDO::FETCH_OBJ);

					$shipping = $s->price;

					$old_price = $price;

					$select=$db->query("SELECT tva FROM products");
					$slct=$select->fetch(PDO::FETCH_OBJ);

					$tva = $slct->tva;

					$final_price = ($old_price + $shipping)+($old_price*($tva/100)); 
					
					$insert = $db->prepare("INSERT INTO products VALUES('', '$title', '$description', '$price', NOW(),'$category', '$weight',
						'$shipping', '$tva', '$final_price', '$stock', '$size', '$gender', '$brand')");
					$insert->execute();

				}

				else
				{
					if (($gender!="H"||$gender!="F")||$gender!="HF") 
					{
						?>
						<script type="text/javascript"> alert("Champs sexe invalide, mettre H ou F") </script>
						<?php
					}

					else
					{
					?>
						<script type="text/javascript"> alert("Veuillez remplir tous les champs.") </script>
					<?php
					}
				}
			}

				
		?>
			<form action="" method="POST" enctype="multipart/form-data">
				<label for="title">Titre</label> : <br> <input type="text" name="title" /><br />
				<label for="description">Description</label> : <br> <textarea name="description"></textarea><br />
				<label for="price">Prix</label> : <br> <input type="text" name="price" /><br /> <br>
				<label for="img">Image</label> : <br> <input type="file" name="img" /><br /> <br>
				<label for="category">Catégorie</label>
					<select name="category">
						<?php
							$select=$db->query("SELECT UPPER(name) AS cat_name FROM category");
								while ($s = $select->fetch(PDO::FETCH_OBJ)) 
								{ 
									?>
									
									<option><?php echo $s->cat_name; ?></option>

									<?php 
								}
						?>

					</select> <br><br>

					<label for="weight">Poids:  &le;</label>
					<select name="weight">
						<?php
							$select=$db->query("SELECT * FROM weights");
								while ($s = $select->fetch(PDO::FETCH_OBJ)) 
								{ 
									?>
									
									<option><?php echo $s->value; ?></option>

									<?php 
								}
						?>

					</select>
					<label for="weight">KG</label>
					 <br><br>

					<label for="stock">Stock</label> : <br> <input type="text" name="stock" /><br /> <br>
					<label for="size">Taille</label> : <br> <input type="text" name="size" /><br /> <br>
					<label for="gender">Sexe</label> : <br> <input type="text" name="gender" /><br /> <br>
					<label for="brand">Marque</label> : <br> <input type="text" name="brand" /><br /> <br>


				<input type="submit" name="envoi" />
			</form>
		<?php
		}

	

		else if($_GET['action']=='modifyanddelete')
		{
			$select = $db->prepare("SELECT * FROM products");
			$select->execute();

			while ($s=$select->fetch(PDO::FETCH_OBJ)) 
			{
				echo $s->title;	
				?>
					<a href="?action=modify&amp;id=<?php echo $s->id; ?>">Modifier</a>
					<a href="?action=delete&amp;id=<?php echo $s->id; ?>">Supprimer</a> <br><br>
				<?php
			}
		}

		else if($_GET['action']=='modify')
		{

			$id=$_GET['id'];
			$select = $db->prepare("SELECT * FROM products WHERE id=$id");
			$select->execute();

			$data=$select->fetch(PDO::FETCH_OBJ);

			?>
				<form action="" method="POST">
					<label for="title">Titre</label> : <br> 
					<input type="text" name="title" value="<?php echo $data->title; ?>" /><br />

					<label for="description">Description</label> : <br> 
					<textarea name="description" > <?php echo $data->description; ?> </textarea><br />

					<label for="price">Prix</label> : <br> 
					<input type="text" name="price" value="<?php echo $data->price; ?>"/><br /> 

					<label for="stock">Stock</label> : <br> 
					<input type="text" name="stock" value="<?php echo $data->stock; ?>"/><br /><br>

					<input type="submit" name="envoi" value="Modifier" />
				</form>
			<?php

			if (isset($_POST['envoi'])) 
			{
				$stock = $_POST['stock'];
				$title = $_POST['title'];
				$description = $_POST['description'];
				$price = $_POST['price'];
				/*$date = DateTime("NOW");*/

				if (!empty($title && $description && $price)) 
				{

					$update = $db->prepare("UPDATE products 
										   SET title='$title', description='$description', price='$price', date_creation=NOW(), stock='$stock'
										   WHERE id=$id");
					$update->execute();

					header('Location: admin.php?action=modifyanddelete');

				}

			}
		}

		else if($_GET['action']=='delete')
		{
			$id=$_GET['id'];
			$select = $db->prepare("DELETE FROM products WHERE id=$id");
			$select->execute();
		}

		else if($_GET['action']=='add_category')
		{
			if (isset($_POST['envoi'])) 
			{
				$name = $_POST['name'];

				if (!empty($name)) 
				{
					$insert = $db->prepare("INSERT INTO category VALUES('', '$name')");
					$insert->execute();
				}

				else
				{
					?>
						<script type="text/javascript">alert('Veuillez remplir tous les champs');</script>
					<?php
				}
			}

			?>
				<form action="" method="POST">
					<label for="name">Nouvelle catégorie</label>
					<input type="text" name="name">

					<input type="submit" name="envoi">
				</form>
			<?php
		}

		else if($_GET['action']=='modifyanddelete_category')
		{
			$select = $db->prepare("SELECT * FROM category");
			$select->execute();

			while ($s=$select->fetch(PDO::FETCH_OBJ)) 
			{
				echo $s->name;	
				?>
					<a href="?action=modify_category&amp;id=<?php echo $s->id; ?>">Modifier</a>
					<a href="?action=delete_category&amp;id=<?php echo $s->id; ?>">Supprimer</a> <br><br>
				<?php
			}
		}

		else if ($_GET['action']=='modify_category') 
		{
			$id=$_GET['id'];
			$select = $db->prepare("SELECT * FROM category WHERE id=$id");
			$select->execute();

			$data=$select->fetch(PDO::FETCH_OBJ);

			?>
				<form action="" method="POST">
					<label for="name">Nom de la catégorie</label> : <br> 
					<input type="text" name="name" value="<?php echo $data->name; ?>" /><br />

					<input type="submit" name="envoi" value="Modifier" />
				</form>
			<?php

			if (isset($_POST['envoi'])) 
			{
				$name = $_POST['name'];

				if (!empty($name)) 
				{
					$id=$_GET['id'];

					$select=$db->query("SELECT name FROM category WHERE id='$id'");
					$result = $select->fetch(PDO::FETCH_OBJ);
					

					$update = $db->prepare("UPDATE category 
										   SET name='$name'
										   WHERE id=$id");
					$update->execute();

					

					

					$update=$db->query("UPDATE products
										 SET category='$name'
										 WHERE category='$result->name'");


					

					header('Location: admin.php?action=modifyanddelete_category');

				}

			}
		}

		else if ($_GET['action']=='delete_category') 
		{
			$id=$_GET['id'];
			$select = $db->prepare("DELETE FROM category WHERE id=$id");
			$select->execute();
		}

		else if ($_GET['action']=='options') 
		{
			?>
				<h1>Frais de ports/Options de poids</h1>
				<hr><br><br>
			<?php

			$select = $db->query('SELECT * FROM weights');

			while ($s=$select->fetch(PDO::FETCH_OBJ)) 
			{
				?>

				<div style=" text-align:center; justify-content: space-between;">

					<h4> &le; <?php echo $s->value; ?> KG</h4>
					<a href="?action=modify_weight&amp;value=<?php echo $s->value; ?>"> Modifier</a>
					<hr>
				</div>

				<?php

			}

			$select=$db->query('SELECT tva FROM products');
			$s=$select->fetch(PDO::FETCH_OBJ);

				if (isset($_POST['submit2'])) 
				{
					$tva=$_POST['tva'];

					if ($tva) 
					{
						$update = $db->query("UPDATE products SET tva='$tva'");
					}
				}

			?>

				<div style=" text-align:center; justify-content: space-between;">
					<form action="" method="POST">
					<label for="tva">Valeur TVA :</label>
						<input type="text" name="tva" value="<?php echo $s->tva ?>">
						<input type="submit" name="submit2">
					</form>

				</div>

			<?php
		}

		else if ($_GET['action']=='modify_weight') 
		{
			$old_weight = $_GET['value'];
			$select=$db->query("SELECT price FROM weights WHERE value=$old_weight");
			$s=$select->fetch(PDO::FETCH_OBJ);
			
			if (isset($_POST['submit'])) 
			{

				$weight = $_POST['weight'];				
				$price = $_POST['price'];


				if (!empty($weight && $price)) 
				{
					$update=$db->query("UPDATE weights SET value='$weight', price='$price' WHERE value=$old_weight");

					
					?>
					<script type="text/javascript">alert('Valeur modifiée dans la base de donnée');</script>
					<?php
				}
			}

			?>

				<h1>Modifier frais de ports</h1>
				<hr> <br> <br>
			
			<div style=" text-align:center; justify-content: space-between;">
				<form action="" method="POST">
					<label for="weight">Poids max (kg)</label>
					<input type="text" name="weight" value="<?php echo $_GET['value']; ?>" />
					<label for="price">Frais de ports (€)</label>
					<input type="text" name="price" value="<?php echo $s->price; ?>" />
					<input type="submit" name="submit" value="Modifier">
				</form>
			</div>
			<?php
		}

		else
		{
			die('Erreur');
		}
	}
}

else
{
	header('Location: ../index.php');
}

?>

<br>
<h1>Bonjour, <?php echo $_SESSION['pseudo']; ?></h1>

<a href="?action=add"> Ajouter un produit </a> <br><hr>
<a href="?action=modifyanddelete"> Modifier/Supprimer un produit </a> <br><hr>
<a href="?action=add_category"> Ajouter une catégorie </a> <br><hr>
<a href="?action=modifyanddelete_category"> Modifier/supprimer une catégorie </a> <br><hr>
<a href="?action=options"> Options </a> <br>

