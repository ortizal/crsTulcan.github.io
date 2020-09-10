$(document).ready(function(){
    /* Listado de nacionalidades */
    $('#ingresoData').hide();
    $.ajax({
        type:'POST',
        url:'../php/indexCrs.php'
    })
    .done(function(pplData){
        $('#listNacionalidades').html(pplData);
    })
    .fail(function(){
        alert("Error en la carga de nacionalidades");
    });
    /* Listado en tabla de los Ingresos realizados */
    listarDatos();
    var fila;
    /* codigo boton editar */
    $(document).on("click",".btn-editar", function(){
        fila=$(this).closest("tr");
        alert (fila.text());
        return false;
        id = parseInt(fila.find('td:eq(0)').text());
        $.ajax({
            type:'POST',
            url:'../php/consulta.php',
            data:id,
            success:function () {
                
            }
        })
    })

});
function listarDatos(){
    $.ajax({
        type:'POST',
        url:'../php/listIngresos.php',
        success:function(listaPpl){
            $('#tbodyPpl').html(listaPpl);
        }
    });
    $.ajax({
        type:'POST',
        url:'../php/detenidos.php'
    })
    .done(function(ingresoData){
        $('#listDetenidos').html(ingresoData);
    })
    .fail(function(){
        alert("Error en la carga de detenidos");
    });
}
/* Boton para incertar los datos persoales de los PPL's */
$('#insPplData').click(function(){
    var pplForm = $('#pplData').serialize();
    $.ajax({
      type:'POST',
      url:'../php/envioPpldatos.php',
      data:pplForm,
      success: function(r){
          if (r == 1){
              $('#pplData').hide();  
              $('#ingresoData').show();
              listarDatos();
          }
          else{
              alert("Error en la carga de archivos");
          }
      }
      });

    return false;
});
$('#insIngData').click(function(){
    var dataForm = $('#ingresoData').serialize();
    $.ajax({
        type:'POST',
        url:'../php/envioingreso.php',
        data:dataForm,
        success: function(r){
            if (r == 1){
                alert ("Ingreso exitoso");
                $('#ingresoData').hide();
                listarDatos();
            }
            else{
                alert('Error al ingresar datos');
            }
        }
    });
    return false;
});