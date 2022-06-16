import { Controller } from "stimulus"

export default class extends Controller {
   static targets = ["accept", "reject"]

  connect() {
    console.log("Changer connected")
    console.log(this.acceptTarget)
  }

  setAccept() {
    this.rejectTarget.classList.remove("gg-trash")
    this.rejectTarget.classList.add("gg-add-r")
  }

  setReject() {
    this.acceptTarget.classList.remove("gg-add-r")
    this.acceptTarget.classList.add("gg-trash")
  }
}
