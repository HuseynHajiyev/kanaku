import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["instructionsDiv", "button"]

  connect() {
    console.log("Hello from inst. controller!")
  }

  displayInstructions() {
    this.instructionsDivTarget.classList.toggle("d-none")
    this.buttonTarget.classList.toggle("homepage-map-raised")
    if (this.buttonTarget.innerText == "Show Instructions") {
      this.buttonTarget.innerText = "Hide Instructions"
    } else {
      this.buttonTarget.innerText = "Show Instructions"
    }
  }
}
