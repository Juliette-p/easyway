import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fieldUrl", "fieldPhone", "field5", "field6", "field7", "fieldPhoto",
                    "checkboxUrl", "checkboxPhone", "checkbox5", "checkbox6", "checkbox7", "checkboxPhoto"]

  connect() {
    console.log("connect fields_for ok");
    // console.log(this.checkbox7Target.checked);
    // console.log(this.fieldTarget.checked);
  }

  // url site web
  hide_checkboxUrl() {
    console.log("hide_checkboxUrl fields_for ok");
    if (this.checkboxUrlTarget.checked) {
      this.fieldUrlTarget.style = "display: initial;"
    } else {
      this.fieldUrlTarget.style = "display: none;"
    }
  }

  // téléphone
  hide_checkboxPhone() {
    console.log("hide_checkboxPhone fields_for ok");
    if (this.checkboxPhoneTarget.checked) {
      this.fieldPhoneTarget.style = "display: initial;"
    } else {
      this.fieldPhoneTarget.style = "display: none;"
    }
  }

  // acces transports en commun
  hide_checkbox5() {
    console.log("hide_checkbox5 fields_for ok");
    // console.log(this.checkbox6Target.checked);
    if (this.checkbox5Target.checked) {
      this.field5Target.style = "display: initial;"
    } else {
      this.field5Target.style = "display: none;"
    }
  }

  // acces voiture
  hide_checkbox6() {
    console.log("hide_checkbox6 fields_for ok");
    // console.log(this.checkbox6Target.checked);
    if (this.checkbox6Target.checked) {
      this.field6Target.style = "display: initial;"
    } else {
      this.field6Target.style = "display: none;"
    }
  }

  // acces vélo
  hide_checkbox7() {
    console.log("hide_checkbox7 fields_for ok");
    // console.log(this.checkbox7Target.checked);
    if (this.checkbox7Target.checked) {
      this.field7Target.style = "display: initial;"
    } else {
      this.field7Target.style = "display: none;"
    }
  }

    // acces vélo
    hide_checkboxPhoto() {
      console.log("hide_Photo fields_for ok");
      // console.log(this.PhotoTarget.checked);
      if (this.checkboxPhotoTarget.checked) {
        this.fieldPhotoTarget.style = "display: initial;"
      } else {
        this.fieldPhotoTarget.style = "display: none;"
      }
    }
}
