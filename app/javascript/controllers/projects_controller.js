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
    loader.classList.remove('d-none')
    const csrtToken = document.querySelector('meta[name="csrf-token"]').content;

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
          console.log(pic_info)
          // let url = `https://github.com/${parsed.picture}`
          const imgElement = document.createElement('img');
          const iframeElement = document.createElement('iframe');

            // <iframe width="790" height="444" src="https://www.youtube.com/embed/pok8H_KF1FA?list=RDA9hcJgtnm6Q"
            //         title="Doja Cat - Say So (Official Video)" frameBorder="0"
            //         allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            //         allowFullScreen></iframe>
          //   let url = 'https://www.youtube.com/embed/pok8H_KF1FA?list=RDA9hcJgtnm6Q'
          //   iframeElement.setAttribute('src', url);
          //   iframeElement.setAttribute('width', '100%');
          //   iframeElement.setAttribute('height', '100%');
          // // imgElement.src = url
          // loader.classList.add('d-none')
          // selected__repo.appendChild(iframeElement);
        });
  }
}
