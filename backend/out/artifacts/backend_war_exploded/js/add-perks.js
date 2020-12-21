$('.perks-wrapper').each(function () {
  var $wrapper = $('.perks-items', this);
  $('.add-perk', $(this)).click(function (e) {
    console.log('add new field');
    $('.perks-item-template')
      .clone()
      .removeClass('perks-item-template')
      .addClass('perks-item')
      .show()
      .appendTo($wrapper)
      .find('input')
      .val('');
  });
  $('.multi-field .remove-field', $wrapper).click(function () {
    if ($('.multi-field', $wrapper).length > 1)
      $(this).parent('.multi-field').remove();
  });
});
