function addItem(product_id) {
  $.ajax({
    url: "/user/orders",
    type: 'POST',
    async: false,
    data: 'product_id=' + product_id,
    dataType : "json",
    success: function(data) {
      if (data['can_buy']) {
        if ($('#header-item-amount').length < 1) {
          let itemAmount = "<span class='badge badge-warning navbar-badge' id='header-item-amount'>1</span>";
          $('#link-dropdown-cart').parent().append(itemAmount)
        } else {
          let itemAmount = parseInt($('#header-item-amount').html())
          $('#header-item-amount').html(itemAmount + 1);
        }
      } else {
        alert('Product is out of stock');
      }
    }
  });
}

$(document).ready(function() {
  $('#default-address').on('click', function() {
    $('#full_name').val($('#default_full_name').val());
    $('#address').val($('#default_address').val());
    $('#phone').val($('#default_phone').val());
  });
});