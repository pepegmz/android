<?php

error_reporting(0);


$email = $_POST["email"];
$password = $_POST["password"];

//$imagen_generica = "user.png";

include("conexion.php");

$consulta = "SELECT * FROM usuario WHERE correo like '$email' and pass like '$password'";
$ejecutar_consulta = $conexion->query($consulta);


$num_regs = $ejecutar_consulta->num_rows;

if (!$ejecutar_consulta){
	$status="error";
	$message="No se puede obtener la informacion de la Base de Datos";
	http_response_code(500);
}

if($num_regs == 1)
	{
		$user = $ejecutar_consulta->fetch_assoc();
		$id = $user["id_usuario"];
		$query = "SELECT * FROM preferences where id_user = '$id'";
		$result = $conexion->query($query);
		$num_regs = $result->num_rows;

		if ($result)
		{
		$status="success";
		$message="Consulta Finalizada";
		}
		else
		{
		$status="error";
		$message="No se puede obtener las categorias";
		}

			if($num_regs == 1)
			{
				$status = "success";
				$message = "Usuario Logueado";
				//$user = $ejecutar_consulta->fetch_assoc();
				$preferences = $result->fetch_assoc();
				http_response_code(200);
			}
			if($num_regs > 1)
			{
				$status = "error";
				$message = "Usuario duplicado, pongase en contacto con el Administrador de Base de Datos";
				http_response_code(500);
			}


		
	}
	if($num_regs == 0)
	{
		$status = "error";
		$message = "Usuario NO registrado";
		http_response_code(500);
	}
	if($num_regs > 1)
	{
		$status = "error";
		$message = "Usuario duplicado, pongase en contacto con el Administrador de Base de Datos";
		http_response_code(500);
	}
	


	$responseJson->status = $status;
    $responseJson->message = $message;
    $responseJson->user = $user;
    $responseJson->preferences = $preferences;

    echo json_encode($responseJson);

$conexion->close();
?>