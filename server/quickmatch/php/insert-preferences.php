<?php

error_reporting(0);

$id_user = $_POST["id_user"];
$jsonPreferences = $_POST["jsonPreferences"];


include("conexion.php");

$consulta = "SELECT * FROM preferences WHERE id_user='$id_user'";

if (isset($id_user) && isset($jsonPreferences)){
    $ejecutar_consulta = $conexion->query($consulta);

    $num_regs = $ejecutar_consulta->num_rows;

if (!$ejecutar_consulta){
    $status="error";
    $message="No se puede obtener la informacion de la Base de Datos";
}

if($num_regs == 0)
{


    $consulta = "INSERT INTO preferences(id_user, json_preferences) VALUES ('$id_user','$jsonPreferences')";
    $ejecutar_consulta = $conexion->query(utf8_encode($consulta));

    echo $consulta;
    echo $ejecutar_consulta;

    if($ejecutar_consulta){
        $status = "success";
        $message = "Preferencias de Usuario Guardadas Correctamente";
    }
    else{
        $status = "error";
        $message = "No se pudo guardar las preferencais del Usuario";
    }
}
else
{

    //hacemos update si ya existen las preferencias del Usuario:

    $queryUpdate = "UPDATE `preferences` SET `id_preference`=`id_preference`,`id_user`=`id_user`,`json_preferences`='$jsonPreferences' WHERE id_user = '$id_user'";
    $exeUpdate = $conexion->query($queryUpdate);


    if($exeUpdate){
        $status = "success";
        $message = "Preferencias de Usuario Actualizadas Correctamente";
    }
    else{
        $status = "error";
        $message = "Error al Actualizar las preferencais del Usuario";
    }
}
}



    $responseJson->status = $status;
    $responseJson->message = $message;

    echo json_encode($responseJson);

$conexion->close();
?>