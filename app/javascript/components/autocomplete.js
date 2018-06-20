function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var creatureAddress = document.getElementById('search-creature');

    if (creatureAddress) {
      var autocomplete = new google.maps.places.Autocomplete(creatureAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(creatureAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
