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
      this.update_current_active_link(this.scroll_window)
    this.activate_about_view()
  }

  save_scroll_links(links, scrollPosition) {
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
    new_active_link.classList.add('active')
    this.current_active_link = this.scroll_window
  }

  activate_about_view(){
    if (this.current_active_link.dataset.target !== 'about-me') { return }
    const about__container = document.getElementById('about__container')
    about__container.setAttribute('data-controller', 'about')
  }

}
