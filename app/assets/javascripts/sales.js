# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
function productos(){
   this.iniciar = function(){
      this.agregarItem();
      this.eliminarItem();
   };
   this.agregarItem = function(){
      $("#boton_agregar").click(function(){
         var codigo = $("#codigo").val();
         var cantidad = $("#cantidad").val();
         var item;
         item += '<tr>';
         item += '<td style="text-align: center"> ' + codigo + ' </td>';
         item += '<td style="text-align: center"> ' + cantidad + ' </td>';
         item += '<td style="text-align: center"> <a class="eliminar_item" href="javascript:void(0)"> Eliminar </a> </td>';
         item += '</tr>';
         $("#lista").append(item);
         $("#codigo").val("");
         $("#cantidad").val("");
      });
   };
   this.eliminarItem = function(){
      $("#lista").delegate(".eliminar_item", "click", function(){
         $(this).parents("tr").remove();
      });
   };
   return this.iniciar();
};
$(document).ready(function(){
   productos();
   alert('Hola mundo');
});
