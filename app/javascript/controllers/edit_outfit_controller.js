import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["productPrice", "totalPrice"];

  connect() {
    // Get the products JSON from the data attribute
    console.log("editOutfit");

  this.updateTotalPrice();
}


  updateTotalPrice() {
    console.log(this.totalPriceTarget);
    if (!this.hasTotalPriceTarget) return;


    let total = 0;
    this.productPriceTargets.forEach(priceElement => {
      total += parseFloat(priceElement.textContent.replace("$", "")) || 0;
    });
    console.log(total);

    this.totalPriceTarget.textContent = `$${total.toFixed(2)}`;
  }

  toggleEdit(event) {
    console.log("edit");

    event.preventDefault();
    const displayMode = this.element.querySelector('.display-mode');
    const editMode = this.element.querySelector('.edit-mode');
    if (displayMode && editMode) {
      displayMode.classList.toggle('d-none');
      editMode.classList.toggle('d-none');
    }
  }
}
