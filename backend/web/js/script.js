filterSelection('all');

function removeClass(element, name) {
  let arr1 = element.className.split(' ');
  let arr2 = name.split(' ');
  for (let i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);
    }
  }
  element.className = arr1.join(' ');
}

function addClass(element, name) {
  let arr1 = element.className.split(' ');
  let arr2 = name.split(' ');
  for (let i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) === -1) {
      element.className += ' ' + arr2[i];
    }
  }
}

function filterSelection(filter) {
  console.log('filter');
  let filterDiv = document.getElementsByClassName('project-item');
  if (filter === 'all') filter = '';
  for (let i = 0; i < filterDiv.length; ++i) {
    removeClass(filterDiv[i], 'show');
    if (filterDiv[i].className.indexOf(filter) > -1) {
      addClass(filterDiv[i], 'show');
    }
  }
}

(function ($) {
  'use strict';

  jQuery(window).on('load', function () {
    // preloader();

    // if (jQuery('.gallery-outer .gallery-items').length > 0) {
    //   jQuery('.gallery-outer .gallery-items').filterizr();
    // }
    jQuery('.filter-list button').on('click', function () {
      jQuery('.filter-list button').removeClass('active');
      jQuery(this).addClass('active');
    });
  });

  // function preloader() {
  //   jQuery('.preloaderimg').fadeOut();
  //   jQuery('.preloader')
  //     .delay(200)
  //     .fadeOut('slow')
  //     .delay(200, function () {
  //       jQuery(this).remove();
  //     });
  // }
})(jQuery);
