$(document).ready(function() {

  $('.date').mask("00/00/0000", {placeholder: "00/00/0000"});
  $('.cnpj').mask("00.000.000/0000-00", {placeholder: "00.000.000/0000-00"});
  $('.cpf').mask("000.000.000-00", {placeholder: "000.000.000-00"})
  $('.cep').mask("00000-000", {placeholder: "00000-000"})

  $('form').on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });
  
  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });

})