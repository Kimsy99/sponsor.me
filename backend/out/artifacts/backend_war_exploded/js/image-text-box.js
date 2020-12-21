var d = document.getElementById('div1');
var btn = document.getElementById('submit');

// Wire up the save button
btn.addEventListener('click', function (evt) {
  // First, turn off contenteditable
  div1.removeAttribute('contenteditable');

  // Now, get entire contents of div
  var updatedContents = div1.innerHTML;

  // If you want to save the contents, you'd have to persist them somewhere
  // but, all you have to save is the string: "updatedContents"
  console.log(updatedContents);
});
