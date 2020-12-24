$('.perks-wrapper').each(function () {
  var $wrapper = $('.perks-items', this);
  $('.add-perk', $(this)).click(function (e) {
    console.log('add new field');
    $('.perks-item-template')
        .clone(true, true)
        .removeClass('perks-item-template')
        .addClass('perks-item')
        .show()
        .appendTo($wrapper)
        .find('input')
        .val('');
  });
  $('.perks-item .remove-field', $wrapper).click(function () {
    console.log('remove item');
    $(this).parent('.perks-item').remove();
  });
});
