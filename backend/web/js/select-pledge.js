// $('.pledge-radio').on('change', function () {
//   console.log($(this).siblings('input[type="checkbox"]'));
//   let curr = this;
//   $('.pledge-radio').each(() => {
//     console.log($(this)[0]);
//     console.log(curr);
//     if ($(this)[0].not(curr)) {
//       $(this)[0].prop('checked', false);
//     }
//   });
// });

$(document).ready(function () {
  $('input:checkbox').click(function () {
    $('input:checkbox').not(this).prop('checked', false);
    let radioSelection = document.getElementsByClassName('pledge-checkbox');
    console.log(radioSelection);
    for (let i = 0; i < radioSelection.length; ++i) {
      if (radioSelection[i].checked) {
        console.log(i + ' selected');
        document.getElementsByClassName('pledge-checkout-form')[
          i
        ].style.display = 'block';
      } else {
        document.getElementsByClassName('pledge-checkout-form')[
          i
        ].style.display = 'none';
      }
    }
  });
});
