let dropdownContent = document.getElementById('dropdown-content');
let dropdown = document.getElementsByClassName('dropbtn')[0];

window.onclick = function (event) {
  console.log(event.target);
  if (
    event.target !== dropdownContent &&
    event.target !== dropdown &&
    dropdownContent.style.display === 'block'
  ) {
    console.log('close');
    dropdownContent.style.display = 'none';
    dropdown.style.backgroundColor = '#f1f1f1';
  }
};
function toggleProfile() {
  console.log('pressed');
  if (document.getElementById('dropdown-content').style.display != 'block') {
    document.getElementById('dropdown-content').style.display = 'block';
    document.getElementsByClassName('dropdown')[0].style.backgroundColor =
      '#FF8A65';
  } else {
    document.getElementById('dropdown-content').style.display = 'none';
    document.getElementsByClassName('dropdown')[0].style.backgroundColor =
      '#f1f1f1';
  }
}

// window.onload = function () {
//   var divToHide = document.getElementById('dropdown-content');
//   document.onclick = function (e) {
//     if (e.target.id !== 'dropdown-content') {
//       //element clicked wasn't the div; hide the div
//       divToHide.style.display = 'none';
//     }
//   };
// };
