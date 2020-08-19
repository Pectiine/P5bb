import L from "leaflet";
import "leaflet/dist/leaflet.css";


export default class Map {
  static init() {
    let map = document.querySelector("#map");
    if (map === null) {
      return;
    }
    let icon = L.icon({
      iconUrl: "/images/marker-icon.png",
    });
    let center = [map.dataset.lat, map.dataset.lng];
  
    map = L.map("map").setView(setView([45.763420,4.834277], 13));
    let token =
      "pk.eyJ1Ijoic3NzYW5kcmEyNyIsImEiOiJja2RnbDFyZDMxNzQ1MnducmNmaDQ4ZHJzIn0.iKU2YQV1tZ25k3RLF_qqOg";
    L.tileLayer(
      `https://api.mapbox.com/styles/v1/mapbox/streets-v9/tiles/{z}/{x}/{y}?access_token=${token}`,
      {
        maxZoom: 18,
        minZoom: 12,
        attribution:
          '© <a href="https://www.mapbox.com/feedback/">Mapbox</a> © <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
      }
    ).addTo(map);  
  
     popup = L.popup()
      .setContent("#property_address")
      .openOn(map);

    L.marker(center, info, { icon: icon }).bindPopup(this.inputAdress).addTo(map);
  
  }
}
