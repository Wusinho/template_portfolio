import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="projects"
export default class extends Controller {
  static targets = ['selected_repo', 'project_links', 'loader']
  // static values = { switch: Boolean }
  // static values = [Boolean]
  connect() {
  }

  click(e) {
    e.preventDefault();
    const selected__repo = this.selected_repoTarget;

    const link = e.target.closest('a');
    const current_active_link = this.activeLink(this.project_linksTargets)

    if (current_active_link === link) return
    selected__repo.classList.add('d-none')
    selected__repo.innerHTML = '';
    this.clearCurrentLink(current_active_link)
    link.dataset.projectsSwitchValue = 'true';
    const topTriangle = document.createElement('div')
    topTriangle.classList.add('top__triangle')
    const loader = this.loaderTarget;
    loader.classList.remove('d-none');
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

    fetch('/repos', {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({ name: link.dataset.name, link: link.dataset.link }),
    })
        .then((response) => response.json())
        .then((json) => {
          loader.classList.add('d-none');
          const divElement = document.createElement('div')
          divElement.classList.add('readme')
          if ( json.error ) {
            divElement.innerHTML = json.error;
          } else {
            divElement.innerHTML = json.repo_link
            selected__repo.append(topTriangle)
            selected__repo.classList.remove('d-none')
          }
          selected__repo.prepend(divElement)
        })
  }

    activeLink(links) {
       return links.find((link) => link.dataset.projectsSwitchValue === 'true');
    }

    clearCurrentLink(link){
        if (!link) { return}
        link.dataset.projectsSwitchValue = 'false';
    }



}
