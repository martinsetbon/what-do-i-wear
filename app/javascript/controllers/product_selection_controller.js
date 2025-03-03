import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["topImage", "bottomImage", "shoeImage", "topField", "bottomField", "shoeField"];

  connect() {
    // Parse the JSON data passed from the backend and assign it to the class variables
    this.topProducts = JSON.parse(this.element.dataset.topProducts);
    this.bottomProducts = JSON.parse(this.element.dataset.bottomProducts);
    this.shoeProducts = JSON.parse(this.element.dataset.shoeProducts);

    // Log to confirm data is loaded
    console.log(this.topProducts);
    console.log(this.bottomProducts);
    console.log(this.shoeProducts);
  }

  changeTop(event) {
    if (this.topProducts && this.topProducts.length > 0) {
      const currentIndex = this.topProducts.findIndex(product => product.id === parseInt(this.topFieldTarget.value));
      const nextIndex = (currentIndex + 1) % this.topProducts.length;  // Loop back to the first product if at the last one
      this.topImageTarget.src = this.topProducts[nextIndex].image;  // Update the image
      this.topFieldTarget.value = this.topProducts[nextIndex].id;  // Update the hidden field with the product id
    } else {
      console.error("Top products are not available or empty");
    }
  }

  changeBottom(event) {
    if (this.bottomProducts && this.bottomProducts.length > 0) {
      const currentIndex = this.bottomProducts.findIndex(product => product.id === parseInt(this.bottomFieldTarget.value));
      const nextIndex = (currentIndex + 1) % this.bottomProducts.length;  // Loop back to the first product if at the last one
      this.bottomImageTarget.src = this.bottomProducts[nextIndex].image;  // Update the image
      this.bottomFieldTarget.value = this.bottomProducts[nextIndex].id;  // Update the hidden field with the product id
    } else {
      console.error("Bottom products are not available or empty");
    }
  }

  changeShoe(event) {
    if (this.shoeProducts && this.shoeProducts.length > 0) {
      const currentIndex = this.shoeProducts.findIndex(product => product.id === parseInt(this.shoeFieldTarget.value));
      const nextIndex = (currentIndex + 1) % this.shoeProducts.length;  // Loop back to the first product if at the last one
      this.shoeImageTarget.src = this.shoeProducts[nextIndex].image;  // Update the image
      this.shoeFieldTarget.value = this.shoeProducts[nextIndex].id;  // Update the hidden field with the product id
    } else {
      console.error("Shoe products are not available or empty");
    }
  }
}
