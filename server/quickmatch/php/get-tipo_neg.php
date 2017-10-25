<?php

error_reporting(0);

include("conexion.php");

// Realizar una consulta MySQL
$query = 'SELECT * FROM tipo_neg';
$result = $conexion->query($query);

if ($result){
	$status="success";
	$message="Consulta Finalizada";
}else{
	$status="error";
	$message="No se puede obtener los tipos de negocios";
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
    $responseJson->tipoNegocios = $rawdata;

    echo json_encode($responseJson);

// Liberar resultados
//mysql_free_result($result);

// Cerrar la conexión
$conexion->close();
?>