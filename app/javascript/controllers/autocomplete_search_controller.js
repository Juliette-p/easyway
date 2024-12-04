import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["searchText", "autocompletionResult",
                    "li1", "li2","li3","li4","li5"];

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
    let liContent = '';
    const myUlList = document.getElementById("results");
    data.slice(0,4).forEach((activity, i) => {
      if (i == 0) {
        const address = activity.address.split(' ');
        console.log(address[address.length -1]);
          liContent += `<p data-action="click->autocomplete-search#copy${i + 1}" data-autocomplete-search-target="li${i + 1}">${address[address.length - 1]}</p>`;
          liContent += `<p data-action="click->autocomplete-search#copy${i + 2}" data-autocomplete-search-target="li${i + 2}">${activity.name}</p>`;
      } else {
        liContent += `<p data-action="click->autocomplete-search#copy${i + 2}" data-autocomplete-search-target="li${i + 2}">${activity.name}</p>`;
      }
    });
    myUlList.insertAdjacentHTML('beforeend', liContent);
    };

  // Méthode autocomplete
  autocomplete() {
    // console.log("autocomplete ok");
    // console.log(this.searchTextTarget.value)
    if (this.searchTextTarget.value.length > 0) {
      this.autocompletionResultTarget.style = "display: initial;"
      const url = `/activities.json?search=${this.searchTextTarget.value}`;
      fetch(url) // requestDetails)
        .then(response => response.json())
        // .then(data => console.log(data.activities));
        .then(data => this.displayAutocomplete(data.activities));
    } else {
      this.autocompletionResultTarget.style = "display: none;"
    };
  };

  // Méthode copy de la proposition 1 de l'autocomplétion dans l'input 'search'
  copy1() {
    // console.log("copy1");
    this.searchTextTarget.value = this.li1Target.innerText;
    this.autocompletionResultTarget.style = "display: none;"
  }

  // Méthode copy de la proposition 2 de l'autocomplétion dans l'input 'search'
  copy2() {
    // console.log("copy2");
    this.searchTextTarget.value = this.li2Target.innerText;
    this.autocompletionResultTarget.style = "display: none;"
  }

  // Méthode copy de la proposition 3 de l'autocomplétion dans l'input 'search'
  copy3() {
    // console.log("copy3");
    this.searchTextTarget.value = this.li3Target.innerText;
    this.autocompletionResultTarget.style = "display: none;"
  }

  // Méthode copy de la proposition 4 de l'autocomplétion dans l'input 'search'
  copy4() {
    // console.log("copy4");
    this.searchTextTarget.value = this.li4Target.innerText;
    this.autocompletionResultTarget.style = "display: none;"
  }

  // Méthode copy de la proposition 5 de l'autocomplétion dans l'input 'search'
  copy5() {
    // console.log("copy5");
    this.searchTextTarget.value = this.li5Target.innerText;
    this.autocompletionResultTarget.style = "display: none;"
  }
}
