import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["AgendaView", "BackgroundAgenda", "ActivityShowView"]

  connect() {
    console.log("connect agenda ok");
    // console.log(this.fieldBackgroundTarget.style);
    console.log(this.AgendaViewTarget.style);
    console.log(this.ActivityShowViewTarget.style);

  }

  hide_agendaView() {
    console.log("hide_agendaView fields_for ok");
    this.AgendaViewTarget.classList.toggle("d-none");
    this.BackgroundAgendaTarget.classList.toggle("d-none");

    // enlever le scroll de la vue show en arrière plan
    if (this.BackgroundAgendaTarget.classList == "d-none"){
      this.ActivityShowViewTarget.style = "position: fixed;";
      this.ActivityShowViewTarget.style = "overflow-y: hidden;";

    } else {
      this.ActivityShowViewTarget.style = "position: relative;";

    }
  }
}
