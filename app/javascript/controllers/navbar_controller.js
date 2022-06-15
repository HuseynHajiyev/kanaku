import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["burger"]

  // connect = () => {
  //   console.log("I'm connected")
  // }

  hideSearch = () => {
    const searchBox = document.getElementsByClassName("search-box-container")[0]
    const geoLocate = document.getElementsByClassName("mapboxgl-ctrl-geolocate")[0]
    const floatButton = document.getElementsByClassName("floating-button")[0]
    setTimeout(() => { this.#hideSearchAndGeo(searchBox, geoLocate, floatButton) }, 100);

  }

  showSearch = () => {
    const searchBox = document.getElementsByClassName("search-box-container")[0]
    const geoLocate = document.getElementsByClassName("mapboxgl-ctrl-geolocate")[0]
    const floatButton = document.getElementsByClassName("floating-button")[0]
    setTimeout(() => { this.#showSearchAndGeo(searchBox, geoLocate, floatButton) }, 100);
  }

  #hideSearchAndGeo(searchBox, geoLocate, floatButton) {
    searchBox.classList.add("d-none")
    geoLocate.classList.add("d-none")
    floatButton.classList.add("d-none")
  }

  #showSearchAndGeo(searchBox, geoLocate, floatButton) {
    searchBox.classList.remove("d-none")
    geoLocate.classList.remove("d-none")
    floatButton.classList.remove("d-none")
  }
}
