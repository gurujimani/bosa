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

function IsNumeric(input){
   return (input - 0) == input && input.length > 0;
};

function CalculatePayinAmt(){
  if($('#order_ex_rate').val()){
      $('#order_amount').val(($('#order_amount_to_deliver').val() / $('#order_ex_rate').val() ).toFixed(2) );      
  }
  else {
    alert("No value available for exchange rate. Please select the delivery currency.");
    $('#order_delivery_currency').focus();
  }  
};

function CalculatePayoutAmt(){
  if($('#order_ex_rate').val()){
      $('#order_amount_to_deliver').val(($('#order_amount').val() * $('#order_ex_rate').val() ).toFixed(2));
   //   $('#order_agent_id').focus();
  }
  else {
    alert("No value available for exchange rate. Please select the delivery currency.");
    $('#order_delivery_currency').focus();
    return false;
  }
};
function CalculateAmount(){
  if($('#order_amount').val()){
    CalculatePayoutAmt();
  }
  else if($('#order_amount_to_deliver').val()){
    CalculatePayinAmt();
  }  
}

function GetCommission(){
  $.get('/commissions/getcommission.xml', {amount: $('#order_amount').val()},
      function(data){
        var i = 0;
        $(data).find("commission").each(function(){
          //$('#order_commission').val
          if(i == 0){
            $('#order_commission').val($("commission", this).text());
            //$('#order_charge').val
            $('#order_charge').val($("charge", this).text());
          }
          i = i + 1;
        });
      });
}

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
        $('#order_ex_rate').parent().find( 'label' ).text("Exchange Rate (" + $('#order_delivery_currency :selected').text() + ")");
        $('#order_amount_to_deliver').parent().find( 'label' ).text("Payout Amount (" + $('#order_delivery_currency :selected').text() + ")");
        $('[value=""]',event.target).remove();
        CalculateAmount();  
        if ($('#order_amount').val()){
          GetCommission();
        }      
    });    
  });
});

$(document).ready(function(){
  $('#order_amount').bind('focusout', function(event){
    if($.trim(this.value)){
      if(IsNumeric($.trim(this.value))){
        GetCommission();
        CalculatePayoutAmt();
        $('#order_agent_id').focus(); 
      }
      else {
        alert("Payin amount is not a valid number. Please reenter the amount.");
        $('#order_amount').focus();
      }
    }
  });
});

$(document).ready(function(){
  $('#order_amount_to_deliver').bind('focusout', function(event){
    if($.trim(this.value)){
      if(IsNumeric($.trim(this.value))){
        CalculatePayinAmt();  
        GetCommission();
        $('#order_agent_id').focus();      
      }
      else {
        alert("Payout amount is not a valid number. Please reenter the amount.");
        $('#order_amount_to_deliver').focus();
      }
    }
  });
});