$(document).ready(function(){
    $.ajax({
        type:'POST',
        url:'../php/dewey.php'
    })
    .done(function(r){
        $("#dewey").html(r);
    })
    .fail(function(){
        alert("Error en la carga de las listas del dewey");
    });

    $.ajax({
        type:'POST',
        url:'../php/estadoLibros.php'
    })
    .done(function(r){
        $("#estadoLibro").html(r);
    })
    .fail(function(){
        alert("Error en la carga de las listas del dewey");
    })
 
    
})