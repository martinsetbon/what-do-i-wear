class OutfitProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_outfit
  before_action :set_product, only: [:create, :destroy]

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

  # DELETE /outfits/:outfit_id/outfit_products/:id
  def destroy
    @outfit_product = @outfit.outfit_products.find(params[:id])
    @outfit_product.destroy
    redirect_to @outfit, notice: 'Product was successfully removed from the outfit.'
  end

  private

  def set_outfit
    @outfit = current_user.outfits.find(params[:outfit_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
