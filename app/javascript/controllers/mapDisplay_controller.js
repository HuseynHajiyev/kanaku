import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mapb", "gridButton", "venueList", "icon", "buttontext"]

  connect() {
    console.log("Controller connected!")
  }

  displayToggle() {
    if (this.buttontextTarget.innerText == "Map") {
      this.buttontextTarget.innerText = "List"
      this.iconTarget.classList.add("gg-list")
      this.iconTarget.classList.remove("gg-pin")
    } else {
      this.buttontextTarget.innerText = "Map"
      this.iconTarget.classList.remove("gg-list")
      this.iconTarget.classList.add("gg-pin")
    }
    this.mapbTarget.classList.toggle("d-none")
    this.venueListTarget.classList.toggle("d-none")
    document.getElementsByClassName("search-box")[0].classList.toggle("d-none")
  }
}
