import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ['navlinks']
  connect(){
  }
  disconnect() {
    // window.removeEventListener('scroll', this.handleScroll);
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

  onScroll(e){
    const scrollPosition = window.scrollY;
    this.navlinksTargets.forEach((link) => {
      const targetId = link.dataset.target;
      const targetElement = document.getElementById(targetId);
      const targetOffsetTop = targetElement.offsetTop;
      const targetOffsetBottom = targetOffsetTop + targetElement.offsetHeight;
      if (scrollPosition >= targetOffsetTop && scrollPosition < targetOffsetBottom) {
        link.classList.add('active');
      } else {
        link.classList.remove('active');
      }
    });
  }

  active_nav_link(links, current_element) {
    links.forEach(link => link.classList.remove('active'));
    current_element.classList.add('active');
  }


  handleScroll = () => {
    const scrollPosition = window.scrollY;
    console.log(scrollPosition)

    // this.navlinkTargets.forEach((link) => {
    //   const targetId = link.getAttribute('href').substring(1);
    //   const targetElement = document.getElementById(targetId);
    //
    //   if (targetElement.offsetTop <= scrollPosition && targetElement.offsetTop + targetElement.offsetHeight > scrollPosition) {
    //     link.classList.add('active');
    //   } else {
    //     link.classList.remove('active');
    //   }
    // });
  }

}
