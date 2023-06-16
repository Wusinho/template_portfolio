import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="projects"
export default class extends Controller {
  static targets = ['selected_repo', 'project_links', 'loader']
  connect() {
  }

  click(e) {
    e.preventDefault();
    const selected__repo = this.selected_repoTarget;
    selected__repo.innerHTML = '';
    const link = e.target.closest('a');
    const loader = this.loaderTarget;
    loader.classList.remove('d-none');
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

    fetch('/repos/repo', {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({ id: link.dataset.id }),
    })
        .then((response) => response.json())
        .then((json) => {
          loader.classList.add('d-none');
          const divElement = document.createElement('div')
          divElement.classList.add('readme')
          if ( json.error ) {
            divElement.innerHTML = json.error;
          } else {
            divElement.innerHTML = json.readme;
          }
          selected__repo.append(divElement)
        })
  }



}
