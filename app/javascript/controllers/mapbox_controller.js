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
      style: "mapbox://styles/wvala/cl45l3pzm009z14pltndjqdot"
    })
    if (this.map) {
      this.#addMarkersToMap();
      this.#fitMapToMarkers();
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

      new mapboxgl.Marker()
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
    console.log(geojson)
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
          'line-color': '#3887be',
          'line-width': 5,
          'line-opacity': 0.75
      }
    });
  }

//   #addLayer() {
//     console.log(this.#getRoute())
//     this.map.addLayer({
//       id: 'route',
//       type: 'line',
//       source: {
//           type: 'geojson',
//           data: this.#getRoute()
//       }
//       // layout: {
//       //     'line-join': 'round',
//       //     'line-cap': 'round'
//       // },
//       // paint: {
//       //     'line-color': '#3887be',
//       //     'line-width': 5,
//       //     'line-opacity': 0.75
//       // }
//     });
//   }
}

// controller, mapbox controller, view


// 1. receive the markers
// @markers = current_user.journeys.last.venues
// what function are we performing on these?

// 2. place them on a map
// new page controller for the journey preview - do markers logic there?
// will i also need a new mapbox controller?

// 3. insert the values of the journey venues into the Mapbox navigation API with a fetch
// const vnues = [];
// journey_venues.forEach((journey_venue) => {
//   vnues.push(`${journey_venue.latitude},${journey_venue.longitude}`)
// })


// example url: `https://api.mapbox.com/directions/v5/mapbox/walking/${vnues.join(";")}?steps=true&geometries=geojson&access_token=${MAPBOX_API_KEY}`

// 4. display the navigation object on the map, with (optional) instructions
// ???


// INSTRUCTIONS:
// let tripInstructions = '';
// for (const step of steps) {
//   tripInstructions += `<li>${step.maneuver.instruction}</li>`;
//   }
//   instructions.innerHTML = `<p><strong>Trip duration: ${Math.floor(
//   data.duration / 60
//   )} min 🚴 </strong></p><ol>${tripInstructions}</ol>`;
//   }

// 5. option for driving route as well - just weighted differently
