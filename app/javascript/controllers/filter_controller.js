import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["productImage", "productField", "seasonSelect", "styleSelect", "genderSelect", "productPrice"];

  connect() {
    // Ensure all product data is passed correctly into the controller
    this.products = JSON.parse(this.element.dataset.filterProducts);
    this.filteredProducts = this.products;  // Initially all products are shown

    // Check if products are available
    if (this.filteredProducts.length > 0) {
      this.updateProductImage();  // Initial product
    } else {
      console.error("No filtered products available.");
    }
  }

  applyFilters() {
    // Get selected filter values
    const selectedSeason = this.seasonSelectTarget.value;
    const selectedStyle = this.styleSelectTarget.value;
    const selectedGender = this.genderSelectTarget.value;

    // Filter products based on selected values
    this.filteredProducts = this.products.filter(product => {
      let matches = true;
      if (selectedSeason && !product.season.includes(selectedSeason)) {
        matches = false;
      }
      if (selectedStyle && product.style !== selectedStyle) {
        matches = false;
      }
      if (selectedGender && product.gender !== selectedGender) {
        matches = false;
      }
      return matches;
    });

    // If no products match, show a warning
    if (this.filteredProducts.length === 0) {
      console.log("No products match your filters.");
    }

    // Update the product image with the first filtered product (if any)
    this.updateProductImage();
  }

  cycleProductImage(event) {
    if (this.filteredProducts.length === 0) {
      console.log("No filtered products available to cycle through.");
      return;
    }

    const currentProductId = parseInt(this.productFieldTarget.value);
    const currentIndex = this.filteredProducts.findIndex(product => product.id === currentProductId);
    const nextIndex = (currentIndex + 1) % this.filteredProducts.length; // Loop back to the first product if at the last one

    const nextProduct = this.filteredProducts[nextIndex];

    // Update the image and hidden field with the next product
    this.productImageTarget.src = nextProduct.image;
    this.productFieldTarget.value = nextProduct.id;
    this.productPriceTarget.textContent = nextProduct.price;
  }

  updateProductImage() {
    if (this.filteredProducts.length > 0) {
      const firstProduct = this.filteredProducts[0]; // Use the first filtered product
      this.productImageTarget.src = firstProduct.image;
      this.productFieldTarget.value = firstProduct.id;
      this.productPriceTarget.textContent = firstProduct.price;
    }
  }
}
