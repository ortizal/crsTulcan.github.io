<?php
    function getConn(){
        $conexion = mysqli_connect("localhost","root","","crs-tulcan");
        $conexion->set_charset('utf8');
        return $conexion;
    }
?>