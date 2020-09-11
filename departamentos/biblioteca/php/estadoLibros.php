<?php
require_once "conexionLibros.php";
function getEstadoLibros(){
    $conexion= getConexionLibros();
    $query="SELECT * FROM estado";
    $resultado=$conexion->query($query);
    $estadoLibros = "<option value='0'>--Estado Libros--</option>";
    while($row=$resultado->fetch_array(MYSQLI_ASSOC)){
        $estadoLibros .= "<option value='$row[idestado]'>$row[estadocol]</option>";
    }
    return $estadoLibros;
}
echo getEstadoLibros();
?>