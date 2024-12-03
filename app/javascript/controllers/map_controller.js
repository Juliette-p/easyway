import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this! pour afficher mapbox
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder" // pour la recherche dans la map

// Connects to data-controller="map"
export default class extends Controller {
  // static targets = ["map", "geolocateButton"]; // pour la méthode geolocate

  static values = {
    apiKey: String,
    markers: Array
  }

  // Méthode pour charger/afficher la map quand on arrive sur la page
  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap();
    this.#fitMapToMarkers();

    // pour une barre de recherche dans la map geobox uniquement
    // this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl }))
  }

  // Méthode pour géolocaliser l'utilisateur
  // à corriger (ne fonctionne pas). Code proposé par OPENIA/ChatGPT.
  // geolocate() {
  //   console.log("geolocate ok")
  //   if (navigator.geolocation) {
  //     navigator.geolocation.getCurrentPosition((position) => {
  //       const { latitude, longitude } = position.coords;
  //       this.map.flyTo({
  //         center: [longitude, latitude],
  //         zoom: 12
  //       });

  //       new mapboxgl.Marker()
  //         .setLngLat([longitude, latitude])
  //         .addTo(this.map);
  //     }, (error) => {
  //       alert("Erreur de géolocalisation: " + error.message);
  //     });
  //   } else {
  //     alert("La géolocalisation n'est pas supportée par votre navigateur.");
  //   }
  // }

  // private :

  // Méthode "privée" pour ajouter des marqueurs sur la map
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  // Méthode "privée" pour adapter la map aux marqueurs (centrer, zoomer, etc)
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 20, maxZoom: 25, duration: 0 })
  }
}
