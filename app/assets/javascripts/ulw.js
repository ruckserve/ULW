(function() {
  function toggleStateDiv(e) {
    $('.state-form').collapse('hide');
    $('#response').text('')

    // this.value will be the state selected
    $('#' + this.value).collapse('show');
    return false;
  }

  function printResponse(e, data, status, xhr) {
    $('#response').text(xhr.responseText);
  }

  $('#state').change(toggleStateDiv);

  $('.fmr-form').on('ajax:success', printResponse);
})();
