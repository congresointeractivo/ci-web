// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  $(this).find('.bloques-chosen-select').data("placeholder","Filtrar por Bloque").chosen();
  
  $(this).find('.bloques-chosen-select').chosen().change(function() {
    var $this = $(this);
    var url = window.location.href.split('?', 2)[0];

    url 
    
    if (url.indexOf("filtrar_por") == -1) {
      url = url + '/filtrar_por'
    }

    $this.val() ?
      window.location.href = url + '?' + $this.attr('name') + '=' + $this.val().join(',') :
      window.location.href = url
  });
  	$('#legisladores #tabla-funcionarios').dataTable({
  	  "aaSorting": [[1,'asc']],
  	  //"bPaginate":false,
  	  "bFilter":true,
  	  "bAutoWidth":false,
  	  "iDisplayLength": 100,
  	  "aLengthMenu": [[100, 200, -1], [100, 200, "Todos"]],
  	  "sPaginationType": "full_numbers",
        "oLanguage": {
  	      "sLengthMenu": "Mostrar _MENU_ legisladores",
  	      "sSearch": "Filtrar:",
  	      "sInfo": "Mostrando _START_ al _END_ de _TOTAL_ legisladores",
  	     "oPaginate": {
              "sFirst": "",
              "sPrevious": "&#8592; Anterior",
              "sNext": "Siguiente &#8594;",
              "sLast": ""
          }
      }
  });
  	$('.legisladores-por-bloque #tabla-funcionarios').dataTable({
  	  "aaSorting": [[1,'asc']],
  	  "bPaginate":false,
  	  "bFilter":true,
  	  //"iDisplayLength": 50,
  	  //"aLengthMenu": [[50, 100, -1], [50, 100, "All"]],
  	  //"sPaginationType": "full_numbers",
        "oLanguage": {
  	      "sLengthMenu": "Mostrar _MENU_ legisladores",
  	      "sSearch": "Filtrar:",
  	      "sInfo": "Mostrando _START_ al _END_ de _TOTAL_ legisladores",
  	     "oPaginate": {
              "sFirst": "",
              "sPrevious": "&#8592; Anterior",
              "sNext": "Siguiente &#8594;",
              "sLast": ""
          }
      }
  });
  //necesario para que el corte el float
  $('#tabla-funcionarios_wrapper').addClass('clearfix');
  
});

