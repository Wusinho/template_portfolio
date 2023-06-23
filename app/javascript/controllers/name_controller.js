import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['name', 'replace', 'images'];

  connect() {
    this.imagesTarget.addEventListener('mouseenter', this.handleMouseEnter);
    this.imagesTarget.addEventListener('mouseleave', this.handleMouseLeave);
  }

  handleMouseEnter = (event) => {
    this.replaceTarget.classList.add('replace')
    this.nameTarget.classList.add('vanish')
  }

  handleMouseLeave = (event) => {
    this.nameTarget.classList.remove('vanish')
    this.replaceTarget.classList.remove('replace')
  }
}
