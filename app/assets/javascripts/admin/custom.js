
$(document).ready(function() {
  if (location.pathname.split('/')[2] == 'orders') {
    $('#orders-list').addClass('menu-open');
    $('#orders-list').find('a.nav-link').first().addClass('active');
    $('#orders-list #orders').addClass('active');
    $("#orders-list .nav-treeview>li.nav-item").each(function() {
      var navItem = $(this);
      if (navItem.find('a').attr('id') == location.pathname.split('/')[3]) {
        navItem.find('a').addClass("active");
        $('#orders-list #orders').removeClass('active');
        return;
      }
    });
  } else {
    if (location.pathname.split('/')[2] != undefined && location.pathname.split('/')[2] != '') {
      $(".nav>li.nav-item").each(function() {
        var navItem = $(this);
  
        if (navItem.find('a').attr('href').includes(location.pathname.split('/')[2])) {
          navItem.find('a').addClass("active");
          return;
        }
      });
    } else {
      $($(".nav>li.nav-item")[0]).find('a').addClass("active");
    }; 
  }

  $('select.form-control').select2();
});