import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    journeyShow: String
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/wvala/cl4dx8g7d001p14p2qmgdzcbq"
    })
    if (this.map) {
      this.#addMarkersToMap();
      this.#fitMapToMarkers();
      this.map.addControl(
        new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true
        })
      );
      if (this.journeyShowValue == "show") {
        this.#getRoute();
      }
    } else {
      console.log('map not initialzied');
    }
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "40px"
      customMarker.style.height = "40px"

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  async #getRoute() {
    const vnues = [];
    this.markersValue.forEach((marker) => {
      vnues.push(`${marker.lng},${marker.lat}`)
    });

    // const starter = "CURRENT_USER_LOCATION"
    // implement geocoding for user to add this as start point

    const addresses = vnues.join(";")
    const query = await fetch(
      `https://api.mapbox.com/directions/v5/mapbox/walking/${addresses}?steps=true&geometries=geojson&access_token=pk.eyJ1Ijoid3ZhbGEiLCJhIjoiY2wzNGV0MDZrMDNxNDNqcDVydW8wcGd6MyJ9.5z3qs54hdI3hGslqjk1wNw`,
      { method: 'GET' }
      );

    const json = await query.json();
    const data = json.routes[0];
    const route = data.geometry.coordinates;
    const geojson = {
      type: 'Feature',
      properties: {},
      geometry: {
        type: 'LineString',
        coordinates: route
      }
    };

    this.map.addLayer({
      id: 'route',
      type: 'line',
      source: {
        type: 'geojson',
        data: geojson
      },
      layout: {
        'line-join': 'round',
        'line-cap': 'round'
      },
      paint: {
        'line-color': '#7c8d77',
        'line-width': 5,
        'line-opacity': 0.75
      }
    });

    const instructions = document.getElementById('instructions');
    const steps = data.legs[0].steps;

    let tripInstructions = '';
    for (const step of steps) {
      tripInstructions += `<li>${step.maneuver.instruction}</li>`;
    }
    instructions.innerHTML = `<p><strong>Trip duration: ${Math.floor(
      data.duration / 60
    )} min 🚶‍♂️ </strong></p><ul>${tripInstructions}</ul>`;


  }
}


// GEOCODING
// map.addControl(
//   new mapboxgl.GeolocateControl({
//   positionOptions: {
//   enableHighAccuracy: true
//   },
//   // When active the map will receive updates to the device's location as it changes.
//   trackUserLocation: true,
//   // Draw an arrow next to the location dot to indicate which direction the device is heading.
//   showUserHeading: true
//   })
//   );

// Option for driving route as well - just weighted differently???
