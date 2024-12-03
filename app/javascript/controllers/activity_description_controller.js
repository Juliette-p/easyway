import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "shortText", "fullText", "showMoreLink", "showLessLink" ]

  connect() {
    console.log("read more controller connected");
  }

  showFullText() {
    console.log("showfulltext");

    this.shortTextTarget.style.display = "none";
    this.fullTextTarget.style.display = "inline";

    this.showMoreLinkTarget.style.display = "none";
    this.showLessLinkTarget.style.display = "inline";
  }

  showLessText() {
    console.log("showLesstext");

    this.shortTextTarget.style.display = "inline";
    this.fullTextTarget.style.display = "none";

    this.showMoreLinkTarget.style.display = "inline";
    this.showLessLinkTarget.style.display = "none";
  }
}
