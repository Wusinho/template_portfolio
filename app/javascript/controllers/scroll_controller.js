import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  scrollToSection(event) {
    event.preventDefault();
    const target = event.currentTarget.dataset.target;
    const section = document.querySelector(`[data-target="${target}"]`);
    console.log(section.offsetTop)
    if (section) {
      window.scrollTo({
        top: section.offsetTop,
        behavior: "smooth",
      });
    }
  }
}
