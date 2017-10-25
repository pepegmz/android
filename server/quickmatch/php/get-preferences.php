<?php

error_reporting(0);

$id_user = $_GET["id_user"];

include("conexion.php");

// Realizar una consulta MySQL
$query = "SELECT * FROM preferences where id_user = '$id_user'";
$result = $conexion->query($query);

if ($result){
	$status="success";
	$message="Consulta Finalizada";
}else{
	$status="error";
	$message="No se puede obtener las categorias";
}

//imprimir los resultados en json:
$rawdata = array(); //creamos un array

    //guardamos en un array multidimensional todos los datos de la consulta
    $i=0;

    while($row = $result->fetch_assoc())
    {
        $rawdata[$i] = $row;
        $i++;
    }

    //prepare response:
    $responseJson->status = $status;
    $responseJson->message = $message;
    $responseJson->preferences = $rawdata;

    echo json_encode($responseJson);

// Liberar resultados
//mysql_free_result($result);

// Cerrar la conexión
$conexion->close();
?>