import { Controller } from "@hotwired/stimulus"
import { Sortable, Swap } from 'sortablejs';

// Connects to data-controller="product-swap"
export default class extends Controller {
  static targets = ["top", "bottom", "shoes"]
  connect() {
    try {
      Sortable.mount(new Swap());
    } catch (error) {
    }


    function updateOutfit(evt) {
      const draggedProduct = evt.item;  // dragged HTMLElement
      const outfitProductIdNew = evt.to.id;    // target list
      const outfitProductIdOld = evt.from.id;  // previous list
      const draggedProductId = draggedProduct.id
      const replacedProductId = evt.from.firstElementChild.id

      const formDataOne = new FormData()
      formDataOne.append('outfit_product[product_id]', draggedProductId)

      fetch(`/outfit_products/${outfitProductIdNew}`, {
        method: "put",
        headers: {
          "X-CSRF-Token": document.head.querySelector('meta[name="csrf-token"]').content,
          "Accept": "application/json"
        },
        body: formDataOne
      }).then(response=>response.json())
      .then(data=>{
        const id = `total-price-${data.id}`
        document.getElementById(id).innerText = data.sum
      })

      const formDataTwo = new FormData()
      formDataTwo.append('outfit_product[product_id]', replacedProductId)

      fetch(`/outfit_products/${outfitProductIdOld}`, {
        method: "put",
        headers: {
          "X-CSRF-Token": document.head.querySelector('meta[name="csrf-token"]').content,
          "Accept": "application/json"
        },
        body: formDataTwo
      }).then(response=>response.json())
      .then(data=>{
        const id = `total-price-${data.id}`
        document.getElementById(id).innerText = `$${data.sum}`
      })
    }

    // const groups = [this.topTargets, this.bottomTargets, this.shoesTargets]

    this.topTargets.forEach(top => {
      new Sortable(top.parentElement, {
          group: 'top', // set both lists to same group
          animation: 150,
          swap: true,
          swapClass: "highlighted",
          onEnd: function (evt) {
            updateOutfit(evt)
          }
        });
    });
    this.bottomTargets.forEach(bottom => {
      new Sortable(bottom.parentElement, {
          group: 'bottom', // set both lists to same group
          animation: 150,
          swap: true,
          swapClass: "highlighted",
          onEnd: function (evt) {
            updateOutfit(evt)
          }
        });
    });
    this.shoesTargets.forEach(shoes => {
      new Sortable(shoes.parentElement, {
          group: 'shoes', // set both lists to same group
          animation: 150,
          swap: true,
          swapClass: "highlighted",
          onEnd: function (evt) {
            updateOutfit(evt)
          }
        });
    });
  }
}
