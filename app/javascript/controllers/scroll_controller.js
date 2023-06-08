import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  scrollToSection(event) {
    event.preventDefault();
    const target = event.currentTarget.dataset.target;
    const section = document.querySelector(`[data-scroll-target="${target}"]`);
    if (section) {
      window.scrollTo({
        top: section.offsetTop,
        behavior: "smooth",
      });
    }
  }
}
