import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["inputc", "inputv", "placeholder", "box"]

  connect = () => {
  }

  toggleTouchStart = () => {
    this.placeholderTarget.innerHTML = ""
    this.inputcTarget.placeholder = "Search Cities"
    this.inputvTarget.placeholder = "Search Venues"
    // this.inputcTarget.autofocus = true
    // this.inputcTarget.classList.add("active")
  }

  toggleFocusCity = () => {
    this.inputcTarget.classList.add("active")
    this.inputcTarget.classList.remove("hidden-value")
  }

  toggleFocusVenue = () => {
    this.inputvTarget.classList.add("active")
    this.inputvTarget.classList.remove("hidden-value")
  }

  toggleBlurCity = () => {
    this.inputcTarget.classList.remove("active")
    this.inputcTarget.classList.add("hidden-value")
    setTimeout(() => {  this.#bothAreblurAction() }, 200);
  }

  toggleBlurVenue = () => {
    this.inputvTarget.classList.remove("active")
    this.inputvTarget.classList.add("hidden-value")
    setTimeout(() => {  this.#bothAreblurAction() }, 200);
  }


  #bothAreblurAction = () => {
    console.log("I'm in bothAreBlurAction")
    if(this.#bothAreBlurCheck()) {
      console.log("I am in conditional")
      this.inputcTarget.placeholder = ""
      this.inputvTarget.placeholder = ""
      // this.inputcTarget.autofocus = false
      this.placeholderTarget.innerHTML = "Search"
    }

  }

  #bothAreBlurCheck = () => {
    return !this.inputcTarget.classList.contains("active") && !this.inputvTarget.classList.contains("active")
  }

  // #toggleVisible = (box, icon) => {
  //   if (icon.classList.contains("box--hidden")) {
  //     icon.classList.add("d-none");
  //     box.classList.remove("d-none")
  //   }
  // }

  /* Experimental code */
  // #toggleBlur = (box, icon) => {
  //   if (box.classList.contains("box--hidden")) {
  //     box.classList.add("d-none");
  //     icon.classList.remove("d-none")
  //   }
  // }

  // blurAction = () => {
  //   this.boxTarget.classList.add("box--hidden")
  //   this.magnifyTarget.classList.remove("box--hidden")
  //   this.boxTarget.addEventListener("transitionend", this.#toggleBlur(this.boxTarget, this.magnifyTarget))
  // }

  // visibleAction = () => {
  //   this.magnifyTarget.classList.add("box--hidden")
  //   this.boxTarget.classList.remove("box--hidden")
  //   this.magnifyTarget.addEventListener("transitionend", this.#toggleVisible(this.boxTarget, this.magnifyTarget));
  // }
}
