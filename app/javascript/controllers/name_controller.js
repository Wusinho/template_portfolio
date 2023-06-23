import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['name', 'replace', 'images'];

  connect() {
    this.imagesTarget.addEventListener('mouseenter', this.handleMouseEnter);
    this.imagesTarget.addEventListener('mouseleave', this.handleMouseLeave);
  }

  handleMouseEnter = (event) => {
    // Code to run when the element is hovered (mouseenter event)
    console.log(this.nameTarget)
    this.nameTarget.style.display = 'none'
    // this.replaceTarget.style.display = 'block';
    // this.replaceTarget.style.transform = 'translateY(0%)';

    this.replaceTarget.classList.add('replace')
  }

  handleMouseLeave = (event) => {
    // Code to run when the element is no longer hovered (mouseleave event)
    this.nameTarget.style.display = 'block'
    this.replaceTarget.classList.remove('replace')
  }
}
