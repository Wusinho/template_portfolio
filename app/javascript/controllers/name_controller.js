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
  }

  handleMouseLeave = (event) => {
    // Code to run when the element is no longer hovered (mouseleave event)
    console.log('Mouse left the element');
  }
}
