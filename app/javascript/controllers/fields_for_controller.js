import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["field5", "field6", "field7", "checkbox5", "checkbox6", "checkbox7"]

  connect() {
    console.log("connect fields_for ok");
    // console.log(this.checkbox7Target.checked);
    // console.log(this.fieldTarget.checked);
  }

  hide_checkbox5() {
    console.log("hide fields_for ok");
    // console.log(this.checkbox6Target.checked);
    // e.target.closest("[data-target='fields-for.fields']").style = "display: none;"
    if (this.checkbox5Target.checked) {
      this.field5Target.style = "display: initial;"
    } else {
      this.field5Target.style = "display: none;"
    }
  }
  hide_checkbox6() {
    console.log("hide fields_for ok");
    // console.log(this.checkbox6Target.checked);
    // e.target.closest("[data-target='fields-for.fields']").style = "display: none;"
    if (this.checkbox6Target.checked) {
      this.field6Target.style = "display: initial;"
    } else {
      this.field6Target.style = "display: none;"
    }
  }
  hide_checkbox7() {
    console.log("hide fields_for ok");
    // console.log(this.checkbox7Target.checked);
    // e.target.closest("[data-target='fields-for.fields']").style = "display: none;"
    if (this.checkbox7Target.checked) {
      this.field7Target.style = "display: initial;"
    } else {
      this.field7Target.style = "display: none;"
    }
  }
}
