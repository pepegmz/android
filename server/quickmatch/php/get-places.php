<?php

$order = $_GET["order"];

error_reporting(0);

include("conexion.php");

// Realizar una consulta MySQL
$query = 'SELECT s.idsucursal, s.nom_sucursal, s.direccion, s.horario, s.idtiopneg, s.idmun, n.tipo, c.idcateg, c.categ FROM tipo_neg n, categorias c, sucursal s, producto p WHERE n.idtiponeg = c.idtiponeg and n.idtiponeg = s.idtiopneg and s.idsucursal = p.idsucursal order by field(s.idtiopneg, '.$order.')';

$result = $conexion->query($query);

if ($result){
	$status="success";
	$message="Consulta Finalizada";

    $rawdata = array(); //creamos un array

    //guardamos en un array multidimensional todos los datos de la consulta
    $i=0;

    while($row = $result->fetch_assoc())
    {
        $rawdata[$i] = $row;
        $i++;
    }


    
}else{
	$status="error";
	$message="No se puede obtener los lugares";
    
}

//imprimir los resultados en json:


    //prepare response:
    $responseJson->status = $status;
    $responseJson->message = $message;
    $responseJson->places = $rawdata;

    echo json_encode($responseJson);

// Liberar resultados
//mysql_free_result($result);

// Cerrar la conexión
$conexion->close();
?>