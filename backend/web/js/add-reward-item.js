$('.option-types-wrapper').each(function () {
  var $wrapper = $('.option-types', this);
  console.log($wrapper);
  $('.add-field', $(this)).click(function (e) {
    console.log('add new item');
    $('.multi-field:first-child', $wrapper)
        .clone(true, true)
        .show()
        .appendTo($(this).siblings('.option-types'))
        .find('input')
        .val('');
  });
  $('.option-type .remove-field', $wrapper).click(function () {
    $(this).parent('.option-type').remove();
  });
});

$('.reward-wrapper').each(function () {
  var $wrapper = $('.reward-items', this);
  $('.add-item', $(this)).click(function (e) {
    console.log('add new field');
    $('.reward-item-template')
        .clone(true, true)
        .show()
        .removeClass('reward-item-template')
        .addClass('reward-item')
        .appendTo($wrapper)
        .find('input')
        .val('');
  });
  $('.reward-item .remove-reward', $wrapper).click(function () {
    if ($('.reward-item', $wrapper).length > 1)
      $(this).parent('.reward-item').remove();
  });
});
