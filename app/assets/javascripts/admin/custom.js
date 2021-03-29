
$(document).ready(function() {
  if (location.pathname.split('/')[1].length > 0) {
    $(".nav>li.nav-item").each(function() {
      var navItem = $(this);
      if (navItem.find('a').attr('href').includes(location.pathname.split('/')[1])) {
        navItem.find('a').addClass("active");
        return;
      }
    });
  } else {
    $($(".nav>li.nav-item")[0].find('a')).addClass("active");
  };
});