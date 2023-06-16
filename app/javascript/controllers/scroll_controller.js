import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ['navlinks']
  connect(){
    const scrollPosition = window.scrollY;
    this.activate_nav_link(this.navlinksTargets, scrollPosition)
  }
  disconnect() {
  }
  scrollToSection(event) {
    event.preventDefault();
    const current_element = event.currentTarget
    const section = document.querySelector(`[data-scroll-target="${current_element.dataset.target}"]`);
    if (section) {
      window.scrollTo({
        top: section.offsetTop,
        behavior: "smooth",
      });
    }
  }

  onScroll(e){
    const scrollPosition = window.scrollY;
    this.activate_nav_link(this.navlinksTargets, scrollPosition)
  }

  activate_nav_link(links, scrollPosition) {
    links.forEach((link) => {
      const targetId = link.dataset.target;
      const targetElement = document.getElementById(targetId);
      const targetOffsetTop = targetElement.offsetTop - 40;
      const targetOffsetBottom = targetOffsetTop + targetElement.offsetHeight;
      if (scrollPosition >= targetOffsetTop && scrollPosition < targetOffsetBottom) {
        link.classList.add('active');
      } else {
        link.classList.remove('active');
      }
    });
  }

}
