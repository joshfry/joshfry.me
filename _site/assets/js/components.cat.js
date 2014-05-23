/*! 
 boilerplate 2014-05-23 
*/ 

// ------------------------------------------------------------
// Mobile Menu
   console.log('%c✔ Mobile Menu', 'color: #27ae60');
// ------------------------------------------------------------

var $MenuTrigger = $('.mobile-menu');

$MenuTrigger.click(function(){
  $('body').toggleClass('menu-active');
});
