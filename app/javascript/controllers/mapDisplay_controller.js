import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mapb", "gridButton"]

  connect() {
    console.log("Controller connected!")
  }

  displayToggle() {
    this.mapbTarget.classList.toggle("d-none")
  }
}
