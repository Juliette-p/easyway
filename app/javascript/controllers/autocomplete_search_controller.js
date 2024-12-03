import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["searchText", "autocompletionResult"];

  static values = {
    names: Array,
    addresses: Array
  }

  connect() {
    console.log("connect autocomplete search ok");
  }

  // Function displayAutocomplete
  displayAutocomplete(data) {
    // console.log("display autocomplete ok");
    // console.log(data);
    const myLiList = document.querySelectorAll("#results li");
    myLiList.forEach((myLi) => {
      myLi.remove();
    });
    const myList = document.getElementById("results");
    let i = 1;
    data.forEach((word) => {
      // console.log(word.name);
      if (i <= 5) {
        const li = document.createElement("li");
        li.innerText = word.name;
        myList.appendChild(li);
      };
      i += 1;
    });
  };

  // Function : autocomplete
  autocomplete() {
    console.log("autocomplete ok");
    // console.log(this.searchTextTarget.value)
    if (this.searchTextTarget.value.length > 0) {
      // this.autocompletionResultTarget.classList.remove = "d-none";
      this.autocompletionResultTarget.style = "display: initial;"
      console.log("remove");
      const url = `/activities.json?search=${this.searchTextTarget.value}`;
      fetch(url) // requestDetails)
        .then(response => response.json())
        // .then(data => console.log(data.activities));
        .then(data => this.displayAutocomplete(data.activities));
    } else {
      console.log("add")
      this.autocompletionResultTarget.style = "display: none;"
      // this.autocompletionResultTarget.classList.add = "d-none";
    }
  };
}
