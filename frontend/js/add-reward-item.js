$('.option-types-wrapper').each(function () {
  var $wrapper = $('.option-types', this);
  console.log($wrapper);
  $('.add-field', $(this)).click(function (e) {
    console.log('add new field');
    $('.multi-field-template')
      .clone()
      .removeClass('multi-field-template')
      .addClass('multi-field')
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

$('.reward-wrapper').each(function () {
  var $wrapper = $('.reward-items', this);
  $('.add-item', $(this)).click(function (e) {
    console.log('add new field');
    $('.reward-item-template')
      .clone()
      // .css('display', 'block')
      .show()
      .removeClass('reward-item-template')
      // .addClass('reward-item')
      .appendTo($wrapper)
      .find('input')
      .val('');
  });
  $('.multi-field .remove-field', $wrapper).click(function () {
    if ($('.multi-field', $wrapper).length > 1)
      $(this).parent('.multi-field').remove();
  });
});
