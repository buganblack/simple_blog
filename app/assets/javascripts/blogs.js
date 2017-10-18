$(document).ready(function(){
  $("#backToTopBtn").click(function(){
    $("html,body").animate({ scrollTop: 0 }, 500);return false;
  });

  $(".js-hamburger").click(function(){
    $(".js-nav").toggleClass("nav-toggle");
  });
});

