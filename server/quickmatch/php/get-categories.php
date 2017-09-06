<?php
include("conexion.php");

// Realizar una consulta MySQL
$query = 'SELECT * FROM categorias c, tipo_neg n where c.idtiponeg = n.idtiponeg';
$result = mysql_query($query) or die('Consulta fallida: ' . mysql_error());

//imprimir los resultados en json:
$rawdata = array(); //creamos un array

    //guardamos en un array multidimensional todos los datos de la consulta
    $i=0;

    while($row = mysql_fetch_array($result, MYSQL_ASSOC))
    {
        $rawdata[$i] = $row;
        $i++;
    }

    echo json_encode($rawdata);

// Liberar resultados
mysql_free_result($result);

// Cerrar la conexión
mysql_close($link);
?>