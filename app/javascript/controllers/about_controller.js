import { Controller } from "@hotwired/stimulus"
// import about from "../channels/about_channel";

// Connects to data-controller="about"
export default class extends Controller {
  static targets = ['loader', 'about_me']
  connect() {
    const loader = this.loaderTarget
    loader.classList.remove('d-none');
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

    fetch('/scrapper', {
      method: 'GET',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      }
    }).then((response) => response.json())
        .then((about)=>{
            const about_me = this.about_meTarget
          loader.classList.add('d-none');
          about.paragraphs.forEach((p)=> {
              const divElement = document.createElement('div')
              divElement.innerHTML = p
              about_me.append(divElement)
          })
          console.log(about_me)
        })
  }
}
