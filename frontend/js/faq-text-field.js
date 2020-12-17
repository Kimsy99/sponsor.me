$('.multi-field-wrapper').each(function () {
  var $wrapper = $('.multi-fields', this);
  $('.add-field', $(this)).click(function (e) {
    console.log('add new field');
    $('.multi-field:first-child', $wrapper)
      .clone(true)
      .appendTo($wrapper)
      .find('input, textarea')
      .val('');
  });
  $('.multi-field .remove-field', $wrapper).click(function () {
    console.log('herer');
    if ($('.multi-field', $wrapper).length > 1) {
      console.log('remove fields');
      console.log($(this).parent('.multi-field'));
      $(this).parent('.multi-field').remove();
    }
  });
});
