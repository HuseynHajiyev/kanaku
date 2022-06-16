import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["instructionsDiv", "button"]

  connect() {
    console.log("Hello from inst. controller!")
  }

  displayInstructions() {
    // if (this.instructionsDivTarget.innerText ==) {

    // }
    this.instructionsDivTarget.classList.toggle("d-none")
    this.buttonTarget.classList.toggle("homepage-map-raised")
    if (this.buttonTarget.innerText == "Details") {
      this.buttonTarget.innerText = "Hide"
    } else {
      this.buttonTarget.innerText = "Details"
    }
  }
}
