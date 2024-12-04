import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "btn2", "flecheBas2", "flecheCote2", "reponse2", "btn3", "flecheBas3", "flecheCote3", "reponse3"]
  connect() {
    // console.log(this.flecheCote2Target);
  }
  animq2() {
    this.flecheBas2Target.classList.toggle("d-none")
    this.flecheCote2Target.classList.toggle("d-none")

    if (this.flecheBas2Target.classList.contains("d-none")) {
      this.btn2Target.style.background = "rgba(255, 204, 81, 1.0)";
    } else {
      this.btn2Target.style.background = "rgba(255, 204, 81, 0.5)";
    }
  }

  animq3() {
    this.flecheBas3Target.classList.toggle("d-none")
    this.flecheCote3Target.classList.toggle("d-none")

    if (this.flecheBas3Target.classList.contains("d-none")) {
      this.btn3Target.style.background = "rgba(255, 204, 81, 1.0)";
    } else {
      this.btn3Target.style.background = "rgba(255, 204, 81, 0.5)";
    }
  }
}
