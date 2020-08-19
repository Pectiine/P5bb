import $ from "jquery";
import "../css/app.css";
import "select2";
import Places from "places.js";
import map from "./modules/map.js";
import noUiSlider from "nouislider";
import "slick-carousel";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

map.init();

let inputAdress = document.querySelector("#property_address");


if (inputAdress) {
  let place = Places({
    container: inputAdress,
  });

  place.on("change", (e) => {
    document.querySelector("#property_city").value = e.suggestion.city;
    document.querySelector("#property_postal_code").value =
      e.suggestion.postcode;
    document.querySelector("#property_lat").value = e.suggestion.latlng.lat;
    document.querySelector("#property_lng").value = e.suggestion.latlng.lng;
  });
}

let searchAdress = document.querySelector("#search_address");

if (searchAdress) {
  let place = Places({
    container: searchAdress,
  });

  place.on("change", (e) => {
    document.querySelector("#lat").value = e.suggestion.latlng.lat;
    document.querySelector("#lng").value = e.suggestion.latlng.lng;
  });
}

$("select").select2({
  placeholder: "Selectionnez une option",
});


let range = document.getElementById("slider");

noUiSlider.create(range, {
  range: {
    min: 0,
    max: 1500,
  },
  step: 10,
  tooltips: [true, true],
  format: {

    to: function (value) {
      return value.toFixed(0) + " m2";
    },

    from: function (value) {
      return Number(value.replace(" m2", "")).toFixed(0);
    },
  },

  start: values,

  connect: true,
});

range.noUiSlider.on("update", function (values, handle) {

});

let $contactButton = $("#contactButton");

$contactButton.click((e) => {
  e.preventDefault();

  $("#contactForm").slideDown();
  $contactButton.slideUp();
});

//Suppression des images

document.querySelectorAll("[data-delete]").forEach((a) => {
  a.addEventListener("click", (e) => {
    e.preventDefault();
    fetch(a.getAttribute("href"), {
      method: "DELETE",
      headers: {
        "X-Requested-With": "XMLHttpRequest",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ _token: a.dataset.token }),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          a.parentNode.parentNode.removeChild(a.parentNode);
        } else {
          alert(data.error);
        }
      })
      .catch((e) => alert(e));
  });
});

$("[data-slider]").slick({
  dots: true,
  arrows: true,
});
window.cookieconsent.initialise({
  palette: {
    popup: {
      background: "#3937a3",
    },
    button: {
      background: "#e62576",
    },
  },
});

$("#resetForm").on("click", (e) => {
  window.location.href = "/properties";
});

$(".form-check").addClass("form-check-inline");

