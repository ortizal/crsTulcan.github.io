<?php
    require_once '../../../conexion/conexion.php';
    function getDetenidos(){
        $conection = getConn();
        $query = 'SELECT * FROM ppl ORDER BY idppl DESC ';
        $resultado = $conection->query($query);
        $detenido = "<option value = '0'> --Seleccione Detenido-- </option>";
        while ($row = $resultado->fetch_array(MYSQLI_ASSOC)){
            $detenido .= "<option value = '$row[idppl]'> $row[apellido], $row[nombre] </option>";
        }
        return $detenido;
    }
    echo getDetenidos();
?>