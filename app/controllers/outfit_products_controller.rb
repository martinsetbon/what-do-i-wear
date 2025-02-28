class OutfitProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_outfit, except: [:destroy]
  before_action :set_product, only: [:create]

  # POST /outfits/:outfit_id/outfit_products
  def create
    # Associate the product with the outfit
    @outfit_product = @outfit.outfit_products.build(product: @product)
    if @outfit_product.save
      redirect_to @outfit, notice: 'Product was successfully added to the outfit.'
    else
      redirect_to @outfit, alert: 'Unable to add product to the outfit.'
    end
  end

  def destroy
    @outfit_product = OutfitProduct.find(params[:id])
    if @outfit_product
      @outfit_product.destroy
      redirect_to outfit_path(@outfit_product.outfit), notice: 'Product was successfully removed from the outfit.'
    else
      redirect_to outfit_path(@outfit_product.outfit), alert: 'Product not found in this outfit.'
    end
  end

  private

  def set_outfit
    @outfit = current_user.outfits.find(params[:outfit_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
