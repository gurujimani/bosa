// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// For table display
// 
//  application.js
//  bosa
//  
//  Created by N.Subramanian on 2010-08-19.
//  Copyright 2010 N.Subramanian. All rights reserved.
// 

$(document).ready(function() {
  
  $('#bosaTable').dataTable( {
    "sPaginationType": "full_numbers" 
  });
});

//Code for jQuery datepicker widget
$(document).ready(function(){
  $('input.ui-datepicker').datepicker({
      changeMonth: true,
      changeYear: true,
      yearRange: "-100:+10"
  });
});


$(document).ready(function(){
  $('#order_customer_id').change(function(event){
    $.get('/customers/getcontacts', {id: $(event.target).val()}, 
    function(response) { 
      $('#address').html(response);
      $('[value=""]',event.target).remove();
    }); 
  });
});

$(document).ready(function(){
  $('#order_delivery_currency').change(function(event){
    $.get('/currencies/currentrate', {id: $(event.target).val()},
      function(response) {
        $('#order_ex_rate').val(response);
        $('[value=""]',event.target).remove();
    });    
  });
});
