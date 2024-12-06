import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["AgendaView", "BackgroundAgenda", "ActivityShowView", "calendar"]

  connect() {
    // console.log("connect agenda ok");
    // console.log(this.fieldBackgroundTarget.style);
    // console.log(this.AgendaViewTarget.style);
    // console.log(this.ActivityShowViewTarget.style);
    // console.log(this.calendarTarget.innerHTML)
    // console.log(this.calendarTarget)
    // class="flatpickr-day selected"
  }

  // hide_agendaView() {
  //   // console.log("hide_agendaView fields_for ok");
  //   this.AgendaViewTarget.classList.toggle("d-none");
  //   this.BackgroundAgendaTarget.classList.toggle("d-none");
  //   // console.log(this.calendarTarget.innerHTML);
  //   // console.log(this.calendarTarget.childs);

  //   // A reprendre : enlever le scroll de la vue show en arrière plan
  //   // if (this.BackgroundAgendaTarget.classList == "d-none"){
  //   //   this.ActivityShowViewTarget.style = "position: fixed;";
  //   //   this.ActivityShowViewTarget.style = "overflow-y: hidden;";

  //   // } else {
  //   //   this.ActivityShowViewTarget.style = "position: relative;";

  //   // }
  // }

  invitation() {
    // console.log("agenda confirm ok")
    // alert("Une invitation vous a été envoyée par mail.");
    // Swal.fire("Une invitation vous a été envoyée par mail.");
    Swal.fire({
      title: "Une invitation vous a été envoyée par mail.",
      titleColor: "#3D5555",
      confirmButtonText: "OK",
      confirmButtonColor: "#3D5555",
      width: "80%",
    });
  }

  openForm() {
    this.AgendaViewTarget.style.display = "flex";
  }

  closeForm() {
    this.AgendaViewTarget.style.display = "none";
  }
}
