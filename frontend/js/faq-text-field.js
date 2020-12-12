$('.multi-field-wrapper').each(function () {
  var $wrapper = $('.multi-fields', this);
  $('.add-field', $(this)).click(function (e) {
    $('.multi-field:first-child', $wrapper)
      .clone(false)
      .appendTo($wrapper)
      .find('input, textarea')
      .val('')
      .focus();
  });
  $('.multi-field .remove-field', $wrapper).click(function () {
    if ($('.multi-field', $wrapper).length > 1)
      $(this).parent('.multi-field').remove();
  });
});
