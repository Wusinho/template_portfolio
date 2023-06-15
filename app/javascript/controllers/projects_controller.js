import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="projects"
export default class extends Controller {
  connect() {
    console.log('Hello')
  }
}
