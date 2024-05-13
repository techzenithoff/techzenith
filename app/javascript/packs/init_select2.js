$(document).on('turbolinks:load', function() {  

  $(this).find('.customSelect select').each(function() {
    var dropdownParent = $(document.body);

      $(this).select2({
        dropdownParent: dropdownParent,
        width: 'resolve' ,
      });
  });

});


$(document).on('turbolinks:load', function() {
  $('body').on('shown.bs.modal', '.modal', function() {
    $(this).find('.customSelect select').each(function() {
      var dropdownParent = $(document.body);
      if ($(this).parents('.modal.in:first').length !== 0)
        dropdownParent = $(this).parents('.modal.in:first');
      $(this).select2({
        dropdownParent: dropdownParent,
        width: 'resolve' ,
      });
    });
  });
});