function autocomplete3() {
  document.addEventListener("DOMContentLoaded", function() {
    var updateAddress = document.getElementById('update_address');

    if (updateAddress) {
      var autocomplete_update = new google.maps.places.Autocomplete(updateAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(updateAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete3 };
