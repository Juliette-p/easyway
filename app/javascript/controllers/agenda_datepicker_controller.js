import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {

  connect() {
    // console.log("agenda datepicker connect ok");
    const fp = flatpickr(this.element,
      {
        inline: true,
      });
    console.log(fp.selectedDates);
  }

}
