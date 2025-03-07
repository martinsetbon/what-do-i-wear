import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["editButton"];

  toggle() {
    this.editButtonTarget.classList.toggle("d-none");
  }
}
