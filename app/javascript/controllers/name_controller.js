import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['name', 'replace', 'images', 'box', 'box_2', 'bio', 'welcome'];

  connect() {
    this.imagesTarget.addEventListener('mouseenter', this.handleMouseEnter);
    this.imagesTarget.addEventListener('mouseleave', this.handleMouseLeave);
  }

  handleMouseEnter = (event) => {
    console.log(this.welcomeTarget)
    this.replaceTarget.classList.add('replace')
    this.boxTarget.classList.add('stretch')
    this.box_2Target.classList.add('stretch_up')
    this.nameTarget.classList.add('vanish')
    this.bioTarget.classList.add('vanish')
    this.welcomeTarget.classList.add('vanish')
  }

  handleMouseLeave = (event) => {
    this.nameTarget.classList.remove('vanish')
    this.boxTarget.classList.remove('stretch')
    this.box_2Target.classList.remove('stretch_up')
    this.bioTarget.classList.remove('vanish')
    this.replaceTarget.classList.remove('replace')
    this.welcomeTarget.classList.remove('vanish')
  }
}
