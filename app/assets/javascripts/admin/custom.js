
$(document).ready(function() {
  if (location.pathname.split('/')[location.pathname.split('/').length - 1] != 'admin') {
    $(".nav>li.nav-item").each(function() {
      var navItem = $(this);

      if (navItem.find('a').attr('id') == location.pathname.split('/')[location.pathname.split('/').length - 1]) {
        navItem.find('a').addClass("active");
        return;
      }
    });
  } else {
    $($(".nav>li.nav-item")[0]).find('a').addClass("active");
  };
});