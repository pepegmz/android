<?php

error_reporting(0);

$nombre = $_POST["name"];
$email = $_POST["email"];
$telefono = $_POST["telephone"];
$pass = $_POST["password"];
$id_gusto = $_POST["idgusto"];
$id_tipous = $_POST["idrol"];
$idmun = $_POST["idmun"];


if (isset($nombre) and isset($email) and isset($pass) and isset($idmun))
{
	$imagen_generica = "user.png";

	include("conexion.php");

	//comprobar si el usuario ya existe:
	$consulta = "SELECT * FROM usuario WHERE correo='$email'";
	$ejecutar_consulta = $conexion->query($consulta);
	$num_regs = $ejecutar_consulta->num_rows;

	if (!$ejecutar_consulta)
	{
		$status="error";
		$message="No se puede obtener la informacion de la Base de Datos";
	}
	else
	{
		if($num_regs == 0)
		{
		//el usuario no existe... insertamos:
		$consulta = "INSERT INTO usuario (nombre,correo,telefono,pass,id_gusto,id_tipous,idmun) VALUES ('$nombre','$email','$telefono','$pass','$id_gusto','$id_tipous','$idmun')";
		$ejecutar_consulta = $conexion->query(utf8_encode($consulta));

		if($ejecutar_consulta){


		//añadimos el usuario insertado al response:

		$consulta = "SELECT * FROM usuario WHERE correo='$email'";
		$ejecutar_consulta = $conexion->query($consulta);
		$num_regs = $ejecutar_consulta->num_rows;

			if (!$ejecutar_consulta)
			{
				$status="error";
				$message="No se puede obtener la informacion de la Base de Datos";
				http_response_code(500);
			}
			else if ($num_regs == 1)
			{

				$usuario = $ejecutar_consulta->fetch_assoc();
				$status = "success";
				$message = "Se ha dado de alta al contacto con el email: $email";
				http_response_code(200);
			}
			else
			{
				$status="error";
				$message="Error en base de datos.";
			}


		
	}
	else{
		$status = "error";
		$message = "No se pudo dar de alta al contacto con el email <b>$email</b> :(";
		http_response_code(500);
	}


		}
		else
		{
			$status="error";
			$message="Ya existe un usuaio registrado con esta direccion de correo.";
		}

	}

}
else
{
	$status="error";
	$message="Error en los datos enviados";
}
	$responseJson->status = $status;
    $responseJson->message = $message;
    $responseJson->usuario = $usuario;

echo json_encode($responseJson);

$conexion->close();
?>