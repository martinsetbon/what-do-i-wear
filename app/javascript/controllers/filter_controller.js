import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["productImage", "productField", "productPrice", "backButton", "editButton"];

  connect() {
    // Get the products JSON from the data attribute
   const data = this.element.dataset.filterProducts;
  if (data && data !== "null" && data !== "") {
    try {
      this.products = JSON.parse(data);
    } catch (e) {
      console.error("Error parsing products JSON:", e);
      this.products = [];
    }
  } else {
    console.error("No products data found on element.");
    this.products = [];
  }
  // Safely initialize filteredProducts as a copy of products.
  this.filteredProducts = this.products.slice();
  const currentProductId = parseInt(this.productFieldTarget.value);
  const currentIndex = this.filteredProducts.findIndex(product => product.id === currentProductId);
  this.updateProductImage(currentIndex);
  this.updateTotalPrice();
}

  cycleProductImage(event) {
    event.preventDefault();
    // Defensive check: if filteredProducts is null or empty, do nothing.
    if (!this.filteredProducts || this.filteredProducts.length === 0) {
      console.log("No filtered products available to cycle through.");
      return;
    }
    const currentProductId = parseInt(this.productFieldTarget.value);
    const currentIndex = this.filteredProducts.findIndex(product => product.id === currentProductId);
    const nextIndex = (currentIndex + 1) % this.filteredProducts.length;
    const nextProduct = this.filteredProducts[nextIndex];
    // Update the display with the next product
    this.productImageTarget.src = nextProduct.image;
    this.productImageTarget.alt = nextProduct.name;
    this.productFieldTarget.value = nextProduct.id;
    this.productPriceTarget.textContent = nextProduct.price;
    this.updateTotalPrice();
  }

  back(event) {
    event.preventDefault();
    if (!this.filteredProducts || this.filteredProducts.length === 0) {
      console.log("No filtered products available to go back.");
      return;
    }
    const currentProductId = parseInt(this.productFieldTarget.value);
    const currentIndex = this.filteredProducts.findIndex(product => product.id === currentProductId);
    const previousIndex = (currentIndex - 1 + this.filteredProducts.length) % this.filteredProducts.length;
    const previousProduct = this.filteredProducts[previousIndex];
    this.productImageTarget.src = previousProduct.image;
    this.productImageTarget.alt = previousProduct.name;
    this.productFieldTarget.value = previousProduct.id;
    this.productPriceTarget.textContent = previousProduct.price;
    this.updateTotalPrice();
  }

  updateProductImage(index = 0) {
    if (this.filteredProducts && this.filteredProducts.length > 0) {
      const product = this.filteredProducts[index];
      this.productImageTarget.src = product.image;
      this.productImageTarget.alt = product.name;
      this.productFieldTarget.value = product.id;
      this.productPriceTarget.textContent = product.price;
    }
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
    event.preventDefault();
    const displayMode = this.element.querySelector('.display-mode');
    const editMode = this.element.querySelector('.edit-mode');
    if (displayMode && editMode) {
      displayMode.classList.toggle('d-none');
      editMode.classList.toggle('d-none');
    }
    if (this.hasEditButtonTarget) {
      this.editButtonTarget.classList.toggle('d-none');
    }
  }
}
