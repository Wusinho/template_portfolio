import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['name', 'replace'];

  connect() {
    const nameContainer = this.nameTarget;
    const parentElement = this.replaceTarget.parentNode;
    const nameList = JSON.parse(nameContainer.innerHTML);
    this.iterateArray(nameList, parentElement);
  }

  iterateArray(nameList, parentElement) {
    let index = 0;

    const intervalId = setInterval(() => {
      if (index >= nameList.length) {
        clearInterval(intervalId);
        return;
      }

      const name = nameList[index];
      const newSpanElement = document.createElement('span');
      newSpanElement.setAttribute('data-name-target', 'replace');
      newSpanElement.innerHTML = name;
      newSpanElement.classList.add('span');

      parentElement.replaceChild(newSpanElement, this.replaceTarget);

      index++;
    }, 100);
  }
}
