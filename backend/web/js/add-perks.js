var count=0;
function uniqueID(count){
  return ++count;
}
$('.perks-wrapper').each(function () {
  var $wrapper = $('.perks-items', this);
  $('.add-perk', $(this)).click(function (e) {
    $('.perks-item-template')
        .clone(true, true)
        .removeClass('perks-item-template')
        .addClass('perks-item')
        .show()
        .appendTo($wrapper)
        .find('input')
        .val('');
    count = uniqueID(count);
    $('.perk-list').last().removeAttr('id').attr('id', `perk-${count}`)
    $('.perks').last().removeAttr('list').attr('list', `perk-${count}`);
  });


  $('.remove-field', $wrapper).click(function () {
    console.log("remove")
    if ($('.perks-item', $wrapper).length > 1)
      $(this).parent('.perks-item').remove();
  });
});
