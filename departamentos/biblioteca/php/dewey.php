<?php
require_once "conexionLibros.php";
function getDewey(){
    $conexion= getConexionLibros();
    $query="SELECT * FROM dewey";
    $resultado=$conexion->query($query);
    $dewey = "<option value='0'>--DEWEY--</option>";
    while($row=$resultado->fetch_array(MYSQLI_ASSOC)){
        $dewey .= "<option value='$row[iddewey]'>$row[nombre]</option>";
    }
    return $dewey;
}
echo getDewey();
?>