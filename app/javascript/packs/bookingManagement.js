
function toggleTab() {
  document.getElementById("owner-bookings").classList.toggle("no-display");
  document.getElementById("booker-bookings").classList.toggle("no-display");
}

document.addEventListener("DOMContentLoaded", (event) => {
  if (document.getElementById("owner-button")) {
    document.getElementById("owner-button").addEventListener("click", (event) => {
      toggleTab();
    });
    document.getElementById("booker-button").addEventListener("click", (event) => {
      toggleTab();
    });
  }

});

export { toggleTab }
