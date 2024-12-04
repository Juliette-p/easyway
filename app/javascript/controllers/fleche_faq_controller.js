import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["flecheBas2", "flecheCote2", "reponse2", "flecheBas3", "flecheCote3", "reponse3"]
  connect() {
    // console.log(this.flecheCote2Target);
  }
  animq2() {
    this.flecheBas2Target.classList.toggle("d-none")
    this.flecheCote2Target.classList.toggle("d-none")
  }

  animq3() {
    this.flecheBas3Target.classList.toggle("d-none")
    this.flecheCote3Target.classList.toggle("d-none")
  }
}