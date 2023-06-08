import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="name"
export default class extends Controller {
  static targets = ['name']
  connect() {
    const name_container = this.nameTarget
    const name_list = JSON.parse(name_container.innerHTML)
    this.iterateArray(name_list, name_container)
  }

  iterateArray(name_list, name_container) {
    let index = 0;

    const intervalId = setInterval(() => {
      if (index >= name_list.length) {
        clearInterval(intervalId);
        return;
      }

      const name = name_list[index];
      if (index === 0) name_container.classList.remove('d-none');
      name_container.innerHTML = name

      index++;
    }, 100);
  }
}
