import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {

  static targets = ['navlinks']
  static values = { open: Boolean }
  static classes = ["opened"]

  connect(){
    this.all_positions = this.save_scroll_links(this.navlinksTargets, window.scrollY)
    this.current_active_link = this.active_link(this.all_positions)
    this.current_active_link.classList.add('active')
    this.activate_about_view()
  }
  disconnect() {
  }

  active_link(positions) {
    let id = this.conditions(positions)
    return Array.from(this.navlinksTargets).find((link) => {
      return link.dataset.target === id;
    });
  }

  conditions(positions) {
    const scrollPosition = window.scrollY;

    if (scrollPosition >= positions['home'].beginning && scrollPosition < positions['home'].end) {
      return 'home';
    } else if (scrollPosition >= positions['projects'].beginning && scrollPosition < positions['projects'].end) {
      return 'projects';
    } else if (scrollPosition >= positions['about-me'].beginning && scrollPosition < positions['about-me'].end) {
      return 'about-me';
    } else {
      return 'contact-me';
    }
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
    this.scroll_window = this.active_link(this.all_positions)
    if (this.current_active_link === this.scroll_window) return
      this.update_current_active_link(this.scroll_window)
    this.activate_about_view()
  }

  save_scroll_links(links) {
    const obj = {}
    links.forEach((link) => {
      const targetId = link.dataset.target;
      const targetElement = document.getElementById(targetId);
      const targetOffsetBottom = targetElement.offsetTop + targetElement.offsetHeight;
      obj[targetElement.id] = { beginning: targetElement.offsetTop, end: targetOffsetBottom }
    });
    return obj
  }

  update_current_active_link(new_active_link){
    this.current_active_link.classList.remove('active')
    this.current_active_link = new_active_link
    this.current_active_link.classList.add('active')
  }

  activate_about_view(){
    if (this.current_active_link.dataset.target !== 'about-me') { return }
    const about__container = document.getElementById('about__container')
    about__container.setAttribute('data-controller', 'about')
  }

}
