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
  
});