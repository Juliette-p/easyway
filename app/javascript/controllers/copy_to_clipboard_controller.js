import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["address", "phone"];

  static values = {
    addressText: String,
    phoneText: String
  };

  connect() {
    // TODO: console.log something!
    console.log("connect copy_to_clipboard ok");
    // console.log(this.addressTarget.innerText);
  }

  copyAddress() {
    console.log("function copy address ok");
    console.log(this.addressTarget.innerText);
    // console.log(navigator.clipboard.writeText(this.addressTarget.innerText));
    navigator.clipboard.writeText(this.addressTarget.innerText);
    alert(this.addressTextValue);
  }

  copyPhoneNumber() {
    console.log("function copy phone number ok");
    console.log(this.phoneTarget.innerText);
    // console.log(navigator.clipboard.writeText(this.phoneTarget.innerText));
    navigator.clipboard.writeText(this.phoneTarget.innerText);
    alert(this.phoneTextValue);
  }
}
