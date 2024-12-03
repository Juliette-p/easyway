import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["text", "counter"];

  static values = {
    nb: Number
    // ^ in this case our value is a String, but you can also declare other types like Number
  }

  connect() {
    // TODO: console.log something!
    // console.log("connect character count rating ok");
    this.counterTarget.innerText = `0 caractères.`;
    // console.log(this.nbValue);
  }

  updateCounter() {
    // console.log("updateCounter");
    // console.log(this.textTarget.value);
    // console.log(this.counterTarget.value);
    if ((this.textTarget.value.length > 1) && (this.textTarget.value.length <= this.nbValue)) {
      this.counterTarget.innerText = `${this.textTarget.value.length} caractères.`;
    } else if (this.textTarget.value.length > this.nbValue) {
      this.counterTarget.innerText = `Nombre de caractères max dépassé de ${this.textTarget.value.length - this.nbValue} caractères.`;
    } else {
      this.counterTarget.innerText = `${this.textTarget.value.length} caractères.`;
    }
  }
}
