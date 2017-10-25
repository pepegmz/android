<?php

error_reporting(0);

$email = $_GET["email"];

if (isset($email))
{

    include("conexion.php");

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
                $message="Error en la base de datos.";
            }


        
    }
    else
    {
        $status = "error";
        $message = "No es posible obtener la informacion";
        http_response_code(500);
    }

    $responseJson->status = $status;
    $responseJson->message = $message;
    $responseJson->usuario = $usuario;

echo json_encode($responseJson);

$conexion->close();
?>