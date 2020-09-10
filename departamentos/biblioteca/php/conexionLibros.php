<?php
function getConexionLibros(){
    $conexionLibros=mysqli_connect("localhost","root","","libros");
    $conexionLibros->set_charset('utf8');
    return $conexionLibros;
}
?>