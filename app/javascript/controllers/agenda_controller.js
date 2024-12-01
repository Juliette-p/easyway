import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["AgendaView", "BackgroundAgenda"]

  connect() {
    console.log("connect agenda ok");
    // console.log(this.fieldBackgroundTarget.style);
    console.log(this.AgendaViewTarget.style);
  }

  hide_agendaView() {
    console.log("hide_agendaView fields_for ok");
    this.AgendaViewTarget.classList.toggle("d-none");
    this.BackgroundAgendaTarget.classList.toggle("d-none");
  }
}
