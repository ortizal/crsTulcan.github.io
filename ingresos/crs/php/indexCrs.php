<?php
    require_once '../../../conexion/conexion.php';
    function getNacionalidades(){
        $conection = getConn();
        $query = 'SELECT * FROM nacionalidades';
        $resultado = $conection->query($query);
        $nacionalidades = "<option value = '0'> --Seleccione Nacionalidad-- </option>";
        while ($row = $resultado->fetch_array(MYSQLI_ASSOC)){
            $nacionalidades .= "<option value = '$row[idnacionalidades]'> $row[nacionalidad] </option>";
        }
        return $nacionalidades;
    }
    echo getNacionalidades();
?>