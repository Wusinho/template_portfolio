import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="projects"
export default class extends Controller {
  static targets = ['selected_repo', 'project_links']
  connect() {
  }

  click(e) {
    e.preventDefault();
    const selected__repo = this.selected_repoTarget;
    const link = e.target.closest('a');
    console.log();
    const h1Element = document.createElement('h1');
    const csrtToken = document.querySelector('meta[name="csrf-token"]').content;
    h1Element.textContent = 'Loading...';
    selected__repo.innerHTML = '';
    selected__repo.appendChild(h1Element);
    const links = this.project_linksTargets;

    fetch('/repos/repo', {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrtToken,
      },
      body: JSON.stringify({ id: link.dataset.id }),
    })
        .then((response) => response.text())
        .then((pic_info) => {
          let parsed = JSON.parse(pic_info)
          let url = `https://github.com/${parsed.picture}`
          const imgElement = document.createElement('img');
          imgElement.src = url
          selected__repo.innerHTML = '';
          selected__repo.appendChild(imgElement);
        });
  }
}
