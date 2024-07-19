import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["notice"]

  noticeTargetConnected = (target) => {
    setTimeout(function() {
      return target.style.display = "none";
    }, 3000);
  }
}