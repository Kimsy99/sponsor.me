function toggleProfile() {
  console.log('pressed');
  if (document.getElementById('dropdown-content').style.display != 'block')
    document.getElementById('dropdown-content').style.display = 'block';
  else document.getElementById('dropdown-content').style.display = 'none';
}
