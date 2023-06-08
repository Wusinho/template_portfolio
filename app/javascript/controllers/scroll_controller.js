import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ['navlinks']
  connect(){
  }
  scrollToSection(event) {
    event.preventDefault();
    const current_element = event.currentTarget
    const section = document.querySelector(`[data-scroll-target="${current_element.dataset.target}"]`);
    this.active_nav_link(this.navlinksTargets, current_element)
    if (section) {
      window.scrollTo({
        top: section.offsetTop,
        behavior: "smooth",
      });
    }
  }

  active_nav_link(links, current_element) {
    links.forEach((link)=>{
      link.classList.remove('active')
    })
    current_element.classList.add('active')
  }
}
