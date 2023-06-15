import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="projects"
export default class extends Controller {
  connect() {
  }

  click(e) {
    e.preventDefault()
    console.log('this is project controller')
  }
}
