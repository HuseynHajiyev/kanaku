import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mapb", "gridButton"]

  connect() {
    console.log("Controller connected!")
  }

  displayToggle() {
    if (this.gridButtonTarget.innerText == "Show map") {
      this.gridButtonTarget.innerText = "Venues"
    } else {
      this.gridButtonTarget.innerText = "Show map"
    }
    this.mapbTarget.classList.toggle("d-none")
  }
}
