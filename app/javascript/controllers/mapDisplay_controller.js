import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mapb", "gridButton", "venueList"]

  connect() {
    console.log("Controller connected!")
  }

  displayToggle() {
    if (this.gridButtonTarget.innerText == "Show map") {
      this.gridButtonTarget.innerText = "Cities"
    } else {
      this.gridButtonTarget.innerText = "Show map"
    }
    this.mapbTarget.classList.toggle("d-none")
    this.venueListTarget.classList.toggle("d-none")
  }
}
