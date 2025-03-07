import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';

// Connects to data-controller="swiper"
export default class extends Controller {
  static targets = ["swiper", "topInput", "bottomInput", "shoesInput", "total"]
  static values = {
    topPrice: Number,
    bottomPrice: Number,
    shoesPrice: Number
  }

  connect() {
    this.swiper = new Swiper(".swiper", {
      effect: "cards",
      grabCursor: true,
    })
    this.topPrice = Number(this.topPriceValue)
    this.bottomPrice = Number(this.bottomPriceValue)
    this.shoesPrice = Number(this.shoesPriceValue)
  }

  setNewProduct(e) {
    const el = e.currentTarget
    const id = el.dataset.id
    const productType = el.dataset.productType
    el.parentElement.querySelectorAll(".swiper-slide").forEach(slide=> slide.classList.remove('selected'))
    e.currentTarget.classList.add('selected')
    this[`${productType}InputTarget`].value = id
    this[`${productType}Price`] = Number(el.dataset.price)
    this.updateTotalPrice()
  }

  updateTotalPrice() {
    this.totalTarget.innerText = this.topPrice + this.bottomPrice + this.shoesPrice
  }
}
