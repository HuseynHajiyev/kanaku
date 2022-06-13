import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["inputl", "inputr", "magnify", "box"]

  connect() {
  }

  visibility(){
    this.magnifyTarget.classList.toggle("d-none")
    this.boxTarget.classList.toggle("d-none")
    this.inputlTarget.classList.toggle("input-search")
    this.inputrTarget.classList.toggle("input-search")
  }

}
