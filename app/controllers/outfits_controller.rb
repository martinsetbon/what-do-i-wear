class OutfitsController < ApplicationController
    before_action :authenticate_user!

      def index
        @outfits = current_user.outfits
        @closet_items = current_user.closet_items.includes(:product)
      end

  def show
    @outfit = Outfit.find(params[:id])
  end
  def new
    @outfit = Outfit.new
    # Fetch products by type
    @top_products = Product.where(product_type: 'top')
    @bottom_products = Product.where(product_type: 'bottom')
    @shoe_products = Product.where(product_type: 'shoes')
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user # Associate the user
    if @outfit.save
      redirect_to edit_outfit_path(@outfit), notice: "Outfit created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    redirect_to outfits_path, notice: "Outfit deleted successfully."
  end

  def edit
    @outfit = Outfit.find(params[:id])
    @outfit_product = OutfitProduct.new
    # Fetch products by type
    @top_products = Product.where(product_type: 'top')
    @top_choice1 = @top_products.sample
    @top_choice2 = @top_products.sample
    @bottom_products = Product.where(product_type: 'bottom')
    @bottom_choice1 = @bottom_products.sample
    @bottom_choice2 = @bottom_products.sample
    @shoe_products = Product.where(product_type: 'shoes')
    @shoe_choice1 = @shoe_products.sample
    @shoe_choice2 = @shoe_products.sample
  end

def update
  @outfit = Outfit.find(params[:id])
  @top_product = Product.find(params[:top])
  @outfit_product_top = OutfitProduct.create(outfit: @outfit, product: @top_product)
  @bottom_product = Product.find(params[:bottom])
  @outfit_product_bottom = OutfitProduct.create(outfit: @outfit, product: @bottom_product)
  @shoe_product = Product.find(params[:shoe])
  @outfit_product_shoe = OutfitProduct.create(outfit: @outfit, product: @shoe_product)

  if @outfit.update(outfit_params)
    redirect_to outfits_path
  else
    render :edit, status: :unprocessable_entity
  def index
    @outfits = current_user.outfits
    @closet_items = current_user.closet_items.includes(:product)
  end
end

  private

  # Only allow the photo parameter in the outfit_params
  def outfit_params
    params.require(:outfit).permit(:photo, :name, :budget, :season, :style, :gender)
    params.require(:outfit).permit(:photo, :season, :budget, :gender, :style)
  end

end
