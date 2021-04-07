$(document).ready(function() {
  //plugin bootstrap minus and plus
  //http://jsfiddle.net/laelitenetwork/puJ6G/
  $('.btn-number').each(function() {
    $(this).click(function(e){
      e.preventDefault();
      
      fieldName = $(this).attr('data-field');
      type      = $(this).attr('data-type');
      var input = $("input[name='"+fieldName+"']");
      var currentVal = parseInt(input.val());
      if (!isNaN(currentVal)) {
        if(type == 'minus') {
          typeChange = 'minus';

          if(currentVal > input.attr('min')) {
            input.val(currentVal - 1).change();
          } 

          if(parseInt(input.val()) == parseInt(input.attr('min'))) {
            $(this).attr('disabled', true);
          }
        } else if(type == 'plus') {
          typeChange = 'plus';

          if(currentVal < input.attr('max')) {
            input.val(currentVal + 1).change();
          }

          if(parseInt(input.val()) == parseInt(input.attr('max'))) {
            $(this).attr('disabled', true);
          }
        }
      } else {
        input.val(0);
      }
    })
  });

  $('.input-number').focusin(function(){
    $(this).data('oldValue', $(this).val());
  });

  $('.input-number').change(function() {
    minValue =  parseInt($(this).attr('min'));
    maxValue =  parseInt($(this).attr('max'));
    valueCurrent = parseInt($(this).val());
    name = $(this).attr('name');
    id = $(this).attr('id');
    orderDetailAmount = $(".order-detail-amount-" + id);

    if(valueCurrent >= minValue) {
      $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the minimum value was reached');
        $(this).val($(this).data('oldValue'));
        return;
    }

    if(valueCurrent <= maxValue) {
      $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
      alert('Sorry, the maximum value was reached is ' + maxValue);
      $(this).val($(this).data('oldValue'));
      return;
    }

    $.ajax({
      url: "/user/order_details/" + id,
      type: 'PUT',
      async: false,
      data: { value: valueCurrent, type: typeChange },
      dataType : "json",
      success: function(data) {
        $(this).attr('max', data['product_amount']);
        if (data['is_latest_product']) {
          $(".btn-number[data-type='plus'][data-field='"+name+"']").attr('disabled', true)
          $(".btn-number[data-type='plus'][data-field='"+name+"']").attr('max', data['amount'])
          alert('The product is out of stock');
        }

        orderDetailAmount.html(data['amount']);
        $(this).val(data['amount']);
        $('.checkout-total').html('$ ' + data['total_amount']);
        typeChange = '';
      }
    });
  });

  $(".input-number").keydown(function (e) {
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
      // Allow: Ctrl+A
      (e.keyCode == 65 && e.ctrlKey === true) || 
      // Allow: home, end, left, right
      (e.keyCode >= 35 && e.keyCode <= 39)) {
        // let it happen, don't do anything
        return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
      e.preventDefault();
    }
  });
});