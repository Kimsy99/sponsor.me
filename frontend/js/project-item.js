// (function ($) {
//   'use strict';

//   jQuery(window).on('load', function () {
//     // preloader();

//     // if (jQuery('.gallery-outer .gallery-items').length > 0) {
//     //   jQuery('.gallery-outer .gallery-items').filterizr();
//     // }
//     $('.faq-details').hide();
//     jQuery('.project-item-details li').on('click', function () {
//       jQuery('.project-item-details li').removeClass('active');
//       // console.log(this);
//       jQuery(this).addClass('active');
//       console.log($('.active').text());
//       switch ($('.active').text()) {
//         case 'Campaign':
//           console.log('campaign');
//           $('.campaign-details').show();
//           break;
//         case 'FAQ':
//           console.log('faq');
//           $('.campaign-details').hide();
//           $('.faq-details').show();
//       }
//       // console.log(jQuery(this.innerText));
//       // if(jQuery(this[0].innerText))
//     });
//   });
// })(jQuery);
document.getElementById('campaign').click();
function openCity(event, sectionName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName('tab-content');
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = 'none';
  }
  tablinks = document.getElementsByClassName('tablinks');
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(' active', '');
  }
  document.getElementById(sectionName).style.display = 'block';
  event.currentTarget.className += ' active';
}

//accordion
var acc = document.getElementsByClassName('accordion');
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener('click', function () {
    this.classList.toggle('active');
    var panel = this.nextElementSibling;
    if (panel.style.display === 'block') {
      panel.style.display = 'none';
    } else {
      panel.style.display = 'block';
    }
  });
}

//comment box
let commentBox = document.getElementById('insert-comment');
let addCommentBtn = document.getElementById('add-comment');
let closeBtn = document.getElementsByClassName('close')[0];
let submitComment = document.getElementById('submitComment');

addCommentBtn.onclick = function () {
  commentBox.style.display = 'block';
};
closeBtn.onclick = function () {
  console.log('closebtn triggered');
  commentBox.style.display = 'none';
};
//click outside windows to close it
window.onclick = function (event) {
  if (event.target == commentBox) {
    commentBox.style.display = 'none';
  }
};
