import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    'replace',
    'images',
    'box', 'box_2',
    'display_names',
    'diminishables'
  ];

  connect() {
    this.imagesTarget.addEventListener('mouseenter', this.handleMouseEnter);
    this.imagesTarget.addEventListener('mouseleave', this.handleMouseLeave);
  }

  handleMouseEnter = (event) => {
    this.replaceTarget.classList.add('replace')
    this.boxTarget.classList.add('stretch')
    this.box_2Target.classList.add('stretch_up')
    this.diminishablesTargets.forEach((target)=>{
      target.classList.add('vanish')
    })
    this.display_namesTarget.classList.add('border_right')
  }

  handleMouseLeave = (event) => {
    this.diminishablesTargets.forEach((target)=>{
      target.classList.remove('vanish')
    })
    this.boxTarget.classList.remove('stretch')
    this.box_2Target.classList.remove('stretch_up')
    this.replaceTarget.classList.remove('replace')
    this.display_namesTarget.classList.remove('border_right')
  }
}
