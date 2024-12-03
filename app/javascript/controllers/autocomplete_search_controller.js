import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["searchText", "autocompletionResult",
                    "li1", "li2","li3","li4","li5"];

  // static values = {
  //   names: Array,
  //   addresses: Array
  // }

  connect() {
    console.log("connect autocomplete search ok");
  }

  // Méthode displayAutocomplete
  displayAutocomplete(data) {
    // console.log("display autocomplete ok");
    // console.log(data);

    // suppression de la liste avant mise à jour
    const myList = document.querySelectorAll("#results p");
    myList.forEach((myLi) => {
      myLi.remove();
    });

    //mise à jour de la liste
    let i = 1;
    let liContent = '';
    const myUlList = document.getElementById("results");
    // console.log(`ullist: ${myUlList}`);
    data.forEach((word) => {
      // console.log(word.name);
      if (i <= 5) {
        liContent += `<p data-action="click->autocomplete-search#copy${i}" data-autocomplete-search-target="li${i}">${word.name}</p>`;
      }
      i += 1;
      // console.log(`lilist: ${liContent}`);
    });
    myUlList.insertAdjacentHTML('beforeend', liContent);
  };

  // Méthode autocomplete
  autocomplete() {
    // console.log("autocomplete ok");
    // console.log(this.searchTextTarget.value)
    if (this.searchTextTarget.value.length > 0) {
      this.autocompletionResultTarget.style = "display: initial;"
      // console.log("remove");
      const url = `/activities.json?search=${this.searchTextTarget.value}`;
      fetch(url) // requestDetails)
        .then(response => response.json())
        // .then(data => console.log(data.activities));
        .then(data => this.displayAutocomplete(data.activities));
    } else {
      // console.log("add")
      this.autocompletionResultTarget.style = "display: none;"
    }
  };

  // Méthode copy de la proposition 1 de l'autocomplétion dans l'input 'search'
  copy1() {
    console.log("copy1");
    this.searchTextTarget.value = this.li1Target.innerText;
  }

  // Méthode copy de la proposition 2 de l'autocomplétion dans l'input 'search'
  copy2() {
    console.log("copy2");
    this.searchTextTarget.value = this.li2Target.value;
  }

  // Méthode copy de la proposition 3 de l'autocomplétion dans l'input 'search'
  copy3() {
    console.log("copy3");
    this.searchTextTarget.value = this.li3Target.value;
  }

  // Méthode copy de la proposition 4 de l'autocomplétion dans l'input 'search'
  copy4() {
    console.log("copy4");
    this.searchTextTarget.value = this.li4Target.value;
  }

  // Méthode copy de la proposition 5 de l'autocomplétion dans l'input 'search'
  copy5() {
    console.log("copy5");
    this.searchTextTarget.value = this.li5Target.value;
  }
}
