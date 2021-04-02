function addItem(product_id) {
  let id, name, price, image;
  let isExisted = false;

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
          $('#link-dropdown-cart').after(itemAmount)
        } else {
          let itemAmount = $('#header-item-amount').html()
          $('#header-item-amount').html(itemAmount + 1);
        }
      } else {
        alert('Product is out of stock');
      }
    }
  });
}