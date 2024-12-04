import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["range", "note", "star"]

  connect() {
    this.updateNote()
    // console.log("Hello from controller");
  }

  updateNote() {
    const ratingValue = this.rangeTarget.value
    this.noteTarget.textContent = `${ratingValue}/5`

    this.starTargets.forEach((star, index) => {
      if (index < ratingValue) {
        star.style.color = "#FFCC51" // Couleur jaune pour les étoiles sélectionnées
      } else {
        star.style.color = "#cccaca" // Couleur transparente pour les étoiles non sélectionnées
      }
    })
  }
}
