import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="icons"
export default class extends Controller {
  static targets = ["icon"]
  connect() {
    console.log("The icons controller is now loaded!");
  }

  addClass(event) {
   // event.preventDefault()

    const elem = document.querySelector(".active");

    if (elem) {
      elem.classList.remove('active');
      event.currentTarget.classList.add('active');
    } else {
      event.currentTarget.classList.add('active');
    }
  }
}
