import { Controller } from "@hotwired/stimulus"
// import about from "../channels/about_channel";

// Connects to data-controller="about"
export default class extends Controller {
  connect() {
    console.log('hello about')
    // about(1)
  }
}
