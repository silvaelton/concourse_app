$(document).on('turbolinks:load', function() {
  $('.ui.dropdown').dropdown();
  $('.ui.fluid.dropdown').dropdown();

  $('.date').mask("00/00/0000", {placeholder: "__/__/____"});
  $('.hour').mask("00:00", {placeholder: "08:00"});
  $('.cnpj').mask("00.000.000/0000-00", {placeholder: "00.000.000/0000-00"});

});