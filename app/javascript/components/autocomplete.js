function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var search = document.getElementById('search-creature');

    if (search) {
      var autocomplete_search = new google.maps.places.Autocomplete(search, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(search, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

  });
}

export { autocomplete };
