import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {

  static targets = ['navlinks']
  static values = { open: Boolean }
  static classes = ["opened"]

  connect(){
    const scrollPosition = window.scrollY;
    this.all_positions = this.save_scroll_links(this.navlinksTargets, scrollPosition)
    this.current_active_link = this.active_link(this.all_positions)
    this.current_active_link.classList.add('active')
  }
  disconnect() {
  }

  active_link(positions) {
    const scrollPosition = window.scrollY;
    let id = ''
    if ( scrollPosition >= positions['home'].beginning && scrollPosition < positions['home'].end ){
      id = 'home'
    } else if ( scrollPosition >= positions['projects'].beginning && scrollPosition < positions['projects'].end ) {
      id = 'projects'
    } else if ( scrollPosition >= positions['about-me'].beginning && scrollPosition < positions['about-me'].end ) {
      id = 'about-me'
    } else {
      id = 'contact-me'
    }
    return document.querySelector(`[data-target="${id}"]`)
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
    this.current_active_link.classList.remove('active')
    this.scroll_window.classList.add('active')
    this.current_active_link = this.scroll_window
    if (this.current_active_link.dataset.target === 'about-me') {
      this.current_active_link.setAttribute('data-controller', 'about')
    }
  }

  save_scroll_links(links, scrollPosition) {
    console.log('save_scroll_links')
    const obj = {}
    links.forEach((link) => {
      const targetId = link.dataset.target;
      const targetElement = document.getElementById(targetId);
      const targetOffsetBottom = targetElement.offsetTop + targetElement.offsetHeight;
      obj[targetElement.id] = { beginning: targetElement.offsetTop, end: targetOffsetBottom }
    });
    return obj
  }

}
