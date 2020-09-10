<?php
    require_once '../../../conexion/conexion.php';
    $conection = getConn();
    $ingreso = $_POST['txt_ingreso'];
    $fecha = $_POST['txt_fecha'];
    $hora = $_POST['txt_hora'];
    $boleta = $_POST['txt_boleta'];
    $auDispone = $_POST['txt_auDispone'];
    $procedencia = $_POST['txt_procedencia'];
    $policia = $_POST['txt_policia'];
    $telefono = $_POST['txt_telefono'];
    $observaciones = $_POST['txt_observaciones'];
    $detenidos = $_POST['txt_detenidos'];
    $aspRecibe = $_POST['txt_aspRec'];
    $query = "INSERT INTO ingreso(NIngreso, fecha, hora, boleta, auDispone, procedencia, conduce, telefono, observaciones, ppl_idppl, aspRec)
                VALUES('$ingreso','$fecha','$hora','$boleta','$auDispone','$procedencia','$policia','$telefono','$observaciones','$detenidos','$aspRecibe')";
    echo mysqli_query($conection, $query);
?>