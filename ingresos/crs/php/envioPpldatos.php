<?php
    require_once '../../../conexion/conexion.php';
    $conection = getConn();
    $nombre = $_POST['txt_nombre'];
    $apellido = $_POST['txt_apellido'];
    $cedula = $_POST['txt_cedua'];
    $delito = $_POST['txt_delito'];
    $nacionaliad = $_POST['txt_nacionalidad'];
    $query = "INSERT INTO ppl(nombre, apellido, cedula, delito, nacionalidades_idnacionalidades)
                VALUES('$nombre','$apellido','$cedula','$delito','$nacionaliad')";
    echo mysqli_query($conection, $query);
?>