function autocomplete2() {
  document.addEventListener("DOMContentLoaded", function() {
    var creatureAddress = document.getElementById('creature_address');

    if (creatureAddress) {
      var autocomplete_create = new google.maps.places.Autocomplete(creatureAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(creatureAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

  });
}

export { autocomplete2 };
