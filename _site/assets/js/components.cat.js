/*! 
 boilerplate 2014-06-05 
*/ 

// ------------------------------------------------------------
// Mobile Menu
   console.log('%c✔ Mobile Menu', 'color: #27ae60');
// ------------------------------------------------------------

var $MenuTrigger = $('.mobile-menu');

$MenuTrigger.click(function(){
  $('body').toggleClass('menu-active');
});
