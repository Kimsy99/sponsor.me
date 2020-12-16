let radioSelection = document.getElementsByClassName('pledge-radio');
console.log(radioSelection);
for (let i = 0; i < radioSelection.length; ++i) {
  if (radioSelection[i].checked) {
    console.log(i + ' selected');
    document.getElementsByClassName('pledge-checkout-form')[i].style.display =
      'block';
  }
}
